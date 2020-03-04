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
theory bdrv_pwrite_em
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes bdrv_write_0x1898c_retval\<^sub>v bdrv_read_0x189c8_retval\<^sub>v memcpy_chk_0x189df_retval\<^sub>v bdrv_write_0x189f2_retval\<^sub>v bdrv_read_0x18a23_retval\<^sub>v rep_movs_ESRDI_DSRSI_0x18a9c_retval\<^sub>v bdrv_write_0x18aae_retval\<^sub>v stack_chk_fail_0x18aec_retval\<^sub>v memcpy_chk_addr stack_chk_fail_addr bdrv_read_addr bdrv_write_addr rep_movs_ESRDI_DSRSI_addr :: \<open>64 word\<close>
    and memcpy_chk_acode stack_chk_fail_acode bdrv_read_acode bdrv_write_acode rep_movs_ESRDI_DSRSI_acode :: ACode
  assumes fetch:
    "fetch 0x188f0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x188f2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x188f5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x188f7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x188fa \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x188fc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x188ff \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x18901 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x18904 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x18905 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x18906 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x18908 \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1890a \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 511)), 6)"
    "fetch 0x18910 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 552)), 7)"
    "fetch 0x18917 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General SixtyFour rdi))), 4)"
    "fetch 0x1891b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x18924 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 536)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x1892c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1892e \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18930 \<equiv> (Binary (IS_PentiumPro Cmovle) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x18933 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour r13)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x18937 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18939 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 100880)), 6)"
    "fetch 0x1893f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x18942 \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x18945 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18947 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 100736)), 2)"
    "fetch 0x18949 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1894c \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 100785)), 2)"
    "fetch 0x1894e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x18951 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 536))))), 8)"
    "fetch 0x18959 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x18962 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 101100)), 6)"
    "fetch 0x18968 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 552)), 7)"
    "fetch 0x1896f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x18970 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x18971 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x18973 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x18975 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x18977 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x18979 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1897a \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x18980 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x18984 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18986 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x18989 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1898c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_write'')), 5)"
    "fetch 0x18991 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x18993 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 100864)), 2)"
    "fetch 0x18995 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x18998 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rbx)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x1899b \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294966784)), 5)"
    "fetch 0x189a0 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x189a3 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x189a6 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x189a9 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x189ac \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x189af \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 100686)), 2)"
    "fetch 0x189b1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x189b5 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0x189ba \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x189bf \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x189c2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x189c5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x189c8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_read'')), 5)"
    "fetch 0x189cd \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x189cf \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 100864)), 2)"
    "fetch 0x189d1 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x189d4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0x189d9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x189dc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x189df \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__memcpy_chk'')), 5)"
    "fetch 0x189e4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x189e9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x189ec \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x189ef \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x189f2 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_write'')), 5)"
    "fetch 0x189f7 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x189f9 \<equiv> (Unary (IS_8088 Jns) (Immediate SixtyFour (ImmVal 100686)), 6)"
    "fetch 0x189ff \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x18a00 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967291)), 5)"
    "fetch 0x18a05 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 100689)), 5)"
    "fetch 0x18a0a \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x18a10 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0x18a15 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x18a18 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x18a1d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x18a20 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x18a23 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_read'')), 5)"
    "fetch 0x18a28 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x18a2a \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 100864)), 2)"
    "fetch 0x18a2c \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x18a2f \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 511)), 6)"
    "fetch 0x18a35 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x18a3a \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x18a3d \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 8)), 3)"
    "fetch 0x18a40 \<equiv> (Unary (IS_8088 Jae) (Immediate SixtyFour (ImmVal 100976)), 2)"
    "fetch 0x18a42 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rbx)) (Immediate SixtyFour (ImmVal 4)), 3)"
    "fetch 0x18a45 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 101080)), 6)"
    "fetch 0x18a4b \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18a4d \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 101023)), 2)"
    "fetch 0x18a4f \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour r12))))), 5)"
    "fetch 0x18a54 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x18a57 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rbx)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x18a5a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 101023)), 2)"
    "fetch 0x18a5c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18a5e \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour r12)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 2)))))), 6)"
    "fetch 0x18a64 \<equiv> (Binary (IS_8088 Mov) (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 2))))) (Storage (Reg (General Sixteen rdx))), 5)"
    "fetch 0x18a69 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 101023)), 2)"
    "fetch 0x18a6b \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x18a70 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r12))))), 4)"
    "fetch 0x18a74 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 8)))), 4)"
    "fetch 0x18a78 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x18a7b \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 18446744073709551608)), 4)"
    "fetch 0x18a7f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x18a83 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18a85 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 8)))))), 5)"
    "fetch 0x18a8a \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 8))))) (Storage (Reg (General SixtyFour rdx))), 5)"
    "fetch 0x18a8f \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x18a92 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x18a95 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18a97 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 3)), 3)"
    "fetch 0x18a9a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x18a9c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''rep_movs_ESRDI_DSRSI'')), 3)"
    "fetch 0x18a9f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x18aa3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x18aa8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x18aab \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x18aae \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_write'')), 5)"
    "fetch 0x18ab3 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x18ab5 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 100864)), 6)"
    "fetch 0x18abb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x18abe \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r13)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x18ac2 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x18ac7 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x18aca \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 100671)), 6)"
    "fetch 0x18ad0 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 100686)), 5)"
    "fetch 0x18ad5 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x18ad8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour r12))))), 4)"
    "fetch 0x18adc \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x18adf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18ae1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 4)))))), 5)"
    "fetch 0x18ae6 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 4))))) (Storage (Reg (General ThirtyTwo rdx))), 4)"
    "fetch 0x18aea \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 101023)), 2)"
    "fetch 0x18aec \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x18af1 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and memcpy_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__memcpy_chk'') = memcpy_chk_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and bdrv_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_read'') = bdrv_read_addr\<close>
    and bdrv_write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_write'') = bdrv_write_addr\<close>
    and rep_movs_ESRDI_DSRSI\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''rep_movs_ESRDI_DSRSI'') = rep_movs_ESRDI_DSRSI_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>bdrv_write_0x1898c_retval \<equiv> bdrv_write_0x1898c_retval\<^sub>v\<close>
definition \<open>bdrv_read_0x189c8_retval \<equiv> bdrv_read_0x189c8_retval\<^sub>v\<close>
definition \<open>memcpy_chk_0x189df_retval \<equiv> memcpy_chk_0x189df_retval\<^sub>v\<close>
definition \<open>bdrv_write_0x189f2_retval \<equiv> bdrv_write_0x189f2_retval\<^sub>v\<close>
definition \<open>bdrv_read_0x18a23_retval \<equiv> bdrv_read_0x18a23_retval\<^sub>v\<close>
definition \<open>rep_movs_ESRDI_DSRSI_0x18a9c_retval \<equiv> rep_movs_ESRDI_DSRSI_0x18a9c_retval\<^sub>v\<close>
definition \<open>bdrv_write_0x18aae_retval \<equiv> bdrv_write_0x18aae_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x18aec_retval \<equiv> stack_chk_fail_0x18aec_retval\<^sub>v\<close>

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

locale "bdrv_pwrite_em" = "qemu_img_xen" +
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

definition P_0x188f0_0 :: state_pred where
  \<open>P_0x188f0_0 \<sigma> \<equiv> RIP \<sigma> = 0x188f0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x188f0_0_def[Ps]

definition P_0x188f0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x188f0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x188f0_0_regions :: state_pred where
  \<open>P_0x188f0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x188f0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18939_0 :: state_pred where
  \<open>Q_0x18939_0 \<sigma> \<equiv> RIP \<sigma> = 0x18939 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18939_0_def[Qs]

schematic_goal bdrv_pwrite_em_0_22_0x188f0_0x18937_0[blocks]:
  assumes \<open>(P_0x188f0_0 && P_0x188f0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 22 0x18937 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18939_0 ?\<sigma> \<and> block_usage P_0x188f0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x188f0_0_def P_0x188f0_0_regions_def post: Q_0x18939_0_def regionset: P_0x188f0_0_regions_set_def)

definition P_0x18939_true_1 :: state_pred where
  \<open>P_0x18939_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x18939 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18939_true_1_def[Ps]

definition P_0x18939_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18939_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x18939_true_1_regions :: state_pred where
  \<open>P_0x18939_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x18939_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a23_1 :: state_pred where
  \<open>Q_0x18a23_1 \<sigma> \<equiv> RIP \<sigma> = 0x18a23 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18a23_1_def[Qs]

schematic_goal bdrv_pwrite_em_0_6_0x18939_0x18a20_1[blocks]:
  assumes \<open>(P_0x18939_true_1 && P_0x18939_true_1_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 6 0x18a20 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a23_1 ?\<sigma> \<and> block_usage P_0x18939_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18939_true_1_def P_0x18939_true_1_regions_def post: Q_0x18a23_1_def regionset: P_0x18939_true_1_regions_set_def)

definition P_0x18a23_2 :: state_pred where
  \<open>P_0x18a23_2 \<sigma> \<equiv> RIP \<sigma> = 0x18a23 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18a23_2_def[Ps]

definition P_0x18a23_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a23_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a23_2_regions :: state_pred where
  \<open>P_0x18a23_2_regions \<sigma> \<equiv> \<exists>regions. P_0x18a23_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x18a23_2 :: state_pred where
  \<open>Q_bdrv_read_addr_0x18a23_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare Q_bdrv_read_addr_0x18a23_2_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18a23_0x18a23_2[blocks]:
  assumes \<open>(P_0x18a23_2 && P_0x18a23_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18a23 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x18a23_2 ?\<sigma> \<and> block_usage P_0x18a23_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a23_2_def P_0x18a23_2_regions_def post: Q_bdrv_read_addr_0x18a23_2_def regionset: P_0x18a23_2_regions_set_def)

definition P_0x18a28_3 :: state_pred where
  \<open>P_0x18a28_3 \<sigma> \<equiv> RIP \<sigma> = 0x18a28 \<and> RAX \<sigma> = bdrv_read_0x18a23_retval \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare P_0x18a28_3_def[Ps]

definition P_0x18a28_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a28_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a28_3_regions :: state_pred where
  \<open>P_0x18a28_3_regions \<sigma> \<equiv> \<exists>regions. P_0x18a28_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a2a_3 :: state_pred where
  \<open>Q_0x18a2a_3 \<sigma> \<equiv> RIP \<sigma> = 0x18a2a \<and> RAX \<sigma> = bdrv_read_0x18a23_retval \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare Q_0x18a2a_3_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18a28_0x18a28_3[blocks]:
  assumes \<open>(P_0x18a28_3 && P_0x18a28_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18a28 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a2a_3 ?\<sigma> \<and> block_usage P_0x18a28_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a28_3_def P_0x18a28_3_regions_def post: Q_0x18a2a_3_def regionset: P_0x18a28_3_regions_set_def)

definition P_0x18a2a_true_4 :: state_pred where
  \<open>P_0x18a2a_true_4 \<sigma> \<equiv> RIP \<sigma> = 0x18a2a \<and> RAX \<sigma> = bdrv_read_0x18a23_retval \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare P_0x18a2a_true_4_def[Ps]

definition P_0x18a2a_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a2a_true_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a2a_true_4_regions :: state_pred where
  \<open>P_0x18a2a_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0x18a2a_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_4 :: state_pred where
  \<open>Q_0x18951_4 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_4_def[Qs]

schematic_goal bdrv_pwrite_em_0_3_0x18a2a_0x18a05_4[blocks]:
  assumes \<open>(P_0x18a2a_true_4 && P_0x18a2a_true_4_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x18a05 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_4 ?\<sigma> \<and> block_usage P_0x18a2a_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a2a_true_4_def P_0x18a2a_true_4_regions_def post: Q_0x18951_4_def regionset: P_0x18a2a_true_4_regions_set_def)

definition P_0x18a2a_false_5 :: state_pred where
  \<open>P_0x18a2a_false_5 \<sigma> \<equiv> RIP \<sigma> = 0x18a2a \<and> RAX \<sigma> = bdrv_read_0x18a23_retval \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare P_0x18a2a_false_5_def[Ps]

definition P_0x18a2a_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a2a_false_5_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a2a_false_5_regions :: state_pred where
  \<open>P_0x18a2a_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0x18a2a_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a40_5 :: state_pred where
  \<open>Q_0x18a40_5 \<sigma> \<equiv> RIP \<sigma> = 0x18a40 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare Q_0x18a40_5_def[Qs]

schematic_goal bdrv_pwrite_em_0_6_0x18a2a_0x18a3d_5[blocks]:
  assumes \<open>(P_0x18a2a_false_5 && P_0x18a2a_false_5_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 6 0x18a3d 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a40_5 ?\<sigma> \<and> block_usage P_0x18a2a_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a2a_false_5_def P_0x18a2a_false_5_regions_def post: Q_0x18a40_5_def regionset: P_0x18a2a_false_5_regions_set_def)

definition P_0x18a40_true_6 :: state_pred where
  \<open>P_0x18a40_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x18a40 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare P_0x18a40_true_6_def[Ps]

definition P_0x18a40_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a40_true_6_regions_set \<sigma> \<equiv> {
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
    (11, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8), 8),
    (14, ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250), 8),
    (15, ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248), 8)
  }\<close>

definition P_0x18a40_true_6_regions :: state_pred where
  \<open>P_0x18a40_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x18a40_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a9c_6 :: state_pred where
  \<open>Q_0x18a9c_6 \<sigma> \<equiv> RIP \<sigma> = 0x18a9c \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x240)::64 word) AND 0xfffffffffffffff8))::64 word) - 0x248)::32 word)::32 word) + (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) \<and> RDI \<sigma> = ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x240)::64 word) AND 0xfffffffffffffff8) \<and> RSI \<sigma> = ((((((RDX\<^sub>0::64 word) - ((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word)))::64 word) + ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x240)::64 word) AND 0xfffffffffffffff8))::64 word) + 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x240)::64 word) AND 0xfffffffffffffff8))::64 word) - 0x248)::32 word)::32 word) + (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >> 3)) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28 \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250),8]::64 word) = (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248),8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)\<close>
declare Q_0x18a9c_6_def[Qs]

schematic_goal bdrv_pwrite_em_0_14_0x18a40_0x18a9a_6[blocks]:
  assumes \<open>(P_0x18a40_true_6 && P_0x18a40_true_6_regions && !CF) \<sigma>\<close>
  shows \<open>exec_block 14 0x18a9a 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a9c_6 ?\<sigma> \<and> block_usage P_0x18a40_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a40_true_6_def P_0x18a40_true_6_regions_def post: Q_0x18a9c_6_def regionset: P_0x18a40_true_6_regions_set_def)

definition P_0x18a9c_7 :: state_pred where
  \<open>P_0x18a9c_7 \<sigma> \<equiv> RIP \<sigma> = 0x18a9c \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x240)::64 word) AND 0xfffffffffffffff8))::64 word) - 0x248)::32 word)::32 word) + (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) \<and> RDI \<sigma> = ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x240)::64 word) AND 0xfffffffffffffff8) \<and> RSI \<sigma> = ((((((RDX\<^sub>0::64 word) - ((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word)))::64 word) + ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x240)::64 word) AND 0xfffffffffffffff8))::64 word) + 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x240)::64 word) AND 0xfffffffffffffff8))::64 word) - 0x248)::32 word)::32 word) + (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >> 3)) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28 \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250),8]::64 word) = (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248),8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)\<close>
declare P_0x18a9c_7_def[Ps]

definition P_0x18a9c_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a9c_7_regions_set \<sigma> \<equiv> {
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
    (11, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8), 8),
    (14, ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250), 8),
    (15, ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248), 8)
  }\<close>

definition P_0x18a9c_7_regions :: state_pred where
  \<open>P_0x18a9c_7_regions \<sigma> \<equiv> \<exists>regions. P_0x18a9c_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_rep_movs_ESRDI_DSRSI_addr_0x18a9c_7 :: state_pred where
  \<open>Q_rep_movs_ESRDI_DSRSI_addr_0x18a9c_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = rep_movs_ESRDI_DSRSI_addr \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_rep_movs_ESRDI_DSRSI_addr_0x18a9c_7_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18a9c_0x18a9c_7[blocks]:
  assumes \<open>(P_0x18a9c_7 && P_0x18a9c_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18a9c 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_rep_movs_ESRDI_DSRSI_addr_0x18a9c_7 ?\<sigma> \<and> block_usage P_0x18a9c_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a9c_7_def P_0x18a9c_7_regions_def post: Q_rep_movs_ESRDI_DSRSI_addr_0x18a9c_7_def regionset: P_0x18a9c_7_regions_set_def)

definition P_0x18a40_false_8 :: state_pred where
  \<open>P_0x18a40_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x18a40 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare P_0x18a40_false_8_def[Ps]

definition P_0x18a40_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a40_false_8_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a40_false_8_regions :: state_pred where
  \<open>P_0x18a40_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x18a40_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a45_8 :: state_pred where
  \<open>Q_0x18a45_8 \<sigma> \<equiv> RIP \<sigma> = 0x18a45 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare Q_0x18a45_8_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x18a40_0x18a42_8[blocks]:
  assumes \<open>(P_0x18a40_false_8 && P_0x18a40_false_8_regions && ! !CF) \<sigma>\<close>
  shows \<open>exec_block 2 0x18a42 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a45_8 ?\<sigma> \<and> block_usage P_0x18a40_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a40_false_8_def P_0x18a40_false_8_regions_def post: Q_0x18a45_8_def regionset: P_0x18a40_false_8_regions_set_def)

definition P_0x18a45_true_9 :: state_pred where
  \<open>P_0x18a45_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x18a45 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare P_0x18a45_true_9_def[Ps]

definition P_0x18a45_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a45_true_9_regions_set \<sigma> \<equiv> {
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
    (11, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x4), 4),
    (14, ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x24c), 4),
    (15, ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248), 4)
  }\<close>

definition P_0x18a45_true_9_regions :: state_pred where
  \<open>P_0x18a45_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x18a45_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a9f_9 :: state_pred where
  \<open>Q_0x18a9f_9 \<sigma> \<equiv> RIP \<sigma> = 0x18a9f \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18a9f_9_def[Qs]

schematic_goal bdrv_pwrite_em_0_7_0x18a45_0x18aea_9[blocks]:
  assumes \<open>(P_0x18a45_true_9 && P_0x18a45_true_9_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x18aea 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a9f_9 ?\<sigma> \<and> block_usage P_0x18a45_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a45_true_9_def P_0x18a45_true_9_regions_def post: Q_0x18a9f_9_def regionset: P_0x18a45_true_9_regions_set_def)

definition P_0x18a45_false_10 :: state_pred where
  \<open>P_0x18a45_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x18a45 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare P_0x18a45_false_10_def[Ps]

definition P_0x18a45_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a45_false_10_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a45_false_10_regions :: state_pred where
  \<open>P_0x18a45_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x18a45_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a4d_10 :: state_pred where
  \<open>Q_0x18a4d_10 \<sigma> \<equiv> RIP \<sigma> = 0x18a4d \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare Q_0x18a4d_10_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x18a45_0x18a4b_10[blocks]:
  assumes \<open>(P_0x18a45_false_10 && P_0x18a45_false_10_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x18a4b 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a4d_10 ?\<sigma> \<and> block_usage P_0x18a45_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a45_false_10_def P_0x18a45_false_10_regions_def post: Q_0x18a4d_10_def regionset: P_0x18a45_false_10_regions_set_def)

definition P_0x18a4d_true_11 :: state_pred where
  \<open>P_0x18a4d_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x18a4d \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare P_0x18a4d_true_11_def[Ps]

definition P_0x18a4d_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a4d_true_11_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a4d_true_11_regions :: state_pred where
  \<open>P_0x18a4d_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x18a4d_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a9f_11 :: state_pred where
  \<open>Q_0x18a9f_11 \<sigma> \<equiv> RIP \<sigma> = 0x18a9f \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18a9f_11_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18a4d_0x18a4d_11[blocks]:
  assumes \<open>(P_0x18a4d_true_11 && P_0x18a4d_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18a4d 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a9f_11 ?\<sigma> \<and> block_usage P_0x18a4d_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a4d_true_11_def P_0x18a4d_true_11_regions_def post: Q_0x18a9f_11_def regionset: P_0x18a4d_true_11_regions_set_def)

definition P_0x18a4d_false_12 :: state_pred where
  \<open>P_0x18a4d_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x18a4d \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28\<close>
declare P_0x18a4d_false_12_def[Ps]

definition P_0x18a4d_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a4d_false_12_regions_set \<sigma> \<equiv> {
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
    (11, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (13, ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248), Suc 0)
  }\<close>

definition P_0x18a4d_false_12_regions :: state_pred where
  \<open>P_0x18a4d_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x18a4d_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a5a_12 :: state_pred where
  \<open>Q_0x18a5a_12 \<sigma> \<equiv> RIP \<sigma> = 0x18a5a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28 \<and> (\<sigma> \<turnstile> *[((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248),1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word))\<close>
declare Q_0x18a5a_12_def[Qs]

schematic_goal bdrv_pwrite_em_0_4_0x18a4d_0x18a57_12[blocks]:
  assumes \<open>(P_0x18a4d_false_12 && P_0x18a4d_false_12_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x18a57 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a5a_12 ?\<sigma> \<and> block_usage P_0x18a4d_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a4d_false_12_def P_0x18a4d_false_12_regions_def post: Q_0x18a5a_12_def regionset: P_0x18a4d_false_12_regions_set_def)

definition P_0x18a5a_true_13 :: state_pred where
  \<open>P_0x18a5a_true_13 \<sigma> \<equiv> RIP \<sigma> = 0x18a5a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28 \<and> (\<sigma> \<turnstile> *[((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248),1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word))\<close>
declare P_0x18a5a_true_13_def[Ps]

definition P_0x18a5a_true_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a5a_true_13_regions_set \<sigma> \<equiv> {
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
    (11, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (13, ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248), Suc 0)
  }\<close>

definition P_0x18a5a_true_13_regions :: state_pred where
  \<open>P_0x18a5a_true_13_regions \<sigma> \<equiv> \<exists>regions. P_0x18a5a_true_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a9f_13 :: state_pred where
  \<open>Q_0x18a9f_13 \<sigma> \<equiv> RIP \<sigma> = 0x18a9f \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18a9f_13_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18a5a_0x18a5a_13[blocks]:
  assumes \<open>(P_0x18a5a_true_13 && P_0x18a5a_true_13_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18a5a 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a9f_13 ?\<sigma> \<and> block_usage P_0x18a5a_true_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a5a_true_13_def P_0x18a5a_true_13_regions_def post: Q_0x18a9f_13_def regionset: P_0x18a5a_true_13_regions_set_def)

definition P_0x18a5a_false_14 :: state_pred where
  \<open>P_0x18a5a_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x18a5a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18a28 \<and> (\<sigma> \<turnstile> *[((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248),1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word))\<close>
declare P_0x18a5a_false_14_def[Ps]

definition P_0x18a5a_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a5a_false_14_regions_set \<sigma> \<equiv> {
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
    (11, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x2), 2),
    (14, ((((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x24a), 2),
    (15, ((((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) + (RSP\<^sub>0::64 word))::64 word) - 0x248), Suc 0)
  }\<close>

definition P_0x18a5a_false_14_regions :: state_pred where
  \<open>P_0x18a5a_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x18a5a_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a9f_14 :: state_pred where
  \<open>Q_0x18a9f_14 \<sigma> \<equiv> RIP \<sigma> = 0x18a9f \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18a9f_14_def[Qs]

schematic_goal bdrv_pwrite_em_0_5_0x18a5a_0x18a69_14[blocks]:
  assumes \<open>(P_0x18a5a_false_14 && P_0x18a5a_false_14_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x18a69 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a9f_14 ?\<sigma> \<and> block_usage P_0x18a5a_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a5a_false_14_def P_0x18a5a_false_14_regions_def post: Q_0x18a9f_14_def regionset: P_0x18a5a_false_14_regions_set_def)

definition P_0x18a9f_15 :: state_pred where
  \<open>P_0x18a9f_15 \<sigma> \<equiv> RIP \<sigma> = 0x18a9f \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18a9f_15_def[Ps]

definition P_0x18a9f_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a9f_15_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x18a9f_15_regions :: state_pred where
  \<open>P_0x18a9f_15_regions \<sigma> \<equiv> \<exists>regions. P_0x18a9f_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18aae_15 :: state_pred where
  \<open>Q_0x18aae_15 \<sigma> \<equiv> RIP \<sigma> = 0x18aae \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18aae_15_def[Qs]

schematic_goal bdrv_pwrite_em_0_4_0x18a9f_0x18aab_15[blocks]:
  assumes \<open>(P_0x18a9f_15 && P_0x18a9f_15_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x18aab 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18aae_15 ?\<sigma> \<and> block_usage P_0x18a9f_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a9f_15_def P_0x18a9f_15_regions_def post: Q_0x18aae_15_def regionset: P_0x18a9f_15_regions_set_def)

definition P_0x18aae_16 :: state_pred where
  \<open>P_0x18aae_16 \<sigma> \<equiv> RIP \<sigma> = 0x18aae \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18aae_16_def[Ps]

definition P_0x18aae_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18aae_16_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18aae_16_regions :: state_pred where
  \<open>P_0x18aae_16_regions \<sigma> \<equiv> \<exists>regions. P_0x18aae_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_write_addr_0x18aae_16 :: state_pred where
  \<open>Q_bdrv_write_addr_0x18aae_16 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_write_addr \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare Q_bdrv_write_addr_0x18aae_16_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18aae_0x18aae_16[blocks]:
  assumes \<open>(P_0x18aae_16 && P_0x18aae_16_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18aae 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_write_addr_0x18aae_16 ?\<sigma> \<and> block_usage P_0x18aae_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18aae_16_def P_0x18aae_16_regions_def post: Q_bdrv_write_addr_0x18aae_16_def regionset: P_0x18aae_16_regions_set_def)

definition P_0x18ab3_17 :: state_pred where
  \<open>P_0x18ab3_17 \<sigma> \<equiv> RIP \<sigma> = 0x18ab3 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x18ab3_17_def[Ps]

definition P_0x18ab3_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18ab3_17_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18ab3_17_regions :: state_pred where
  \<open>P_0x18ab3_17_regions \<sigma> \<equiv> \<exists>regions. P_0x18ab3_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18ab5_17 :: state_pred where
  \<open>Q_0x18ab5_17 \<sigma> \<equiv> RIP \<sigma> = 0x18ab5 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare Q_0x18ab5_17_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18ab3_0x18ab3_17[blocks]:
  assumes \<open>(P_0x18ab3_17 && P_0x18ab3_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18ab3 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18ab5_17 ?\<sigma> \<and> block_usage P_0x18ab3_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18ab3_17_def P_0x18ab3_17_regions_def post: Q_0x18ab5_17_def regionset: P_0x18ab3_17_regions_set_def)

definition P_0x18ab5_true_18 :: state_pred where
  \<open>P_0x18ab5_true_18 \<sigma> \<equiv> RIP \<sigma> = 0x18ab5 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x18ab5_true_18_def[Ps]

definition P_0x18ab5_true_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18ab5_true_18_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18ab5_true_18_regions :: state_pred where
  \<open>P_0x18ab5_true_18_regions \<sigma> \<equiv> \<exists>regions. P_0x18ab5_true_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_18 :: state_pred where
  \<open>Q_0x18951_18 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_18_def[Qs]

schematic_goal bdrv_pwrite_em_0_3_0x18ab5_0x18a05_18[blocks]:
  assumes \<open>(P_0x18ab5_true_18 && P_0x18ab5_true_18_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x18a05 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_18 ?\<sigma> \<and> block_usage P_0x18ab5_true_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18ab5_true_18_def P_0x18ab5_true_18_regions_def post: Q_0x18951_18_def regionset: P_0x18ab5_true_18_regions_set_def)

definition P_0x18ab5_false_19 :: state_pred where
  \<open>P_0x18ab5_false_19 \<sigma> \<equiv> RIP \<sigma> = 0x18ab5 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x18ab5_false_19_def[Ps]

definition P_0x18ab5_false_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18ab5_false_19_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18ab5_false_19_regions :: state_pred where
  \<open>P_0x18ab5_false_19_regions \<sigma> \<equiv> \<exists>regions. P_0x18ab5_false_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18aca_19 :: state_pred where
  \<open>Q_0x18aca_19 \<sigma> \<equiv> RIP \<sigma> = 0x18aca \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare Q_0x18aca_19_def[Qs]

schematic_goal bdrv_pwrite_em_0_5_0x18ab5_0x18ac7_19[blocks]:
  assumes \<open>(P_0x18ab5_false_19 && P_0x18ab5_false_19_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x18ac7 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18aca_19 ?\<sigma> \<and> block_usage P_0x18ab5_false_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18ab5_false_19_def P_0x18ab5_false_19_regions_def post: Q_0x18aca_19_def regionset: P_0x18ab5_false_19_regions_set_def)

definition P_0x18aca_true_20 :: state_pred where
  \<open>P_0x18aca_true_20 \<sigma> \<equiv> RIP \<sigma> = 0x18aca \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x18aca_true_20_def[Ps]

definition P_0x18aca_true_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18aca_true_20_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18aca_true_20_regions :: state_pred where
  \<open>P_0x18aca_true_20_regions \<sigma> \<equiv> \<exists>regions. P_0x18aca_true_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18947_20 :: state_pred where
  \<open>Q_0x18947_20 \<sigma> \<equiv> RIP \<sigma> = 0x18947 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare Q_0x18947_20_def[Qs]

schematic_goal bdrv_pwrite_em_0_4_0x18aca_0x18945_20[blocks]:
  assumes \<open>(P_0x18aca_true_20 && P_0x18aca_true_20_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x18945 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18947_20 ?\<sigma> \<and> block_usage P_0x18aca_true_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18aca_true_20_def P_0x18aca_true_20_regions_def post: Q_0x18947_20_def regionset: P_0x18aca_true_20_regions_set_def)

definition P_0x18947_true_21 :: state_pred where
  \<open>P_0x18947_true_21 \<sigma> \<equiv> RIP \<sigma> = 0x18947 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x18947_true_21_def[Ps]

definition P_0x18947_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18947_true_21_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18947_true_21_regions :: state_pred where
  \<open>P_0x18947_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0x18947_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1898c_21 :: state_pred where
  \<open>Q_0x1898c_21 \<sigma> \<equiv> RIP \<sigma> = 0x1898c \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare Q_0x1898c_21_def[Qs]

schematic_goal bdrv_pwrite_em_0_5_0x18947_0x18989_21[blocks]:
  assumes \<open>(P_0x18947_true_21 && P_0x18947_true_21_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 5 0x18989 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1898c_21 ?\<sigma> \<and> block_usage P_0x18947_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18947_true_21_def P_0x18947_true_21_regions_def post: Q_0x1898c_21_def regionset: P_0x18947_true_21_regions_set_def)

definition P_0x1898c_22 :: state_pred where
  \<open>P_0x1898c_22 \<sigma> \<equiv> RIP \<sigma> = 0x1898c \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x1898c_22_def[Ps]

definition P_0x1898c_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1898c_22_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x1898c_22_regions :: state_pred where
  \<open>P_0x1898c_22_regions \<sigma> \<equiv> \<exists>regions. P_0x1898c_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_write_addr_0x1898c_22 :: state_pred where
  \<open>Q_bdrv_write_addr_0x1898c_22 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_write_addr \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare Q_bdrv_write_addr_0x1898c_22_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x1898c_0x1898c_22[blocks]:
  assumes \<open>(P_0x1898c_22 && P_0x1898c_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1898c 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_write_addr_0x1898c_22 ?\<sigma> \<and> block_usage P_0x1898c_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1898c_22_def P_0x1898c_22_regions_def post: Q_bdrv_write_addr_0x1898c_22_def regionset: P_0x1898c_22_regions_set_def)

definition P_0x18991_23 :: state_pred where
  \<open>P_0x18991_23 \<sigma> \<equiv> RIP \<sigma> = 0x18991 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x18991_23_def[Ps]

definition P_0x18991_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18991_23_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18991_23_regions :: state_pred where
  \<open>P_0x18991_23_regions \<sigma> \<equiv> \<exists>regions. P_0x18991_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18993_23 :: state_pred where
  \<open>Q_0x18993_23 \<sigma> \<equiv> RIP \<sigma> = 0x18993 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare Q_0x18993_23_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18991_0x18991_23[blocks]:
  assumes \<open>(P_0x18991_23 && P_0x18991_23_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18991 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18993_23 ?\<sigma> \<and> block_usage P_0x18991_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18991_23_def P_0x18991_23_regions_def post: Q_0x18993_23_def regionset: P_0x18991_23_regions_set_def)

definition P_0x18993_true_24 :: state_pred where
  \<open>P_0x18993_true_24 \<sigma> \<equiv> RIP \<sigma> = 0x18993 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x18993_true_24_def[Ps]

definition P_0x18993_true_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18993_true_24_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18993_true_24_regions :: state_pred where
  \<open>P_0x18993_true_24_regions \<sigma> \<equiv> \<exists>regions. P_0x18993_true_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_24 :: state_pred where
  \<open>Q_0x18951_24 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_24_def[Qs]

schematic_goal bdrv_pwrite_em_0_3_0x18993_0x18a05_24[blocks]:
  assumes \<open>(P_0x18993_true_24 && P_0x18993_true_24_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x18a05 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_24 ?\<sigma> \<and> block_usage P_0x18993_true_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18993_true_24_def P_0x18993_true_24_regions_def post: Q_0x18951_24_def regionset: P_0x18993_true_24_regions_set_def)

definition P_0x18993_false_25 :: state_pred where
  \<open>P_0x18993_false_25 \<sigma> \<equiv> RIP \<sigma> = 0x18993 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x18993_false_25_def[Ps]

definition P_0x18993_false_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18993_false_25_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18993_false_25_regions :: state_pred where
  \<open>P_0x18993_false_25_regions \<sigma> \<equiv> \<exists>regions. P_0x18993_false_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189af_25 :: state_pred where
  \<open>Q_0x189af_25 \<sigma> \<equiv> RIP \<sigma> = 0x189af \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare Q_0x189af_25_def[Qs]

schematic_goal bdrv_pwrite_em_0_9_0x18993_0x189ac_25[blocks]:
  assumes \<open>(P_0x18993_false_25 && P_0x18993_false_25_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 9 0x189ac 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189af_25 ?\<sigma> \<and> block_usage P_0x18993_false_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18993_false_25_def P_0x18993_false_25_regions_def post: Q_0x189af_25_def regionset: P_0x18993_false_25_regions_set_def)

definition P_0x189af_true_26 :: state_pred where
  \<open>P_0x189af_true_26 \<sigma> \<equiv> RIP \<sigma> = 0x189af \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x189af_true_26_def[Ps]

definition P_0x189af_true_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189af_true_26_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189af_true_26_regions :: state_pred where
  \<open>P_0x189af_true_26_regions \<sigma> \<equiv> \<exists>regions. P_0x189af_true_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_26 :: state_pred where
  \<open>Q_0x18951_26 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_26_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x189af_0x1894e_26[blocks]:
  assumes \<open>(P_0x189af_true_26 && P_0x189af_true_26_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 2 0x1894e 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_26 ?\<sigma> \<and> block_usage P_0x189af_true_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189af_true_26_def P_0x189af_true_26_regions_def post: Q_0x18951_26_def regionset: P_0x189af_true_26_regions_set_def)

definition P_0x189af_false_27 :: state_pred where
  \<open>P_0x189af_false_27 \<sigma> \<equiv> RIP \<sigma> = 0x189af \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x189af_false_27_def[Ps]

definition P_0x189af_false_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189af_false_27_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189af_false_27_regions :: state_pred where
  \<open>P_0x189af_false_27_regions \<sigma> \<equiv> \<exists>regions. P_0x189af_false_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189c8_27 :: state_pred where
  \<open>Q_0x189c8_27 \<sigma> \<equiv> RIP \<sigma> = 0x189c8 \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare Q_0x189c8_27_def[Qs]

schematic_goal bdrv_pwrite_em_0_7_0x189af_0x189c5_27[blocks]:
  assumes \<open>(P_0x189af_false_27 && P_0x189af_false_27_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 7 0x189c5 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189c8_27 ?\<sigma> \<and> block_usage P_0x189af_false_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189af_false_27_def P_0x189af_false_27_regions_def post: Q_0x189c8_27_def regionset: P_0x189af_false_27_regions_set_def)

definition P_0x189c8_28 :: state_pred where
  \<open>P_0x189c8_28 \<sigma> \<equiv> RIP \<sigma> = 0x189c8 \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x189c8_28_def[Ps]

definition P_0x189c8_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189c8_28_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189c8_28_regions :: state_pred where
  \<open>P_0x189c8_28_regions \<sigma> \<equiv> \<exists>regions. P_0x189c8_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x189c8_28 :: state_pred where
  \<open>Q_bdrv_read_addr_0x189c8_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_bdrv_read_addr_0x189c8_28_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189c8_0x189c8_28[blocks]:
  assumes \<open>(P_0x189c8_28 && P_0x189c8_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189c8 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x189c8_28 ?\<sigma> \<and> block_usage P_0x189c8_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189c8_28_def P_0x189c8_28_regions_def post: Q_bdrv_read_addr_0x189c8_28_def regionset: P_0x189c8_28_regions_set_def)

definition P_0x189cd_29 :: state_pred where
  \<open>P_0x189cd_29 \<sigma> \<equiv> RIP \<sigma> = 0x189cd \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cd_29_def[Ps]

definition P_0x189cd_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cd_29_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cd_29_regions :: state_pred where
  \<open>P_0x189cd_29_regions \<sigma> \<equiv> \<exists>regions. P_0x189cd_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189cf_29 :: state_pred where
  \<open>Q_0x189cf_29 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_0x189cf_29_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189cd_0x189cd_29[blocks]:
  assumes \<open>(P_0x189cd_29 && P_0x189cd_29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189cd 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189cf_29 ?\<sigma> \<and> block_usage P_0x189cd_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cd_29_def P_0x189cd_29_regions_def post: Q_0x189cf_29_def regionset: P_0x189cd_29_regions_set_def)

definition P_0x189cf_true_30 :: state_pred where
  \<open>P_0x189cf_true_30 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cf_true_30_def[Ps]

definition P_0x189cf_true_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cf_true_30_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cf_true_30_regions :: state_pred where
  \<open>P_0x189cf_true_30_regions \<sigma> \<equiv> \<exists>regions. P_0x189cf_true_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_30 :: state_pred where
  \<open>Q_0x18951_30 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_30_def[Qs]

schematic_goal bdrv_pwrite_em_0_3_0x189cf_0x18a05_30[blocks]:
  assumes \<open>(P_0x189cf_true_30 && P_0x189cf_true_30_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x18a05 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_30 ?\<sigma> \<and> block_usage P_0x189cf_true_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cf_true_30_def P_0x189cf_true_30_regions_def post: Q_0x18951_30_def regionset: P_0x189cf_true_30_regions_set_def)

definition P_0x189cf_false_31 :: state_pred where
  \<open>P_0x189cf_false_31 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cf_false_31_def[Ps]

definition P_0x189cf_false_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cf_false_31_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cf_false_31_regions :: state_pred where
  \<open>P_0x189cf_false_31_regions \<sigma> \<equiv> \<exists>regions. P_0x189cf_false_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189df_31 :: state_pred where
  \<open>Q_0x189df_31 \<sigma> \<equiv> RIP \<sigma> = 0x189df \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_0x189df_31_def[Qs]

schematic_goal bdrv_pwrite_em_0_5_0x189cf_0x189dc_31[blocks]:
  assumes \<open>(P_0x189cf_false_31 && P_0x189cf_false_31_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x189dc 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189df_31 ?\<sigma> \<and> block_usage P_0x189cf_false_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cf_false_31_def P_0x189cf_false_31_regions_def post: Q_0x189df_31_def regionset: P_0x189cf_false_31_regions_set_def)

definition P_0x189df_32 :: state_pred where
  \<open>P_0x189df_32 \<sigma> \<equiv> RIP \<sigma> = 0x189df \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189df_32_def[Ps]

definition P_0x189df_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189df_32_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189df_32_regions :: state_pred where
  \<open>P_0x189df_32_regions \<sigma> \<equiv> \<exists>regions. P_0x189df_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_chk_addr_0x189df_32 :: state_pred where
  \<open>Q_memcpy_chk_addr_0x189df_32 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = memcpy_chk_addr \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare Q_memcpy_chk_addr_0x189df_32_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189df_0x189df_32[blocks]:
  assumes \<open>(P_0x189df_32 && P_0x189df_32_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189df 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_chk_addr_0x189df_32 ?\<sigma> \<and> block_usage P_0x189df_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189df_32_def P_0x189df_32_regions_def post: Q_memcpy_chk_addr_0x189df_32_def regionset: P_0x189df_32_regions_set_def)

definition P_0x189e4_33 :: state_pred where
  \<open>P_0x189e4_33 \<sigma> \<equiv> RIP \<sigma> = 0x189e4 \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare P_0x189e4_33_def[Ps]

definition P_0x189e4_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189e4_33_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189e4_33_regions :: state_pred where
  \<open>P_0x189e4_33_regions \<sigma> \<equiv> \<exists>regions. P_0x189e4_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189f2_33 :: state_pred where
  \<open>Q_0x189f2_33 \<sigma> \<equiv> RIP \<sigma> = 0x189f2 \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare Q_0x189f2_33_def[Qs]

schematic_goal bdrv_pwrite_em_0_4_0x189e4_0x189ef_33[blocks]:
  assumes \<open>(P_0x189e4_33 && P_0x189e4_33_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x189ef 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189f2_33 ?\<sigma> \<and> block_usage P_0x189e4_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189e4_33_def P_0x189e4_33_regions_def post: Q_0x189f2_33_def regionset: P_0x189e4_33_regions_set_def)

definition P_0x189f2_34 :: state_pred where
  \<open>P_0x189f2_34 \<sigma> \<equiv> RIP \<sigma> = 0x189f2 \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare P_0x189f2_34_def[Ps]

definition P_0x189f2_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f2_34_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f2_34_regions :: state_pred where
  \<open>P_0x189f2_34_regions \<sigma> \<equiv> \<exists>regions. P_0x189f2_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_write_addr_0x189f2_34 :: state_pred where
  \<open>Q_bdrv_write_addr_0x189f2_34 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_write_addr \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_bdrv_write_addr_0x189f2_34_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189f2_0x189f2_34[blocks]:
  assumes \<open>(P_0x189f2_34 && P_0x189f2_34_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189f2 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_write_addr_0x189f2_34 ?\<sigma> \<and> block_usage P_0x189f2_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f2_34_def P_0x189f2_34_regions_def post: Q_bdrv_write_addr_0x189f2_34_def regionset: P_0x189f2_34_regions_set_def)

definition P_0x189f7_35 :: state_pred where
  \<open>P_0x189f7_35 \<sigma> \<equiv> RIP \<sigma> = 0x189f7 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f7_35_def[Ps]

definition P_0x189f7_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f7_35_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f7_35_regions :: state_pred where
  \<open>P_0x189f7_35_regions \<sigma> \<equiv> \<exists>regions. P_0x189f7_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189f9_35 :: state_pred where
  \<open>Q_0x189f9_35 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_0x189f9_35_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189f7_0x189f7_35[blocks]:
  assumes \<open>(P_0x189f7_35 && P_0x189f7_35_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189f7 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189f9_35 ?\<sigma> \<and> block_usage P_0x189f7_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f7_35_def P_0x189f7_35_regions_def post: Q_0x189f9_35_def regionset: P_0x189f7_35_regions_set_def)

definition P_0x189f9_true_36 :: state_pred where
  \<open>P_0x189f9_true_36 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f9_true_36_def[Ps]

definition P_0x189f9_true_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f9_true_36_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f9_true_36_regions :: state_pred where
  \<open>P_0x189f9_true_36_regions \<sigma> \<equiv> \<exists>regions. P_0x189f9_true_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_36 :: state_pred where
  \<open>Q_0x18951_36 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_36_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x189f9_0x1894e_36[blocks]:
  assumes \<open>(P_0x189f9_true_36 && P_0x189f9_true_36_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1894e 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_36 ?\<sigma> \<and> block_usage P_0x189f9_true_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f9_true_36_def P_0x189f9_true_36_regions_def post: Q_0x18951_36_def regionset: P_0x189f9_true_36_regions_set_def)

definition P_0x189f9_false_37 :: state_pred where
  \<open>P_0x189f9_false_37 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f9_false_37_def[Ps]

definition P_0x189f9_false_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f9_false_37_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f9_false_37_regions :: state_pred where
  \<open>P_0x189f9_false_37_regions \<sigma> \<equiv> \<exists>regions. P_0x189f9_false_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a00_37 :: state_pred where
  \<open>Q_0x18a00_37 \<sigma> \<equiv> RIP \<sigma> = 0x18a00 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_0x18a00_37_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x189f9_0x189ff_37[blocks]:
  assumes \<open>(P_0x189f9_false_37 && P_0x189f9_false_37_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x189ff 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a00_37 ?\<sigma> \<and> block_usage P_0x189f9_false_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f9_false_37_def P_0x189f9_false_37_regions_def post: Q_0x18a00_37_def regionset: P_0x189f9_false_37_regions_set_def)

definition P_0x18a00_38 :: state_pred where
  \<open>P_0x18a00_38 \<sigma> \<equiv> RIP \<sigma> = 0x18a00 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R12 \<sigma> = ((((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word))::64 word) + (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x18a00_38_def[Ps]

definition P_0x18a00_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a00_38_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a00_38_regions :: state_pred where
  \<open>P_0x18a00_38_regions \<sigma> \<equiv> \<exists>regions. P_0x18a00_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_38 :: state_pred where
  \<open>Q_0x18951_38 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_38_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x18a00_0x18a05_38[blocks]:
  assumes \<open>(P_0x18a00_38 && P_0x18a00_38_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x18a05 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_38 ?\<sigma> \<and> block_usage P_0x18a00_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a00_38_def P_0x18a00_38_regions_def post: Q_0x18951_38_def regionset: P_0x18a00_38_regions_set_def)

definition P_0x18947_false_39 :: state_pred where
  \<open>P_0x18947_false_39 \<sigma> \<equiv> RIP \<sigma> = 0x18947 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x18947_false_39_def[Ps]

definition P_0x18947_false_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18947_false_39_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18947_false_39_regions :: state_pred where
  \<open>P_0x18947_false_39_regions \<sigma> \<equiv> \<exists>regions. P_0x18947_false_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1894c_39 :: state_pred where
  \<open>Q_0x1894c_39 \<sigma> \<equiv> RIP \<sigma> = 0x1894c \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare Q_0x1894c_39_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x18947_0x18949_39[blocks]:
  assumes \<open>(P_0x18947_false_39 && P_0x18947_false_39_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x18949 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1894c_39 ?\<sigma> \<and> block_usage P_0x18947_false_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18947_false_39_def P_0x18947_false_39_regions_def post: Q_0x1894c_39_def regionset: P_0x18947_false_39_regions_set_def)

definition P_0x1894c_true_40 :: state_pred where
  \<open>P_0x1894c_true_40 \<sigma> \<equiv> RIP \<sigma> = 0x1894c \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x1894c_true_40_def[Ps]

definition P_0x1894c_true_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1894c_true_40_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x1894c_true_40_regions :: state_pred where
  \<open>P_0x1894c_true_40_regions \<sigma> \<equiv> \<exists>regions. P_0x1894c_true_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189c8_40 :: state_pred where
  \<open>Q_0x189c8_40 \<sigma> \<equiv> RIP \<sigma> = 0x189c8 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare Q_0x189c8_40_def[Qs]

schematic_goal bdrv_pwrite_em_0_7_0x1894c_0x189c5_40[blocks]:
  assumes \<open>(P_0x1894c_true_40 && P_0x1894c_true_40_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 7 0x189c5 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189c8_40 ?\<sigma> \<and> block_usage P_0x1894c_true_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1894c_true_40_def P_0x1894c_true_40_regions_def post: Q_0x189c8_40_def regionset: P_0x1894c_true_40_regions_set_def)

definition P_0x189c8_41 :: state_pred where
  \<open>P_0x189c8_41 \<sigma> \<equiv> RIP \<sigma> = 0x189c8 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x189c8_41_def[Ps]

definition P_0x189c8_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189c8_41_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189c8_41_regions :: state_pred where
  \<open>P_0x189c8_41_regions \<sigma> \<equiv> \<exists>regions. P_0x189c8_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x189c8_41 :: state_pred where
  \<open>Q_bdrv_read_addr_0x189c8_41 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_bdrv_read_addr_0x189c8_41_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189c8_0x189c8_41[blocks]:
  assumes \<open>(P_0x189c8_41 && P_0x189c8_41_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189c8 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x189c8_41 ?\<sigma> \<and> block_usage P_0x189c8_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189c8_41_def P_0x189c8_41_regions_def post: Q_bdrv_read_addr_0x189c8_41_def regionset: P_0x189c8_41_regions_set_def)

definition P_0x189cd_42 :: state_pred where
  \<open>P_0x189cd_42 \<sigma> \<equiv> RIP \<sigma> = 0x189cd \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cd_42_def[Ps]

definition P_0x189cd_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cd_42_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cd_42_regions :: state_pred where
  \<open>P_0x189cd_42_regions \<sigma> \<equiv> \<exists>regions. P_0x189cd_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189cf_42 :: state_pred where
  \<open>Q_0x189cf_42 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_0x189cf_42_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189cd_0x189cd_42[blocks]:
  assumes \<open>(P_0x189cd_42 && P_0x189cd_42_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189cd 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189cf_42 ?\<sigma> \<and> block_usage P_0x189cd_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cd_42_def P_0x189cd_42_regions_def post: Q_0x189cf_42_def regionset: P_0x189cd_42_regions_set_def)

definition P_0x189cf_true_43 :: state_pred where
  \<open>P_0x189cf_true_43 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cf_true_43_def[Ps]

definition P_0x189cf_true_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cf_true_43_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cf_true_43_regions :: state_pred where
  \<open>P_0x189cf_true_43_regions \<sigma> \<equiv> \<exists>regions. P_0x189cf_true_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_43 :: state_pred where
  \<open>Q_0x18951_43 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_43_def[Qs]

schematic_goal bdrv_pwrite_em_0_3_0x189cf_0x18a05_43[blocks]:
  assumes \<open>(P_0x189cf_true_43 && P_0x189cf_true_43_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x18a05 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_43 ?\<sigma> \<and> block_usage P_0x189cf_true_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cf_true_43_def P_0x189cf_true_43_regions_def post: Q_0x18951_43_def regionset: P_0x189cf_true_43_regions_set_def)

definition P_0x189cf_false_44 :: state_pred where
  \<open>P_0x189cf_false_44 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cf_false_44_def[Ps]

definition P_0x189cf_false_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cf_false_44_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cf_false_44_regions :: state_pred where
  \<open>P_0x189cf_false_44_regions \<sigma> \<equiv> \<exists>regions. P_0x189cf_false_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189df_44 :: state_pred where
  \<open>Q_0x189df_44 \<sigma> \<equiv> RIP \<sigma> = 0x189df \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_0x189df_44_def[Qs]

schematic_goal bdrv_pwrite_em_0_5_0x189cf_0x189dc_44[blocks]:
  assumes \<open>(P_0x189cf_false_44 && P_0x189cf_false_44_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x189dc 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189df_44 ?\<sigma> \<and> block_usage P_0x189cf_false_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cf_false_44_def P_0x189cf_false_44_regions_def post: Q_0x189df_44_def regionset: P_0x189cf_false_44_regions_set_def)

definition P_0x189df_45 :: state_pred where
  \<open>P_0x189df_45 \<sigma> \<equiv> RIP \<sigma> = 0x189df \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189df_45_def[Ps]

definition P_0x189df_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189df_45_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189df_45_regions :: state_pred where
  \<open>P_0x189df_45_regions \<sigma> \<equiv> \<exists>regions. P_0x189df_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_chk_addr_0x189df_45 :: state_pred where
  \<open>Q_memcpy_chk_addr_0x189df_45 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = memcpy_chk_addr \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare Q_memcpy_chk_addr_0x189df_45_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189df_0x189df_45[blocks]:
  assumes \<open>(P_0x189df_45 && P_0x189df_45_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189df 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_chk_addr_0x189df_45 ?\<sigma> \<and> block_usage P_0x189df_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189df_45_def P_0x189df_45_regions_def post: Q_memcpy_chk_addr_0x189df_45_def regionset: P_0x189df_45_regions_set_def)

definition P_0x189e4_46 :: state_pred where
  \<open>P_0x189e4_46 \<sigma> \<equiv> RIP \<sigma> = 0x189e4 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare P_0x189e4_46_def[Ps]

definition P_0x189e4_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189e4_46_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189e4_46_regions :: state_pred where
  \<open>P_0x189e4_46_regions \<sigma> \<equiv> \<exists>regions. P_0x189e4_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189f2_46 :: state_pred where
  \<open>Q_0x189f2_46 \<sigma> \<equiv> RIP \<sigma> = 0x189f2 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare Q_0x189f2_46_def[Qs]

schematic_goal bdrv_pwrite_em_0_4_0x189e4_0x189ef_46[blocks]:
  assumes \<open>(P_0x189e4_46 && P_0x189e4_46_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x189ef 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189f2_46 ?\<sigma> \<and> block_usage P_0x189e4_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189e4_46_def P_0x189e4_46_regions_def post: Q_0x189f2_46_def regionset: P_0x189e4_46_regions_set_def)

definition P_0x189f2_47 :: state_pred where
  \<open>P_0x189f2_47 \<sigma> \<equiv> RIP \<sigma> = 0x189f2 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare P_0x189f2_47_def[Ps]

definition P_0x189f2_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f2_47_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f2_47_regions :: state_pred where
  \<open>P_0x189f2_47_regions \<sigma> \<equiv> \<exists>regions. P_0x189f2_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_write_addr_0x189f2_47 :: state_pred where
  \<open>Q_bdrv_write_addr_0x189f2_47 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_write_addr \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_bdrv_write_addr_0x189f2_47_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189f2_0x189f2_47[blocks]:
  assumes \<open>(P_0x189f2_47 && P_0x189f2_47_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189f2 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_write_addr_0x189f2_47 ?\<sigma> \<and> block_usage P_0x189f2_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f2_47_def P_0x189f2_47_regions_def post: Q_bdrv_write_addr_0x189f2_47_def regionset: P_0x189f2_47_regions_set_def)

definition P_0x189f7_48 :: state_pred where
  \<open>P_0x189f7_48 \<sigma> \<equiv> RIP \<sigma> = 0x189f7 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f7_48_def[Ps]

definition P_0x189f7_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f7_48_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f7_48_regions :: state_pred where
  \<open>P_0x189f7_48_regions \<sigma> \<equiv> \<exists>regions. P_0x189f7_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189f9_48 :: state_pred where
  \<open>Q_0x189f9_48 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_0x189f9_48_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189f7_0x189f7_48[blocks]:
  assumes \<open>(P_0x189f7_48 && P_0x189f7_48_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189f7 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189f9_48 ?\<sigma> \<and> block_usage P_0x189f7_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f7_48_def P_0x189f7_48_regions_def post: Q_0x189f9_48_def regionset: P_0x189f7_48_regions_set_def)

definition P_0x189f9_true_49 :: state_pred where
  \<open>P_0x189f9_true_49 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f9_true_49_def[Ps]

definition P_0x189f9_true_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f9_true_49_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f9_true_49_regions :: state_pred where
  \<open>P_0x189f9_true_49_regions \<sigma> \<equiv> \<exists>regions. P_0x189f9_true_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_49 :: state_pred where
  \<open>Q_0x18951_49 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_49_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x189f9_0x1894e_49[blocks]:
  assumes \<open>(P_0x189f9_true_49 && P_0x189f9_true_49_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1894e 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_49 ?\<sigma> \<and> block_usage P_0x189f9_true_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f9_true_49_def P_0x189f9_true_49_regions_def post: Q_0x18951_49_def regionset: P_0x189f9_true_49_regions_set_def)

definition P_0x189f9_false_50 :: state_pred where
  \<open>P_0x189f9_false_50 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f9_false_50_def[Ps]

definition P_0x189f9_false_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f9_false_50_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f9_false_50_regions :: state_pred where
  \<open>P_0x189f9_false_50_regions \<sigma> \<equiv> \<exists>regions. P_0x189f9_false_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a00_50 :: state_pred where
  \<open>Q_0x18a00_50 \<sigma> \<equiv> RIP \<sigma> = 0x18a00 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_0x18a00_50_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x189f9_0x189ff_50[blocks]:
  assumes \<open>(P_0x189f9_false_50 && P_0x189f9_false_50_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x189ff 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a00_50 ?\<sigma> \<and> block_usage P_0x189f9_false_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f9_false_50_def P_0x189f9_false_50_regions_def post: Q_0x18a00_50_def regionset: P_0x189f9_false_50_regions_set_def)

definition P_0x18a00_51 :: state_pred where
  \<open>P_0x18a00_51 \<sigma> \<equiv> RIP \<sigma> = 0x18a00 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x18a00_51_def[Ps]

definition P_0x18a00_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a00_51_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a00_51_regions :: state_pred where
  \<open>P_0x18a00_51_regions \<sigma> \<equiv> \<exists>regions. P_0x18a00_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_51 :: state_pred where
  \<open>Q_0x18951_51 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_51_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x18a00_0x18a05_51[blocks]:
  assumes \<open>(P_0x18a00_51 && P_0x18a00_51_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x18a05 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_51 ?\<sigma> \<and> block_usage P_0x18a00_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a00_51_def P_0x18a00_51_regions_def post: Q_0x18951_51_def regionset: P_0x18a00_51_regions_set_def)

definition P_0x1894c_false_52 :: state_pred where
  \<open>P_0x1894c_false_52 \<sigma> \<equiv> RIP \<sigma> = 0x1894c \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x1894c_false_52_def[Ps]

definition P_0x1894c_false_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1894c_false_52_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x1894c_false_52_regions :: state_pred where
  \<open>P_0x1894c_false_52_regions \<sigma> \<equiv> \<exists>regions. P_0x1894c_false_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_52 :: state_pred where
  \<open>Q_0x18951_52 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_52_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x1894c_0x1894e_52[blocks]:
  assumes \<open>(P_0x1894c_false_52 && P_0x1894c_false_52_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x1894e 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_52 ?\<sigma> \<and> block_usage P_0x1894c_false_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1894c_false_52_def P_0x1894c_false_52_regions_def post: Q_0x18951_52_def regionset: P_0x1894c_false_52_regions_set_def)

definition P_0x18aca_false_53 :: state_pred where
  \<open>P_0x18aca_false_53 \<sigma> \<equiv> RIP \<sigma> = 0x18aca \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x18aca_false_53_def[Ps]

definition P_0x18aca_false_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18aca_false_53_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18aca_false_53_regions :: state_pred where
  \<open>P_0x18aca_false_53_regions \<sigma> \<equiv> \<exists>regions. P_0x18aca_false_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1894e_53 :: state_pred where
  \<open>Q_0x1894e_53 \<sigma> \<equiv> RIP \<sigma> = 0x1894e \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare Q_0x1894e_53_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x18aca_0x18ad0_53[blocks]:
  assumes \<open>(P_0x18aca_false_53 && P_0x18aca_false_53_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x18ad0 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1894e_53 ?\<sigma> \<and> block_usage P_0x18aca_false_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18aca_false_53_def P_0x18aca_false_53_regions_def post: Q_0x1894e_53_def regionset: P_0x18aca_false_53_regions_set_def)

definition P_0x1894e_54 :: state_pred where
  \<open>P_0x1894e_54 \<sigma> \<equiv> RIP \<sigma> = 0x1894e \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18ab3\<close>
declare P_0x1894e_54_def[Ps]

definition P_0x1894e_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1894e_54_regions_set \<sigma> \<equiv> {
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
    (10, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x1894e_54_regions :: state_pred where
  \<open>P_0x1894e_54_regions \<sigma> \<equiv> \<exists>regions. P_0x1894e_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_54 :: state_pred where
  \<open>Q_0x18951_54 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_54_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x1894e_0x1894e_54[blocks]:
  assumes \<open>(P_0x1894e_54 && P_0x1894e_54_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1894e 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_54 ?\<sigma> \<and> block_usage P_0x1894e_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1894e_54_def P_0x1894e_54_regions_def post: Q_0x18951_54_def regionset: P_0x1894e_54_regions_set_def)

definition P_0x18939_false_55 :: state_pred where
  \<open>P_0x18939_false_55 \<sigma> \<equiv> RIP \<sigma> = 0x18939 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18939_false_55_def[Ps]

definition P_0x18939_false_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18939_false_55_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x18939_false_55_regions :: state_pred where
  \<open>P_0x18939_false_55_regions \<sigma> \<equiv> \<exists>regions. P_0x18939_false_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18947_55 :: state_pred where
  \<open>Q_0x18947_55 \<sigma> \<equiv> RIP \<sigma> = 0x18947 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18947_55_def[Qs]

schematic_goal bdrv_pwrite_em_0_4_0x18939_0x18945_55[blocks]:
  assumes \<open>(P_0x18939_false_55 && P_0x18939_false_55_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 4 0x18945 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18947_55 ?\<sigma> \<and> block_usage P_0x18939_false_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18939_false_55_def P_0x18939_false_55_regions_def post: Q_0x18947_55_def regionset: P_0x18939_false_55_regions_set_def)

definition P_0x18947_true_56 :: state_pred where
  \<open>P_0x18947_true_56 \<sigma> \<equiv> RIP \<sigma> = 0x18947 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18947_true_56_def[Ps]

definition P_0x18947_true_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18947_true_56_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x18947_true_56_regions :: state_pred where
  \<open>P_0x18947_true_56_regions \<sigma> \<equiv> \<exists>regions. P_0x18947_true_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1898c_56 :: state_pred where
  \<open>Q_0x1898c_56 \<sigma> \<equiv> RIP \<sigma> = 0x1898c \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1898c_56_def[Qs]

schematic_goal bdrv_pwrite_em_0_5_0x18947_0x18989_56[blocks]:
  assumes \<open>(P_0x18947_true_56 && P_0x18947_true_56_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 5 0x18989 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1898c_56 ?\<sigma> \<and> block_usage P_0x18947_true_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18947_true_56_def P_0x18947_true_56_regions_def post: Q_0x1898c_56_def regionset: P_0x18947_true_56_regions_set_def)

definition P_0x1898c_57 :: state_pred where
  \<open>P_0x1898c_57 \<sigma> \<equiv> RIP \<sigma> = 0x1898c \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1898c_57_def[Ps]

definition P_0x1898c_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1898c_57_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x1898c_57_regions :: state_pred where
  \<open>P_0x1898c_57_regions \<sigma> \<equiv> \<exists>regions. P_0x1898c_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_write_addr_0x1898c_57 :: state_pred where
  \<open>Q_bdrv_write_addr_0x1898c_57 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_write_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare Q_bdrv_write_addr_0x1898c_57_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x1898c_0x1898c_57[blocks]:
  assumes \<open>(P_0x1898c_57 && P_0x1898c_57_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1898c 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_write_addr_0x1898c_57 ?\<sigma> \<and> block_usage P_0x1898c_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1898c_57_def P_0x1898c_57_regions_def post: Q_bdrv_write_addr_0x1898c_57_def regionset: P_0x1898c_57_regions_set_def)

definition P_0x18991_58 :: state_pred where
  \<open>P_0x18991_58 \<sigma> \<equiv> RIP \<sigma> = 0x18991 \<and> RAX \<sigma> = bdrv_write_0x1898c_retval \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x18991_58_def[Ps]

definition P_0x18991_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18991_58_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18991_58_regions :: state_pred where
  \<open>P_0x18991_58_regions \<sigma> \<equiv> \<exists>regions. P_0x18991_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18993_58 :: state_pred where
  \<open>Q_0x18993_58 \<sigma> \<equiv> RIP \<sigma> = 0x18993 \<and> RAX \<sigma> = bdrv_write_0x1898c_retval \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare Q_0x18993_58_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18991_0x18991_58[blocks]:
  assumes \<open>(P_0x18991_58 && P_0x18991_58_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18991 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18993_58 ?\<sigma> \<and> block_usage P_0x18991_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18991_58_def P_0x18991_58_regions_def post: Q_0x18993_58_def regionset: P_0x18991_58_regions_set_def)

definition P_0x18993_true_59 :: state_pred where
  \<open>P_0x18993_true_59 \<sigma> \<equiv> RIP \<sigma> = 0x18993 \<and> RAX \<sigma> = bdrv_write_0x1898c_retval \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x18993_true_59_def[Ps]

definition P_0x18993_true_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18993_true_59_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18993_true_59_regions :: state_pred where
  \<open>P_0x18993_true_59_regions \<sigma> \<equiv> \<exists>regions. P_0x18993_true_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_59 :: state_pred where
  \<open>Q_0x18951_59 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_59_def[Qs]

schematic_goal bdrv_pwrite_em_0_3_0x18993_0x18a05_59[blocks]:
  assumes \<open>(P_0x18993_true_59 && P_0x18993_true_59_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x18a05 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_59 ?\<sigma> \<and> block_usage P_0x18993_true_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18993_true_59_def P_0x18993_true_59_regions_def post: Q_0x18951_59_def regionset: P_0x18993_true_59_regions_set_def)

definition P_0x18993_false_60 :: state_pred where
  \<open>P_0x18993_false_60 \<sigma> \<equiv> RIP \<sigma> = 0x18993 \<and> RAX \<sigma> = bdrv_write_0x1898c_retval \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x18993_false_60_def[Ps]

definition P_0x18993_false_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18993_false_60_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18993_false_60_regions :: state_pred where
  \<open>P_0x18993_false_60_regions \<sigma> \<equiv> \<exists>regions. P_0x18993_false_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189af_60 :: state_pred where
  \<open>Q_0x189af_60 \<sigma> \<equiv> RIP \<sigma> = 0x189af \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare Q_0x189af_60_def[Qs]

schematic_goal bdrv_pwrite_em_0_9_0x18993_0x189ac_60[blocks]:
  assumes \<open>(P_0x18993_false_60 && P_0x18993_false_60_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 9 0x189ac 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189af_60 ?\<sigma> \<and> block_usage P_0x18993_false_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18993_false_60_def P_0x18993_false_60_regions_def post: Q_0x189af_60_def regionset: P_0x18993_false_60_regions_set_def)

definition P_0x189af_true_61 :: state_pred where
  \<open>P_0x189af_true_61 \<sigma> \<equiv> RIP \<sigma> = 0x189af \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x189af_true_61_def[Ps]

definition P_0x189af_true_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189af_true_61_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189af_true_61_regions :: state_pred where
  \<open>P_0x189af_true_61_regions \<sigma> \<equiv> \<exists>regions. P_0x189af_true_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_61 :: state_pred where
  \<open>Q_0x18951_61 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_61_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x189af_0x1894e_61[blocks]:
  assumes \<open>(P_0x189af_true_61 && P_0x189af_true_61_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 2 0x1894e 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_61 ?\<sigma> \<and> block_usage P_0x189af_true_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189af_true_61_def P_0x189af_true_61_regions_def post: Q_0x18951_61_def regionset: P_0x189af_true_61_regions_set_def)

definition P_0x189af_false_62 :: state_pred where
  \<open>P_0x189af_false_62 \<sigma> \<equiv> RIP \<sigma> = 0x189af \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x189af_false_62_def[Ps]

definition P_0x189af_false_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189af_false_62_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189af_false_62_regions :: state_pred where
  \<open>P_0x189af_false_62_regions \<sigma> \<equiv> \<exists>regions. P_0x189af_false_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189c8_62 :: state_pred where
  \<open>Q_0x189c8_62 \<sigma> \<equiv> RIP \<sigma> = 0x189c8 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare Q_0x189c8_62_def[Qs]

schematic_goal bdrv_pwrite_em_0_7_0x189af_0x189c5_62[blocks]:
  assumes \<open>(P_0x189af_false_62 && P_0x189af_false_62_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 7 0x189c5 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189c8_62 ?\<sigma> \<and> block_usage P_0x189af_false_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189af_false_62_def P_0x189af_false_62_regions_def post: Q_0x189c8_62_def regionset: P_0x189af_false_62_regions_set_def)

definition P_0x189c8_63 :: state_pred where
  \<open>P_0x189c8_63 \<sigma> \<equiv> RIP \<sigma> = 0x189c8 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18991\<close>
declare P_0x189c8_63_def[Ps]

definition P_0x189c8_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189c8_63_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189c8_63_regions :: state_pred where
  \<open>P_0x189c8_63_regions \<sigma> \<equiv> \<exists>regions. P_0x189c8_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x189c8_63 :: state_pred where
  \<open>Q_bdrv_read_addr_0x189c8_63 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_bdrv_read_addr_0x189c8_63_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189c8_0x189c8_63[blocks]:
  assumes \<open>(P_0x189c8_63 && P_0x189c8_63_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189c8 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x189c8_63 ?\<sigma> \<and> block_usage P_0x189c8_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189c8_63_def P_0x189c8_63_regions_def post: Q_bdrv_read_addr_0x189c8_63_def regionset: P_0x189c8_63_regions_set_def)

definition P_0x189cd_64 :: state_pred where
  \<open>P_0x189cd_64 \<sigma> \<equiv> RIP \<sigma> = 0x189cd \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cd_64_def[Ps]

definition P_0x189cd_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cd_64_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cd_64_regions :: state_pred where
  \<open>P_0x189cd_64_regions \<sigma> \<equiv> \<exists>regions. P_0x189cd_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189cf_64 :: state_pred where
  \<open>Q_0x189cf_64 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_0x189cf_64_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189cd_0x189cd_64[blocks]:
  assumes \<open>(P_0x189cd_64 && P_0x189cd_64_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189cd 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189cf_64 ?\<sigma> \<and> block_usage P_0x189cd_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cd_64_def P_0x189cd_64_regions_def post: Q_0x189cf_64_def regionset: P_0x189cd_64_regions_set_def)

definition P_0x189cf_true_65 :: state_pred where
  \<open>P_0x189cf_true_65 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cf_true_65_def[Ps]

definition P_0x189cf_true_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cf_true_65_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cf_true_65_regions :: state_pred where
  \<open>P_0x189cf_true_65_regions \<sigma> \<equiv> \<exists>regions. P_0x189cf_true_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_65 :: state_pred where
  \<open>Q_0x18951_65 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_65_def[Qs]

schematic_goal bdrv_pwrite_em_0_3_0x189cf_0x18a05_65[blocks]:
  assumes \<open>(P_0x189cf_true_65 && P_0x189cf_true_65_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x18a05 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_65 ?\<sigma> \<and> block_usage P_0x189cf_true_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cf_true_65_def P_0x189cf_true_65_regions_def post: Q_0x18951_65_def regionset: P_0x189cf_true_65_regions_set_def)

definition P_0x189cf_false_66 :: state_pred where
  \<open>P_0x189cf_false_66 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cf_false_66_def[Ps]

definition P_0x189cf_false_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cf_false_66_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cf_false_66_regions :: state_pred where
  \<open>P_0x189cf_false_66_regions \<sigma> \<equiv> \<exists>regions. P_0x189cf_false_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189df_66 :: state_pred where
  \<open>Q_0x189df_66 \<sigma> \<equiv> RIP \<sigma> = 0x189df \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_0x189df_66_def[Qs]

schematic_goal bdrv_pwrite_em_0_5_0x189cf_0x189dc_66[blocks]:
  assumes \<open>(P_0x189cf_false_66 && P_0x189cf_false_66_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x189dc 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189df_66 ?\<sigma> \<and> block_usage P_0x189cf_false_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cf_false_66_def P_0x189cf_false_66_regions_def post: Q_0x189df_66_def regionset: P_0x189cf_false_66_regions_set_def)

definition P_0x189df_67 :: state_pred where
  \<open>P_0x189df_67 \<sigma> \<equiv> RIP \<sigma> = 0x189df \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189df_67_def[Ps]

definition P_0x189df_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189df_67_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189df_67_regions :: state_pred where
  \<open>P_0x189df_67_regions \<sigma> \<equiv> \<exists>regions. P_0x189df_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_chk_addr_0x189df_67 :: state_pred where
  \<open>Q_memcpy_chk_addr_0x189df_67 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = memcpy_chk_addr \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare Q_memcpy_chk_addr_0x189df_67_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189df_0x189df_67[blocks]:
  assumes \<open>(P_0x189df_67 && P_0x189df_67_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189df 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_chk_addr_0x189df_67 ?\<sigma> \<and> block_usage P_0x189df_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189df_67_def P_0x189df_67_regions_def post: Q_memcpy_chk_addr_0x189df_67_def regionset: P_0x189df_67_regions_set_def)

definition P_0x189e4_68 :: state_pred where
  \<open>P_0x189e4_68 \<sigma> \<equiv> RIP \<sigma> = 0x189e4 \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare P_0x189e4_68_def[Ps]

definition P_0x189e4_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189e4_68_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189e4_68_regions :: state_pred where
  \<open>P_0x189e4_68_regions \<sigma> \<equiv> \<exists>regions. P_0x189e4_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189f2_68 :: state_pred where
  \<open>Q_0x189f2_68 \<sigma> \<equiv> RIP \<sigma> = 0x189f2 \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare Q_0x189f2_68_def[Qs]

schematic_goal bdrv_pwrite_em_0_4_0x189e4_0x189ef_68[blocks]:
  assumes \<open>(P_0x189e4_68 && P_0x189e4_68_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x189ef 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189f2_68 ?\<sigma> \<and> block_usage P_0x189e4_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189e4_68_def P_0x189e4_68_regions_def post: Q_0x189f2_68_def regionset: P_0x189e4_68_regions_set_def)

definition P_0x189f2_69 :: state_pred where
  \<open>P_0x189f2_69 \<sigma> \<equiv> RIP \<sigma> = 0x189f2 \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare P_0x189f2_69_def[Ps]

definition P_0x189f2_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f2_69_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f2_69_regions :: state_pred where
  \<open>P_0x189f2_69_regions \<sigma> \<equiv> \<exists>regions. P_0x189f2_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_write_addr_0x189f2_69 :: state_pred where
  \<open>Q_bdrv_write_addr_0x189f2_69 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_write_addr \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_bdrv_write_addr_0x189f2_69_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189f2_0x189f2_69[blocks]:
  assumes \<open>(P_0x189f2_69 && P_0x189f2_69_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189f2 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_write_addr_0x189f2_69 ?\<sigma> \<and> block_usage P_0x189f2_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f2_69_def P_0x189f2_69_regions_def post: Q_bdrv_write_addr_0x189f2_69_def regionset: P_0x189f2_69_regions_set_def)

definition P_0x189f7_70 :: state_pred where
  \<open>P_0x189f7_70 \<sigma> \<equiv> RIP \<sigma> = 0x189f7 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f7_70_def[Ps]

definition P_0x189f7_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f7_70_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f7_70_regions :: state_pred where
  \<open>P_0x189f7_70_regions \<sigma> \<equiv> \<exists>regions. P_0x189f7_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189f9_70 :: state_pred where
  \<open>Q_0x189f9_70 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_0x189f9_70_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189f7_0x189f7_70[blocks]:
  assumes \<open>(P_0x189f7_70 && P_0x189f7_70_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189f7 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189f9_70 ?\<sigma> \<and> block_usage P_0x189f7_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f7_70_def P_0x189f7_70_regions_def post: Q_0x189f9_70_def regionset: P_0x189f7_70_regions_set_def)

definition P_0x189f9_true_71 :: state_pred where
  \<open>P_0x189f9_true_71 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f9_true_71_def[Ps]

definition P_0x189f9_true_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f9_true_71_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f9_true_71_regions :: state_pred where
  \<open>P_0x189f9_true_71_regions \<sigma> \<equiv> \<exists>regions. P_0x189f9_true_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_71 :: state_pred where
  \<open>Q_0x18951_71 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_71_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x189f9_0x1894e_71[blocks]:
  assumes \<open>(P_0x189f9_true_71 && P_0x189f9_true_71_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1894e 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_71 ?\<sigma> \<and> block_usage P_0x189f9_true_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f9_true_71_def P_0x189f9_true_71_regions_def post: Q_0x18951_71_def regionset: P_0x189f9_true_71_regions_set_def)

definition P_0x189f9_false_72 :: state_pred where
  \<open>P_0x189f9_false_72 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f9_false_72_def[Ps]

definition P_0x189f9_false_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f9_false_72_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f9_false_72_regions :: state_pred where
  \<open>P_0x189f9_false_72_regions \<sigma> \<equiv> \<exists>regions. P_0x189f9_false_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a00_72 :: state_pred where
  \<open>Q_0x18a00_72 \<sigma> \<equiv> RIP \<sigma> = 0x18a00 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_0x18a00_72_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x189f9_0x189ff_72[blocks]:
  assumes \<open>(P_0x189f9_false_72 && P_0x189f9_false_72_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x189ff 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a00_72 ?\<sigma> \<and> block_usage P_0x189f9_false_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f9_false_72_def P_0x189f9_false_72_regions_def post: Q_0x18a00_72_def regionset: P_0x189f9_false_72_regions_set_def)

definition P_0x18a00_73 :: state_pred where
  \<open>P_0x18a00_73 \<sigma> \<equiv> RIP \<sigma> = 0x18a00 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R13 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R12 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x18a00_73_def[Ps]

definition P_0x18a00_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a00_73_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a00_73_regions :: state_pred where
  \<open>P_0x18a00_73_regions \<sigma> \<equiv> \<exists>regions. P_0x18a00_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_73 :: state_pred where
  \<open>Q_0x18951_73 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_73_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x18a00_0x18a05_73[blocks]:
  assumes \<open>(P_0x18a00_73 && P_0x18a00_73_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x18a05 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_73 ?\<sigma> \<and> block_usage P_0x18a00_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a00_73_def P_0x18a00_73_regions_def post: Q_0x18951_73_def regionset: P_0x18a00_73_regions_set_def)

definition P_0x18947_false_74 :: state_pred where
  \<open>P_0x18947_false_74 \<sigma> \<equiv> RIP \<sigma> = 0x18947 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18947_false_74_def[Ps]

definition P_0x18947_false_74_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18947_false_74_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x18947_false_74_regions :: state_pred where
  \<open>P_0x18947_false_74_regions \<sigma> \<equiv> \<exists>regions. P_0x18947_false_74_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1894c_74 :: state_pred where
  \<open>Q_0x1894c_74 \<sigma> \<equiv> RIP \<sigma> = 0x1894c \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1894c_74_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x18947_0x18949_74[blocks]:
  assumes \<open>(P_0x18947_false_74 && P_0x18947_false_74_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x18949 74 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1894c_74 ?\<sigma> \<and> block_usage P_0x18947_false_74_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18947_false_74_def P_0x18947_false_74_regions_def post: Q_0x1894c_74_def regionset: P_0x18947_false_74_regions_set_def)

definition P_0x1894c_true_75 :: state_pred where
  \<open>P_0x1894c_true_75 \<sigma> \<equiv> RIP \<sigma> = 0x1894c \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1894c_true_75_def[Ps]

definition P_0x1894c_true_75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1894c_true_75_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x1894c_true_75_regions :: state_pred where
  \<open>P_0x1894c_true_75_regions \<sigma> \<equiv> \<exists>regions. P_0x1894c_true_75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189c8_75 :: state_pred where
  \<open>Q_0x189c8_75 \<sigma> \<equiv> RIP \<sigma> = 0x189c8 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x189c8_75_def[Qs]

schematic_goal bdrv_pwrite_em_0_7_0x1894c_0x189c5_75[blocks]:
  assumes \<open>(P_0x1894c_true_75 && P_0x1894c_true_75_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 7 0x189c5 75 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189c8_75 ?\<sigma> \<and> block_usage P_0x1894c_true_75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1894c_true_75_def P_0x1894c_true_75_regions_def post: Q_0x189c8_75_def regionset: P_0x1894c_true_75_regions_set_def)

definition P_0x189c8_76 :: state_pred where
  \<open>P_0x189c8_76 \<sigma> \<equiv> RIP \<sigma> = 0x189c8 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x189c8_76_def[Ps]

definition P_0x189c8_76_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189c8_76_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189c8_76_regions :: state_pred where
  \<open>P_0x189c8_76_regions \<sigma> \<equiv> \<exists>regions. P_0x189c8_76_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x189c8_76 :: state_pred where
  \<open>Q_bdrv_read_addr_0x189c8_76 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_bdrv_read_addr_0x189c8_76_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189c8_0x189c8_76[blocks]:
  assumes \<open>(P_0x189c8_76 && P_0x189c8_76_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189c8 76 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x189c8_76 ?\<sigma> \<and> block_usage P_0x189c8_76_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189c8_76_def P_0x189c8_76_regions_def post: Q_bdrv_read_addr_0x189c8_76_def regionset: P_0x189c8_76_regions_set_def)

definition P_0x189cd_77 :: state_pred where
  \<open>P_0x189cd_77 \<sigma> \<equiv> RIP \<sigma> = 0x189cd \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cd_77_def[Ps]

definition P_0x189cd_77_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cd_77_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cd_77_regions :: state_pred where
  \<open>P_0x189cd_77_regions \<sigma> \<equiv> \<exists>regions. P_0x189cd_77_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189cf_77 :: state_pred where
  \<open>Q_0x189cf_77 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_0x189cf_77_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189cd_0x189cd_77[blocks]:
  assumes \<open>(P_0x189cd_77 && P_0x189cd_77_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189cd 77 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189cf_77 ?\<sigma> \<and> block_usage P_0x189cd_77_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cd_77_def P_0x189cd_77_regions_def post: Q_0x189cf_77_def regionset: P_0x189cd_77_regions_set_def)

definition P_0x189cf_true_78 :: state_pred where
  \<open>P_0x189cf_true_78 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cf_true_78_def[Ps]

definition P_0x189cf_true_78_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cf_true_78_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cf_true_78_regions :: state_pred where
  \<open>P_0x189cf_true_78_regions \<sigma> \<equiv> \<exists>regions. P_0x189cf_true_78_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_78 :: state_pred where
  \<open>Q_0x18951_78 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_78_def[Qs]

schematic_goal bdrv_pwrite_em_0_3_0x189cf_0x18a05_78[blocks]:
  assumes \<open>(P_0x189cf_true_78 && P_0x189cf_true_78_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x18a05 78 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_78 ?\<sigma> \<and> block_usage P_0x189cf_true_78_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cf_true_78_def P_0x189cf_true_78_regions_def post: Q_0x18951_78_def regionset: P_0x189cf_true_78_regions_set_def)

definition P_0x189cf_false_79 :: state_pred where
  \<open>P_0x189cf_false_79 \<sigma> \<equiv> RIP \<sigma> = 0x189cf \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189cf_false_79_def[Ps]

definition P_0x189cf_false_79_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189cf_false_79_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189cf_false_79_regions :: state_pred where
  \<open>P_0x189cf_false_79_regions \<sigma> \<equiv> \<exists>regions. P_0x189cf_false_79_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189df_79 :: state_pred where
  \<open>Q_0x189df_79 \<sigma> \<equiv> RIP \<sigma> = 0x189df \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare Q_0x189df_79_def[Qs]

schematic_goal bdrv_pwrite_em_0_5_0x189cf_0x189dc_79[blocks]:
  assumes \<open>(P_0x189cf_false_79 && P_0x189cf_false_79_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x189dc 79 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189df_79 ?\<sigma> \<and> block_usage P_0x189cf_false_79_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189cf_false_79_def P_0x189cf_false_79_regions_def post: Q_0x189df_79_def regionset: P_0x189cf_false_79_regions_set_def)

definition P_0x189df_80 :: state_pred where
  \<open>P_0x189df_80 \<sigma> \<equiv> RIP \<sigma> = 0x189df \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189cd\<close>
declare P_0x189df_80_def[Ps]

definition P_0x189df_80_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189df_80_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189df_80_regions :: state_pred where
  \<open>P_0x189df_80_regions \<sigma> \<equiv> \<exists>regions. P_0x189df_80_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_chk_addr_0x189df_80 :: state_pred where
  \<open>Q_memcpy_chk_addr_0x189df_80 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = memcpy_chk_addr \<and> RAX \<sigma> = bdrv_read_0x189c8_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare Q_memcpy_chk_addr_0x189df_80_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189df_0x189df_80[blocks]:
  assumes \<open>(P_0x189df_80 && P_0x189df_80_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189df 80 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_chk_addr_0x189df_80 ?\<sigma> \<and> block_usage P_0x189df_80_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189df_80_def P_0x189df_80_regions_def post: Q_memcpy_chk_addr_0x189df_80_def regionset: P_0x189df_80_regions_set_def)

definition P_0x189e4_81 :: state_pred where
  \<open>P_0x189e4_81 \<sigma> \<equiv> RIP \<sigma> = 0x189e4 \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare P_0x189e4_81_def[Ps]

definition P_0x189e4_81_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189e4_81_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189e4_81_regions :: state_pred where
  \<open>P_0x189e4_81_regions \<sigma> \<equiv> \<exists>regions. P_0x189e4_81_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189f2_81 :: state_pred where
  \<open>Q_0x189f2_81 \<sigma> \<equiv> RIP \<sigma> = 0x189f2 \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare Q_0x189f2_81_def[Qs]

schematic_goal bdrv_pwrite_em_0_4_0x189e4_0x189ef_81[blocks]:
  assumes \<open>(P_0x189e4_81 && P_0x189e4_81_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x189ef 81 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189f2_81 ?\<sigma> \<and> block_usage P_0x189e4_81_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189e4_81_def P_0x189e4_81_regions_def post: Q_0x189f2_81_def regionset: P_0x189e4_81_regions_set_def)

definition P_0x189f2_82 :: state_pred where
  \<open>P_0x189f2_82 \<sigma> \<equiv> RIP \<sigma> = 0x189f2 \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189e4\<close>
declare P_0x189f2_82_def[Ps]

definition P_0x189f2_82_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f2_82_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f2_82_regions :: state_pred where
  \<open>P_0x189f2_82_regions \<sigma> \<equiv> \<exists>regions. P_0x189f2_82_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_write_addr_0x189f2_82 :: state_pred where
  \<open>Q_bdrv_write_addr_0x189f2_82 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_write_addr \<and> RAX \<sigma> = memcpy_chk_0x189df_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_bdrv_write_addr_0x189f2_82_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189f2_0x189f2_82[blocks]:
  assumes \<open>(P_0x189f2_82 && P_0x189f2_82_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189f2 82 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_write_addr_0x189f2_82 ?\<sigma> \<and> block_usage P_0x189f2_82_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f2_82_def P_0x189f2_82_regions_def post: Q_bdrv_write_addr_0x189f2_82_def regionset: P_0x189f2_82_regions_set_def)

definition P_0x189f7_83 :: state_pred where
  \<open>P_0x189f7_83 \<sigma> \<equiv> RIP \<sigma> = 0x189f7 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f7_83_def[Ps]

definition P_0x189f7_83_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f7_83_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f7_83_regions :: state_pred where
  \<open>P_0x189f7_83_regions \<sigma> \<equiv> \<exists>regions. P_0x189f7_83_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x189f9_83 :: state_pred where
  \<open>Q_0x189f9_83 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_0x189f9_83_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x189f7_0x189f7_83[blocks]:
  assumes \<open>(P_0x189f7_83 && P_0x189f7_83_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x189f7 83 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x189f9_83 ?\<sigma> \<and> block_usage P_0x189f7_83_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f7_83_def P_0x189f7_83_regions_def post: Q_0x189f9_83_def regionset: P_0x189f7_83_regions_set_def)

definition P_0x189f9_true_84 :: state_pred where
  \<open>P_0x189f9_true_84 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f9_true_84_def[Ps]

definition P_0x189f9_true_84_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f9_true_84_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f9_true_84_regions :: state_pred where
  \<open>P_0x189f9_true_84_regions \<sigma> \<equiv> \<exists>regions. P_0x189f9_true_84_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_84 :: state_pred where
  \<open>Q_0x18951_84 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_84_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x189f9_0x1894e_84[blocks]:
  assumes \<open>(P_0x189f9_true_84 && P_0x189f9_true_84_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1894e 84 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_84 ?\<sigma> \<and> block_usage P_0x189f9_true_84_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f9_true_84_def P_0x189f9_true_84_regions_def post: Q_0x18951_84_def regionset: P_0x189f9_true_84_regions_set_def)

definition P_0x189f9_false_85 :: state_pred where
  \<open>P_0x189f9_false_85 \<sigma> \<equiv> RIP \<sigma> = 0x189f9 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x189f9_false_85_def[Ps]

definition P_0x189f9_false_85_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x189f9_false_85_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x189f9_false_85_regions :: state_pred where
  \<open>P_0x189f9_false_85_regions \<sigma> \<equiv> \<exists>regions. P_0x189f9_false_85_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18a00_85 :: state_pred where
  \<open>Q_0x18a00_85 \<sigma> \<equiv> RIP \<sigma> = 0x18a00 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare Q_0x18a00_85_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x189f9_0x189ff_85[blocks]:
  assumes \<open>(P_0x189f9_false_85 && P_0x189f9_false_85_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x189ff 85 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18a00_85 ?\<sigma> \<and> block_usage P_0x189f9_false_85_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x189f9_false_85_def P_0x189f9_false_85_regions_def post: Q_0x18a00_85_def regionset: P_0x189f9_false_85_regions_set_def)

definition P_0x18a00_86 :: state_pred where
  \<open>P_0x18a00_86 \<sigma> \<equiv> RIP \<sigma> = 0x18a00 \<and> RAX \<sigma> = bdrv_write_0x189f2_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x189f7\<close>
declare P_0x18a00_86_def[Ps]

definition P_0x18a00_86_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18a00_86_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18a00_86_regions :: state_pred where
  \<open>P_0x18a00_86_regions \<sigma> \<equiv> \<exists>regions. P_0x18a00_86_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_86 :: state_pred where
  \<open>Q_0x18951_86 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_86_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x18a00_0x18a05_86[blocks]:
  assumes \<open>(P_0x18a00_86 && P_0x18a00_86_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x18a05 86 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_86 ?\<sigma> \<and> block_usage P_0x18a00_86_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18a00_86_def P_0x18a00_86_regions_def post: Q_0x18951_86_def regionset: P_0x18a00_86_regions_set_def)

definition P_0x1894c_false_87 :: state_pred where
  \<open>P_0x1894c_false_87 \<sigma> \<equiv> RIP \<sigma> = 0x1894c \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R12 \<sigma> = RDX\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1894c_false_87_def[Ps]

definition P_0x1894c_false_87_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1894c_false_87_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x1894c_false_87_regions :: state_pred where
  \<open>P_0x1894c_false_87_regions \<sigma> \<equiv> \<exists>regions. P_0x1894c_false_87_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18951_87 :: state_pred where
  \<open>Q_0x18951_87 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18951_87_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x1894c_0x1894e_87[blocks]:
  assumes \<open>(P_0x1894c_false_87 && P_0x1894c_false_87_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x1894e 87 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18951_87 ?\<sigma> \<and> block_usage P_0x1894c_false_87_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1894c_false_87_def P_0x1894c_false_87_regions_def post: Q_0x18951_87_def regionset: P_0x1894c_false_87_regions_set_def)

definition P_0x18951_88 :: state_pred where
  \<open>P_0x18951_88 \<sigma> \<equiv> RIP \<sigma> = 0x18951 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18951_88_def[Ps]

definition P_0x18951_88_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18951_88_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x18951_88_regions :: state_pred where
  \<open>P_0x18951_88_regions \<sigma> \<equiv> \<exists>regions. P_0x18951_88_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18962_88 :: state_pred where
  \<open>Q_0x18962_88 \<sigma> \<equiv> RIP \<sigma> = 0x18962 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18962_88_def[Qs]

schematic_goal bdrv_pwrite_em_0_2_0x18951_0x18959_88[blocks]:
  assumes \<open>(P_0x18951_88 && P_0x18951_88_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x18959 88 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18962_88 ?\<sigma> \<and> block_usage P_0x18951_88_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18951_88_def P_0x18951_88_regions_def post: Q_0x18962_88_def regionset: P_0x18951_88_regions_set_def)

definition P_0x18962_true_89 :: state_pred where
  \<open>P_0x18962_true_89 \<sigma> \<equiv> RIP \<sigma> = 0x18962 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18962_true_89_def[Ps]

definition P_0x18962_true_89_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18962_true_89_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x18962_true_89_regions :: state_pred where
  \<open>P_0x18962_true_89_regions \<sigma> \<equiv> \<exists>regions. P_0x18962_true_89_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18aec_89 :: state_pred where
  \<open>Q_0x18aec_89 \<sigma> \<equiv> RIP \<sigma> = 0x18aec \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18aec_89_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18962_0x18962_89[blocks]:
  assumes \<open>(P_0x18962_true_89 && P_0x18962_true_89_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18962 89 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18aec_89 ?\<sigma> \<and> block_usage P_0x18962_true_89_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18962_true_89_def P_0x18962_true_89_regions_def post: Q_0x18aec_89_def regionset: P_0x18962_true_89_regions_set_def)

definition P_0x18aec_90 :: state_pred where
  \<open>P_0x18aec_90 \<sigma> \<equiv> RIP \<sigma> = 0x18aec \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18aec_90_def[Ps]

definition P_0x18aec_90_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18aec_90_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18aec_90_regions :: state_pred where
  \<open>P_0x18aec_90_regions \<sigma> \<equiv> \<exists>regions. P_0x18aec_90_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x18aec_90 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x18aec_90 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_stack_chk_fail_addr_0x18aec_90_def[Qs]

schematic_goal bdrv_pwrite_em_0_1_0x18aec_0x18aec_90[blocks]:
  assumes \<open>(P_0x18aec_90 && P_0x18aec_90_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18aec 90 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x18aec_90 ?\<sigma> \<and> block_usage P_0x18aec_90_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18aec_90_def P_0x18aec_90_regions_def post: Q_stack_chk_fail_addr_0x18aec_90_def regionset: P_0x18aec_90_regions_set_def)

definition P_0x18962_false_91 :: state_pred where
  \<open>P_0x18962_false_91 \<sigma> \<equiv> RIP \<sigma> = 0x18962 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18962_false_91_def[Ps]

definition P_0x18962_false_91_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18962_false_91_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x258), 8)
  }\<close>

definition P_0x18962_false_91_regions :: state_pred where
  \<open>P_0x18962_false_91_regions \<sigma> \<equiv> \<exists>regions. P_0x18962_false_91_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_91 :: state_pred where
  \<open>Q_ret_address_91 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x258),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_91_def[Qs]

schematic_goal bdrv_pwrite_em_0_9_0x18962_0x18979_91[blocks]:
  assumes \<open>(P_0x18962_false_91 && P_0x18962_false_91_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x18979 91 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_91 ?\<sigma> \<and> block_usage P_0x18962_false_91_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18962_false_91_def P_0x18962_false_91_regions_def post: Q_ret_address_91_def regionset: P_0x18962_false_91_regions_set_def)

definition bdrv_pwrite_em_acode :: ACode where
  \<open>bdrv_pwrite_em_acode =
    Block 22 0x18937 0;
    IF jg THEN
      Block 6 0x18a20 (Suc 0);
      Block (Suc 0) 0x18a23 2;
      CALL bdrv_read_acode;
      Block (Suc 0) 0x18a28 3;
      IF SF THEN
        Block 3 0x18a05 4
      ELSE
        Block 6 0x18a3d 5;
        IF !CF THEN
          Block 14 0x18a9a 6;
          Block (Suc 0) 0x18a9c 7;
          CALL rep_movs_ESRDI_DSRSI_acode
        ELSE
          Block 2 0x18a42 8;
          IF !ZF THEN
            Block 7 0x18aea 9
          ELSE
            Block 2 0x18a4b 10;
            IF ZF THEN
              Block (Suc 0) 0x18a4d 11
            ELSE
              Block 4 0x18a57 12;
              IF ZF THEN
                Block (Suc 0) 0x18a5a 13
              ELSE
                Block 5 0x18a69 14
              FI
            FI
          FI
        FI;
        Block 4 0x18aab 15;
        Block (Suc 0) 0x18aae 16;
        CALL bdrv_write_acode;
        Block (Suc 0) 0x18ab3 17;
        IF SF THEN
          Block 3 0x18a05 18
        ELSE
          Block 5 0x18ac7 19;
          IF !ZF THEN
            Block 4 0x18945 20;
            IF jg THEN
              Block 5 0x18989 21;
              Block (Suc 0) 0x1898c 22;
              CALL bdrv_write_acode;
              Block (Suc 0) 0x18991 23;
              IF SF THEN
                Block 3 0x18a05 24
              ELSE
                Block 9 0x189ac 25;
                IF jle THEN
                  Block 2 0x1894e 26
                ELSE
                  Block 7 0x189c5 27;
                  Block (Suc 0) 0x189c8 28;
                  CALL bdrv_read_acode;
                  Block (Suc 0) 0x189cd 29;
                  IF SF THEN
                    Block 3 0x18a05 30
                  ELSE
                    Block 5 0x189dc 31;
                    Block (Suc 0) 0x189df 32;
                    CALL memcpy_chk_acode;
                    Block 4 0x189ef 33;
                    Block (Suc 0) 0x189f2 34;
                    CALL bdrv_write_acode;
                    Block (Suc 0) 0x189f7 35;
                    IF !SF THEN
                      Block 2 0x1894e 36
                    ELSE
                      Block 2 0x189ff 37;
                      Block 2 0x18a05 38
                    FI
                  FI
                FI
              FI
            ELSE
              Block 2 0x18949 39;
              IF jg THEN
                Block 7 0x189c5 40;
                Block (Suc 0) 0x189c8 41;
                CALL bdrv_read_acode;
                Block (Suc 0) 0x189cd 42;
                IF SF THEN
                  Block 3 0x18a05 43
                ELSE
                  Block 5 0x189dc 44;
                  Block (Suc 0) 0x189df 45;
                  CALL memcpy_chk_acode;
                  Block 4 0x189ef 46;
                  Block (Suc 0) 0x189f2 47;
                  CALL bdrv_write_acode;
                  Block (Suc 0) 0x189f7 48;
                  IF !SF THEN
                    Block 2 0x1894e 49
                  ELSE
                    Block 2 0x189ff 50;
                    Block 2 0x18a05 51
                  FI
                FI
              ELSE
                Block 2 0x1894e 52
              FI
            FI
          ELSE
            Block 2 0x18ad0 53;
            Block (Suc 0) 0x1894e 54
          FI
        FI
      FI
    ELSE
      Block 4 0x18945 55;
      IF jg THEN
        Block 5 0x18989 56;
        Block (Suc 0) 0x1898c 57;
        CALL bdrv_write_acode;
        Block (Suc 0) 0x18991 58;
        IF SF THEN
          Block 3 0x18a05 59
        ELSE
          Block 9 0x189ac 60;
          IF jle THEN
            Block 2 0x1894e 61
          ELSE
            Block 7 0x189c5 62;
            Block (Suc 0) 0x189c8 63;
            CALL bdrv_read_acode;
            Block (Suc 0) 0x189cd 64;
            IF SF THEN
              Block 3 0x18a05 65
            ELSE
              Block 5 0x189dc 66;
              Block (Suc 0) 0x189df 67;
              CALL memcpy_chk_acode;
              Block 4 0x189ef 68;
              Block (Suc 0) 0x189f2 69;
              CALL bdrv_write_acode;
              Block (Suc 0) 0x189f7 70;
              IF !SF THEN
                Block 2 0x1894e 71
              ELSE
                Block 2 0x189ff 72;
                Block 2 0x18a05 73
              FI
            FI
          FI
        FI
      ELSE
        Block 2 0x18949 74;
        IF jg THEN
          Block 7 0x189c5 75;
          Block (Suc 0) 0x189c8 76;
          CALL bdrv_read_acode;
          Block (Suc 0) 0x189cd 77;
          IF SF THEN
            Block 3 0x18a05 78
          ELSE
            Block 5 0x189dc 79;
            Block (Suc 0) 0x189df 80;
            CALL memcpy_chk_acode;
            Block 4 0x189ef 81;
            Block (Suc 0) 0x189f2 82;
            CALL bdrv_write_acode;
            Block (Suc 0) 0x189f7 83;
            IF !SF THEN
              Block 2 0x1894e 84
            ELSE
              Block 2 0x189ff 85;
              Block 2 0x18a05 86
            FI
          FI
        ELSE
          Block 2 0x1894e 87
        FI
      FI
    FI;
    Block 2 0x18959 88;
    IF !ZF THEN
      Block (Suc 0) 0x18962 89;
      Block (Suc 0) 0x18aec 90;
      CALL stack_chk_fail_acode
    ELSE
      Block 9 0x18979 91
    FI
  \<close>

schematic_goal "bdrv_pwrite_em":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18939 \<longrightarrow> P_0x18939_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a23 \<longrightarrow> P_0x18a23_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a28 \<longrightarrow> P_0x18a28_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a2a \<longrightarrow> P_0x18a2a_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a2a \<longrightarrow> P_0x18a2a_false_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a40 \<longrightarrow> P_0x18a40_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a9c \<longrightarrow> P_0x18a9c_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a40 \<longrightarrow> P_0x18a40_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a45 \<longrightarrow> P_0x18a45_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a45 \<longrightarrow> P_0x18a45_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a4d \<longrightarrow> P_0x18a4d_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a4d \<longrightarrow> P_0x18a4d_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a5a \<longrightarrow> P_0x18a5a_true_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a5a \<longrightarrow> P_0x18a5a_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a9f \<longrightarrow> P_0x18a9f_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18aae \<longrightarrow> P_0x18aae_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18ab3 \<longrightarrow> P_0x18ab3_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18ab5 \<longrightarrow> P_0x18ab5_true_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18ab5 \<longrightarrow> P_0x18ab5_false_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18aca \<longrightarrow> P_0x18aca_true_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18947 \<longrightarrow> P_0x18947_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1898c \<longrightarrow> P_0x1898c_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18991 \<longrightarrow> P_0x18991_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18993 \<longrightarrow> P_0x18993_true_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18993 \<longrightarrow> P_0x18993_false_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189af \<longrightarrow> P_0x189af_true_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189af \<longrightarrow> P_0x189af_false_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189c8 \<longrightarrow> P_0x189c8_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cd \<longrightarrow> P_0x189cd_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cf \<longrightarrow> P_0x189cf_true_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cf \<longrightarrow> P_0x189cf_false_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189df \<longrightarrow> P_0x189df_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189e4 \<longrightarrow> P_0x189e4_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f2 \<longrightarrow> P_0x189f2_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f7 \<longrightarrow> P_0x189f7_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f9 \<longrightarrow> P_0x189f9_true_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f9 \<longrightarrow> P_0x189f9_false_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a00 \<longrightarrow> P_0x18a00_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18947 \<longrightarrow> P_0x18947_false_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1894c \<longrightarrow> P_0x1894c_true_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189c8 \<longrightarrow> P_0x189c8_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cd \<longrightarrow> P_0x189cd_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cf \<longrightarrow> P_0x189cf_true_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cf \<longrightarrow> P_0x189cf_false_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189df \<longrightarrow> P_0x189df_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189e4 \<longrightarrow> P_0x189e4_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f2 \<longrightarrow> P_0x189f2_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f7 \<longrightarrow> P_0x189f7_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f9 \<longrightarrow> P_0x189f9_true_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f9 \<longrightarrow> P_0x189f9_false_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a00 \<longrightarrow> P_0x18a00_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1894c \<longrightarrow> P_0x1894c_false_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18aca \<longrightarrow> P_0x18aca_false_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1894e \<longrightarrow> P_0x1894e_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18939 \<longrightarrow> P_0x18939_false_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18947 \<longrightarrow> P_0x18947_true_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1898c \<longrightarrow> P_0x1898c_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18991 \<longrightarrow> P_0x18991_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18993 \<longrightarrow> P_0x18993_true_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18993 \<longrightarrow> P_0x18993_false_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189af \<longrightarrow> P_0x189af_true_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189af \<longrightarrow> P_0x189af_false_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189c8 \<longrightarrow> P_0x189c8_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cd \<longrightarrow> P_0x189cd_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cf \<longrightarrow> P_0x189cf_true_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cf \<longrightarrow> P_0x189cf_false_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189df \<longrightarrow> P_0x189df_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189e4 \<longrightarrow> P_0x189e4_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f2 \<longrightarrow> P_0x189f2_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f7 \<longrightarrow> P_0x189f7_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f9 \<longrightarrow> P_0x189f9_true_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f9 \<longrightarrow> P_0x189f9_false_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a00 \<longrightarrow> P_0x18a00_73_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18947 \<longrightarrow> P_0x18947_false_74_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1894c \<longrightarrow> P_0x1894c_true_75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189c8 \<longrightarrow> P_0x189c8_76_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cd \<longrightarrow> P_0x189cd_77_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cf \<longrightarrow> P_0x189cf_true_78_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189cf \<longrightarrow> P_0x189cf_false_79_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189df \<longrightarrow> P_0x189df_80_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189e4 \<longrightarrow> P_0x189e4_81_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f2 \<longrightarrow> P_0x189f2_82_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f7 \<longrightarrow> P_0x189f7_83_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f9 \<longrightarrow> P_0x189f9_true_84_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x189f9 \<longrightarrow> P_0x189f9_false_85_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18a00 \<longrightarrow> P_0x18a00_86_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1894c \<longrightarrow> P_0x1894c_false_87_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18951 \<longrightarrow> P_0x18951_88_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18962 \<longrightarrow> P_0x18962_true_89_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18aec \<longrightarrow> P_0x18aec_90_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18962 \<longrightarrow> P_0x18962_false_91_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x18a23_2}} \<box>bdrv_read_acode {{P_0x18a28_3;M_0x18a23}}\<close>
    and [blocks]: \<open>{{Q_rep_movs_ESRDI_DSRSI_addr_0x18a9c_7}} \<box>rep_movs_ESRDI_DSRSI_acode {{P_0x18a9f_15;M_0x18a9c}}\<close> (* post originally _8, generation error *)
    and [blocks]: \<open>{{Q_bdrv_write_addr_0x18aae_16}} \<box>bdrv_write_acode {{P_0x18ab3_17;M_0x18aae}}\<close>
    and [blocks]: \<open>{{Q_bdrv_write_addr_0x1898c_22}} \<box>bdrv_write_acode {{P_0x18991_23;M_0x1898c}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x189c8_28}} \<box>bdrv_read_acode {{P_0x189cd_29;M_0x189c8}}\<close>
    and [blocks]: \<open>{{Q_memcpy_chk_addr_0x189df_32}} \<box>memcpy_chk_acode {{P_0x189e4_33;M_0x189df}}\<close>
    and [blocks]: \<open>{{Q_bdrv_write_addr_0x189f2_34}} \<box>bdrv_write_acode {{P_0x189f7_35;M_0x189f2}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x189c8_41}} \<box>bdrv_read_acode {{P_0x189cd_42;M_0x189c8}}\<close>
    and [blocks]: \<open>{{Q_memcpy_chk_addr_0x189df_45}} \<box>memcpy_chk_acode {{P_0x189e4_46;M_0x189df}}\<close>
    and [blocks]: \<open>{{Q_bdrv_write_addr_0x189f2_47}} \<box>bdrv_write_acode {{P_0x189f7_48;M_0x189f2}}\<close>
    and [blocks]: \<open>{{Q_bdrv_write_addr_0x1898c_57}} \<box>bdrv_write_acode {{P_0x18991_58;M_0x1898c}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x189c8_63}} \<box>bdrv_read_acode {{P_0x189cd_64;M_0x189c8}}\<close>
    and [blocks]: \<open>{{Q_memcpy_chk_addr_0x189df_67}} \<box>memcpy_chk_acode {{P_0x189e4_68;M_0x189df}}\<close>
    and [blocks]: \<open>{{Q_bdrv_write_addr_0x189f2_69}} \<box>bdrv_write_acode {{P_0x189f7_70;M_0x189f2}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x189c8_76}} \<box>bdrv_read_acode {{P_0x189cd_77;M_0x189c8}}\<close>
    and [blocks]: \<open>{{Q_memcpy_chk_addr_0x189df_80}} \<box>memcpy_chk_acode {{P_0x189e4_81;M_0x189df}}\<close>
    and [blocks]: \<open>{{Q_bdrv_write_addr_0x189f2_82}} \<box>bdrv_write_acode {{P_0x189f7_83;M_0x189f2}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x18aec_90}} \<box>stack_chk_fail_acode {{Q_fail;M_0x18aec}}\<close>
  shows \<open>{{?P}} bdrv_pwrite_em_acode {{?Q;?M}}\<close>
  by (vcg acode: bdrv_pwrite_em_acode_def assms: assms)

end

end
