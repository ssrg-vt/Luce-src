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
theory copy_sectors
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes memset_0x14190_retval\<^sub>v get_cluster_offset_0x141c8_retval\<^sub>v decompress_cluster_0x141fa_retval\<^sub>v memcpy_0x14226_retval\<^sub>v encrypt_sectors_isra_12_0x14275_retval\<^sub>v bdrv_write_0x1429d_retval\<^sub>v memset_0x142ed_retval\<^sub>v bdrv_read_0x1430a_retval\<^sub>v memset_0x1432b_retval\<^sub>v bdrv_pread_0x14358_retval\<^sub>v encrypt_sectors_isra_12_0x1438f_retval\<^sub>v stack_chk_fail_0x14399_retval\<^sub>v stack_chk_fail_addr bdrv_pread_addr bdrv_read_addr bdrv_write_addr decompress_cluster_addr encrypt_sectors_isra_12_addr get_cluster_offset_addr memcpy_addr memset_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode bdrv_pread_acode bdrv_read_acode bdrv_write_acode decompress_cluster_acode encrypt_sectors_isra_12_acode get_cluster_offset_acode memcpy_acode memset_acode :: ACode
  assumes fetch:
    "fetch 0x140f0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x140f2 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x140f5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x140f7 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x140f9 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x140fb \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x140fc \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x140fd \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 72)), 4)"
    "fetch 0x14101 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rdx))), 5)"
    "fetch 0x14106 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x1410f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x14114 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x14116 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x14119 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 82604)), 6)"
    "fetch 0x1411f \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x14122 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x14126 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x14129 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x1412c \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1412f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x14134 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52)))), 5)"
    "fetch 0x14139 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 280))))), 8)"
    "fetch 0x14141 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40)))) (Storage (Reg (General SixtyFour rsi))), 5)"
    "fetch 0x14146 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x14149 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x1414e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 36)))) (Storage (Reg (General ThirtyTwo r8))), 5)"
    "fetch 0x14153 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 82356)), 2)"
    "fetch 0x14155 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x14158 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 2128))))), 7)"
    "fetch 0x1415f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52))))), 4)"
    "fetch 0x14163 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x14166 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 82720)), 6)"
    "fetch 0x1416c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x1416f \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x14172 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x14175 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x14178 \<equiv> (Unary (IS_8088 Jge) (Immediate SixtyFour (ImmVal 82677)), 6)"
    "fetch 0x1417e \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x14181 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 82640)), 6)"
    "fetch 0x14187 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x1418a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1418d \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x14190 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memset'')), 5)"
    "fetch 0x14195 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52))))), 5)"
    "fetch 0x1419a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x1419c \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x1419f \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x141a2 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x141a5 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x141a8 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x141ab \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x141ae \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 82496)), 6)"
    "fetch 0x141b4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x141b7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x141bc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x141bf \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52)))) (Storage (Reg (General ThirtyTwo r14))), 5)"
    "fetch 0x141c4 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x141c8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''get_cluster_offset'')), 5)"
    "fetch 0x141cd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x141d0 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x141d3 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 82264)), 2)"
    "fetch 0x141d5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 16))))), 5)"
    "fetch 0x141da \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo r8)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rax)) (A_WordConstant 1)))), 4)"
    "fetch 0x141de \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 4611686018427387904)), 10)"
    "fetch 0x141e8 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo rbp))), 3)"
    "fetch 0x141eb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x141ee \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x141f1 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 82752)), 6)"
    "fetch 0x141f7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x141fa \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''decompress_cluster'')), 5)"
    "fetch 0x141ff \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x14201 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 82711)), 6)"
    "fetch 0x14207 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52))))), 4)"
    "fetch 0x1420b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x1420e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x14211 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo r8)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x14215 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x14218 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rsi)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x1421b \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 272))))), 8)"
    "fetch 0x14223 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x14226 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0x1422b \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52))))), 5)"
    "fetch 0x14230 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x14232 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x14235 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 82335)), 5)"
    "fetch 0x1423a \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x14240 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 352))))), 8)"
    "fetch 0x14248 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 36))))), 5)"
    "fetch 0x1424d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 280))))), 8)"
    "fetch 0x14255 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x14257 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 82562)), 2)"
    "fetch 0x14259 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40))))), 5)"
    "fetch 0x1425e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x14261 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x14264 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x14267 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 360)))), 8)"
    "fetch 0x1426f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Immediate SixtyFour (ImmVal 1)), 6)"
    "fetch 0x14275 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''encrypt_sectors.isra.12'')), 5)"
    "fetch 0x1427a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 280))))), 8)"
    "fetch 0x14282 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x14287 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x1428c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1428f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r12))))), 4)"
    "fetch 0x14293 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x14297 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x1429a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x1429d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_write'')), 5)"
    "fetch 0x142a2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 0)), 5)"
    "fetch 0x142a7 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x142a9 \<equiv> (Binary (IS_PentiumPro Cmovg) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x142ac \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56))))), 5)"
    "fetch 0x142b1 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x142ba \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 82841)), 6)"
    "fetch 0x142c0 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 72)), 4)"
    "fetch 0x142c4 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x142c5 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x142c6 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x142c8 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x142ca \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x142cc \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x142ce \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x142cf \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x142d0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x142d3 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x142d5 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo rbp))), 3)"
    "fetch 0x142d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x142db \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x142de \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x142e1 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x142e4 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdi)) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x142e7 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x142ea \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x142ed \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memset'')), 5)"
    "fetch 0x142f2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x142f5 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x142f7 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 82325)), 6)"
    "fetch 0x142fd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 2128))))), 7)"
    "fetch 0x14304 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x14307 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1430a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_read'')), 5)"
    "fetch 0x1430f \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x14311 \<equiv> (Unary (IS_8088 Jns) (Immediate SixtyFour (ImmVal 82325)), 6)"
    "fetch 0x14317 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x1431c \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 82604)), 2)"
    "fetch 0x1431e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x14320 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x14323 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x14325 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x14328 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x1432b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memset'')), 5)"
    "fetch 0x14330 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52))))), 5)"
    "fetch 0x14335 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x14337 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x1433a \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 82335)), 5)"
    "fetch 0x1433f \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x14340 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52))))), 4)"
    "fetch 0x14344 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo r8)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x14348 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r12))))), 4)"
    "fetch 0x1434c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1434f \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r8)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x14352 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x14355 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x14358 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_pread'')), 5)"
    "fetch 0x1435d \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52))))), 5)"
    "fetch 0x14362 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x14364 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x14367 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x14369 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 82711)), 2)"
    "fetch 0x1436b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 352))))), 8)"
    "fetch 0x14373 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x14375 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 82335)), 6)"
    "fetch 0x1437b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x1437e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x14381 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x14384 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x14387 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 604)))), 8)"
    "fetch 0x1438f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''encrypt_sectors.isra.12'')), 5)"
    "fetch 0x14394 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 82325)), 5)"
    "fetch 0x14399 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x1439e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and bdrv_pread\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_pread'') = bdrv_pread_addr\<close>
    and bdrv_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_read'') = bdrv_read_addr\<close>
    and bdrv_write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_write'') = bdrv_write_addr\<close>
    and decompress_cluster\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''decompress_cluster'') = decompress_cluster_addr\<close>
    and encrypt_sectors_isra_12\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''encrypt_sectors.isra.12'') = encrypt_sectors_isra_12_addr\<close>
    and get_cluster_offset\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''get_cluster_offset'') = get_cluster_offset_addr\<close>
    and memcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcpy'') = memcpy_addr\<close>
    and memset\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memset'') = memset_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>memset_0x14190_retval \<equiv> memset_0x14190_retval\<^sub>v\<close>
definition \<open>get_cluster_offset_0x141c8_retval \<equiv> get_cluster_offset_0x141c8_retval\<^sub>v\<close>
definition \<open>decompress_cluster_0x141fa_retval \<equiv> decompress_cluster_0x141fa_retval\<^sub>v\<close>
definition \<open>memcpy_0x14226_retval \<equiv> memcpy_0x14226_retval\<^sub>v\<close>
definition \<open>encrypt_sectors_isra_12_0x14275_retval \<equiv> encrypt_sectors_isra_12_0x14275_retval\<^sub>v\<close>
definition \<open>bdrv_write_0x1429d_retval \<equiv> bdrv_write_0x1429d_retval\<^sub>v\<close>
definition \<open>memset_0x142ed_retval \<equiv> memset_0x142ed_retval\<^sub>v\<close>
definition \<open>bdrv_read_0x1430a_retval \<equiv> bdrv_read_0x1430a_retval\<^sub>v\<close>
definition \<open>memset_0x1432b_retval \<equiv> memset_0x1432b_retval\<^sub>v\<close>
definition \<open>bdrv_pread_0x14358_retval \<equiv> bdrv_pread_0x14358_retval\<^sub>v\<close>
definition \<open>encrypt_sectors_isra_12_0x1438f_retval \<equiv> encrypt_sectors_isra_12_0x1438f_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x14399_retval \<equiv> stack_chk_fail_0x14399_retval\<^sub>v\<close>

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

locale "copy_sectors" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x140f0_0 :: state_pred where
  \<open>P_0x140f0_0 \<sigma> \<equiv> RIP \<sigma> = 0x140f0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x140f0_0_def[Ps]

definition P_0x140f0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x140f0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x140f0_0_regions :: state_pred where
  \<open>P_0x140f0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x140f0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14119_0 :: state_pred where
  \<open>Q_0x14119_0 \<sigma> \<equiv> RIP \<sigma> = 0x14119 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare Q_0x14119_0_def[Qs]

schematic_goal copy_sectors_0_13_0x140f0_0x14116_0[blocks]:
  assumes \<open>(P_0x140f0_0 && P_0x140f0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 13 0x14116 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14119_0 ?\<sigma> \<and> block_usage P_0x140f0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x140f0_0_def P_0x140f0_0_regions_def post: Q_0x14119_0_def regionset: P_0x140f0_0_regions_set_def)

definition P_0x14119_true_1 :: state_pred where
  \<open>P_0x14119_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x14119 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare P_0x14119_true_1_def[Ps]

definition P_0x14119_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14119_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x14119_true_1_regions :: state_pred where
  \<open>P_0x14119_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x14119_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x142ac_1 :: state_pred where
  \<open>Q_0x142ac_1 \<sigma> \<equiv> RIP \<sigma> = 0x142ac \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare Q_0x142ac_1_def[Qs]

schematic_goal copy_sectors_0_1_0x14119_0x14119_1[blocks]:
  assumes \<open>(P_0x14119_true_1 && P_0x14119_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14119 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x142ac_1 ?\<sigma> \<and> block_usage P_0x14119_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14119_true_1_def P_0x14119_true_1_regions_def post: Q_0x142ac_1_def regionset: P_0x14119_true_1_regions_set_def)

definition P_0x14119_false_2 :: state_pred where
  \<open>P_0x14119_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x14119 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare P_0x14119_false_2_def[Ps]

definition P_0x14119_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14119_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x14119_false_2_regions :: state_pred where
  \<open>P_0x14119_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x14119_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141b4_2 :: state_pred where
  \<open>Q_0x141b4_2 \<sigma> \<equiv> RIP \<sigma> = 0x141b4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141b4_2_def[Qs]

schematic_goal copy_sectors_0_14_0x14119_0x14153_2[blocks]:
  assumes \<open>(P_0x14119_false_2 && P_0x14119_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 14 0x14153 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141b4_2 ?\<sigma> \<and> block_usage P_0x14119_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14119_false_2_def P_0x14119_false_2_regions_def post: Q_0x141b4_2_def regionset: P_0x14119_false_2_regions_set_def)

definition P_0x141b4_3 :: state_pred where
  \<open>P_0x141b4_3 \<sigma> \<equiv> RIP \<sigma> = 0x141b4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141b4_3_def[Ps]

definition P_0x141b4_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141b4_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141b4_3_regions :: state_pred where
  \<open>P_0x141b4_3_regions \<sigma> \<equiv> \<exists>regions. P_0x141b4_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141c8_3 :: state_pred where
  \<open>Q_0x141c8_3 \<sigma> \<equiv> RIP \<sigma> = 0x141c8 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RBP \<sigma>::64 word))::64 word) << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141c8_3_def[Qs]

schematic_goal copy_sectors_0_5_0x141b4_0x141c4_3[blocks]:
  assumes \<open>(P_0x141b4_3 && P_0x141b4_3_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x141c4 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141c8_3 ?\<sigma> \<and> block_usage P_0x141b4_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141b4_3_def P_0x141b4_3_regions_def post: Q_0x141c8_3_def regionset: P_0x141b4_3_regions_set_def)

definition P_0x141c8_4 :: state_pred where
  \<open>P_0x141c8_4 \<sigma> \<equiv> RIP \<sigma> = 0x141c8 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RBP \<sigma>::64 word))::64 word) << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141c8_4_def[Ps]

definition P_0x141c8_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141c8_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x141c8_4_regions :: state_pred where
  \<open>P_0x141c8_4_regions \<sigma> \<equiv> \<exists>regions. P_0x141c8_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_cluster_offset_addr_0x141c8_4 :: state_pred where
  \<open>Q_get_cluster_offset_addr_0x141c8_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = get_cluster_offset_addr \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RBP \<sigma>::64 word))::64 word) << 9) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare Q_get_cluster_offset_addr_0x141c8_4_def[Qs]

schematic_goal copy_sectors_0_1_0x141c8_0x141c8_4[blocks]:
  assumes \<open>(P_0x141c8_4 && P_0x141c8_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141c8 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_cluster_offset_addr_0x141c8_4 ?\<sigma> \<and> block_usage P_0x141c8_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141c8_4_def P_0x141c8_4_regions_def post: Q_get_cluster_offset_addr_0x141c8_4_def regionset: P_0x141c8_4_regions_set_def)

definition P_0x141cd_5 :: state_pred where
  \<open>P_0x141cd_5 \<sigma> \<equiv> RIP \<sigma> = 0x141cd \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RBP \<sigma>::64 word))::64 word) << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare P_0x141cd_5_def[Ps]

definition P_0x141cd_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141cd_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x141cd_5_regions :: state_pred where
  \<open>P_0x141cd_5_regions \<sigma> \<equiv> \<exists>regions. P_0x141cd_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141d3_5 :: state_pred where
  \<open>Q_0x141d3_5 \<sigma> \<equiv> RIP \<sigma> = 0x141d3 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RAX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare Q_0x141d3_5_def[Qs]

schematic_goal copy_sectors_0_2_0x141cd_0x141d0_5[blocks]:
  assumes \<open>(P_0x141cd_5 && P_0x141cd_5_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x141d0 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141d3_5 ?\<sigma> \<and> block_usage P_0x141cd_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141cd_5_def P_0x141cd_5_regions_def post: Q_0x141d3_5_def regionset: P_0x141cd_5_regions_set_def)

definition P_0x141d3_true_6 :: state_pred where
  \<open>P_0x141d3_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x141d3 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RAX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare P_0x141d3_true_6_def[Ps]

definition P_0x141d3_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141d3_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x141d3_true_6_regions :: state_pred where
  \<open>P_0x141d3_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x141d3_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14166_6 :: state_pred where
  \<open>Q_0x14166_6 \<sigma> \<equiv> RIP \<sigma> = 0x14166 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare Q_0x14166_6_def[Qs]

schematic_goal copy_sectors_0_4_0x141d3_0x14163_6[blocks]:
  assumes \<open>(P_0x141d3_true_6 && P_0x141d3_true_6_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x14163 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14166_6 ?\<sigma> \<and> block_usage P_0x141d3_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141d3_true_6_def P_0x141d3_true_6_regions_def post: Q_0x14166_6_def regionset: P_0x141d3_true_6_regions_set_def)

definition P_0x14166_true_7 :: state_pred where
  \<open>P_0x14166_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x14166 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare P_0x14166_true_7_def[Ps]

definition P_0x14166_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14166_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x14166_true_7_regions :: state_pred where
  \<open>P_0x14166_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x14166_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1432b_7 :: state_pred where
  \<open>Q_0x1432b_7 \<sigma> \<equiv> RIP \<sigma> = 0x1432b \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare Q_0x1432b_7_def[Qs]

schematic_goal copy_sectors_0_5_0x14166_0x14328_7[blocks]:
  assumes \<open>(P_0x14166_true_7 && P_0x14166_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x14328 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1432b_7 ?\<sigma> \<and> block_usage P_0x14166_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14166_true_7_def P_0x14166_true_7_regions_def post: Q_0x1432b_7_def regionset: P_0x14166_true_7_regions_set_def)

definition P_0x1432b_8 :: state_pred where
  \<open>P_0x1432b_8 \<sigma> \<equiv> RIP \<sigma> = 0x1432b \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare P_0x1432b_8_def[Ps]

definition P_0x1432b_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1432b_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1432b_8_regions :: state_pred where
  \<open>P_0x1432b_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1432b_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memset_addr_0x1432b_8 :: state_pred where
  \<open>Q_memset_addr_0x1432b_8 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = memset_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14330\<close>
declare Q_memset_addr_0x1432b_8_def[Qs]

schematic_goal copy_sectors_0_1_0x1432b_0x1432b_8[blocks]:
  assumes \<open>(P_0x1432b_8 && P_0x1432b_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1432b 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memset_addr_0x1432b_8 ?\<sigma> \<and> block_usage P_0x1432b_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1432b_8_def P_0x1432b_8_regions_def post: Q_memset_addr_0x1432b_8_def regionset: P_0x1432b_8_regions_set_def)

definition P_0x14330_9 :: state_pred where
  \<open>P_0x14330_9 \<sigma> \<equiv> RIP \<sigma> = 0x14330 \<and> RAX \<sigma> = memset_0x1432b_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14330\<close>
declare P_0x14330_9_def[Ps]

definition P_0x14330_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14330_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x14330_9_regions :: state_pred where
  \<open>P_0x14330_9_regions \<sigma> \<equiv> \<exists>regions. P_0x14330_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1419f_9 :: state_pred where
  \<open>Q_0x1419f_9 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = memset_0x1432b_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14330\<close>
declare Q_0x1419f_9_def[Qs]

schematic_goal copy_sectors_0_4_0x14330_0x1433a_9[blocks]:
  assumes \<open>(P_0x14330_9 && P_0x14330_9_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1433a 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1419f_9 ?\<sigma> \<and> block_usage P_0x14330_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14330_9_def P_0x14330_9_regions_def post: Q_0x1419f_9_def regionset: P_0x14330_9_regions_set_def)

definition P_0x1419f_10 :: state_pred where
  \<open>P_0x1419f_10 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = memset_0x1432b_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14330\<close>
declare P_0x1419f_10_def[Ps]

definition P_0x1419f_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1419f_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1419f_10_regions :: state_pred where
  \<open>P_0x1419f_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1419f_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141ae_10 :: state_pred where
  \<open>Q_0x141ae_10 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141ae_10_def[Qs]

schematic_goal copy_sectors_0_5_0x1419f_0x141ab_10[blocks]:
  assumes \<open>(P_0x1419f_10 && P_0x1419f_10_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x141ab 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141ae_10 ?\<sigma> \<and> block_usage P_0x1419f_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1419f_10_def P_0x1419f_10_regions_def post: Q_0x141ae_10_def regionset: P_0x1419f_10_regions_set_def)

definition P_0x141ae_true_11 :: state_pred where
  \<open>P_0x141ae_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_true_11_def[Ps]

definition P_0x141ae_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_true_11_regions :: state_pred where
  \<open>P_0x141ae_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14240_11 :: state_pred where
  \<open>Q_0x14240_11 \<sigma> \<equiv> RIP \<sigma> = 0x14240 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14240_11_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_11[blocks]:
  assumes \<open>(P_0x141ae_true_11 && P_0x141ae_true_11_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14240_11 ?\<sigma> \<and> block_usage P_0x141ae_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_true_11_def P_0x141ae_true_11_regions_def post: Q_0x14240_11_def regionset: P_0x141ae_true_11_regions_set_def)

definition P_0x141ae_false_12 :: state_pred where
  \<open>P_0x141ae_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_false_12_def[Ps]

definition P_0x141ae_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_false_12_regions :: state_pred where
  \<open>P_0x141ae_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141b4_12 :: state_pred where
  \<open>Q_0x141b4_12 \<sigma> \<equiv> RIP \<sigma> = 0x141b4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141b4_12_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_12[blocks]:
  assumes \<open>(P_0x141ae_false_12 && P_0x141ae_false_12_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141b4_12 ?\<sigma> \<and> block_usage P_0x141ae_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_false_12_def P_0x141ae_false_12_regions_def post: Q_0x141b4_12_def regionset: P_0x141ae_false_12_regions_set_def)

definition P_0x14166_false_13 :: state_pred where
  \<open>P_0x14166_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x14166 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare P_0x14166_false_13_def[Ps]

definition P_0x14166_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14166_false_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14166_false_13_regions :: state_pred where
  \<open>P_0x14166_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x14166_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14178_13 :: state_pred where
  \<open>Q_0x14178_13 \<sigma> \<equiv> RIP \<sigma> = 0x14178 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x14178_13_def[Qs]

schematic_goal copy_sectors_0_5_0x14166_0x14175_13[blocks]:
  assumes \<open>(P_0x14166_false_13 && P_0x14166_false_13_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x14175 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14178_13 ?\<sigma> \<and> block_usage P_0x14166_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14166_false_13_def P_0x14166_false_13_regions_def post: Q_0x14178_13_def regionset: P_0x14166_false_13_regions_set_def)

definition P_0x14178_true_14 :: state_pred where
  \<open>P_0x14178_true_14 \<sigma> \<equiv> RIP \<sigma> = 0x14178 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x14178_true_14_def[Ps]

definition P_0x14178_true_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14178_true_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14178_true_14_regions :: state_pred where
  \<open>P_0x14178_true_14_regions \<sigma> \<equiv> \<exists>regions. P_0x14178_true_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x142f7_14 :: state_pred where
  \<open>Q_0x142f7_14 \<sigma> \<equiv> RIP \<sigma> = 0x142f7 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x142f7_14_def[Qs]

schematic_goal copy_sectors_0_2_0x14178_0x142f5_14[blocks]:
  assumes \<open>(P_0x14178_true_14 && P_0x14178_true_14_regions && jge) \<sigma>\<close>
  shows \<open>exec_block 2 0x142f5 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x142f7_14 ?\<sigma> \<and> block_usage P_0x14178_true_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14178_true_14_def P_0x14178_true_14_regions_def post: Q_0x142f7_14_def regionset: P_0x14178_true_14_regions_set_def)

definition P_0x142f7_true_15 :: state_pred where
  \<open>P_0x142f7_true_15 \<sigma> \<equiv> RIP \<sigma> = 0x142f7 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x142f7_true_15_def[Ps]

definition P_0x142f7_true_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142f7_true_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x142f7_true_15_regions :: state_pred where
  \<open>P_0x142f7_true_15_regions \<sigma> \<equiv> \<exists>regions. P_0x142f7_true_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1419f_15 :: state_pred where
  \<open>Q_0x1419f_15 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x1419f_15_def[Qs]

schematic_goal copy_sectors_0_4_0x142f7_0x1419c_15[blocks]:
  assumes \<open>(P_0x142f7_true_15 && P_0x142f7_true_15_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 4 0x1419c 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1419f_15 ?\<sigma> \<and> block_usage P_0x142f7_true_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142f7_true_15_def P_0x142f7_true_15_regions_def post: Q_0x1419f_15_def regionset: P_0x142f7_true_15_regions_set_def)

definition P_0x1419f_16 :: state_pred where
  \<open>P_0x1419f_16 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x1419f_16_def[Ps]

definition P_0x1419f_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1419f_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x1419f_16_regions :: state_pred where
  \<open>P_0x1419f_16_regions \<sigma> \<equiv> \<exists>regions. P_0x1419f_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141ae_16 :: state_pred where
  \<open>Q_0x141ae_16 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141ae_16_def[Qs]

schematic_goal copy_sectors_0_5_0x1419f_0x141ab_16[blocks]:
  assumes \<open>(P_0x1419f_16 && P_0x1419f_16_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x141ab 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141ae_16 ?\<sigma> \<and> block_usage P_0x1419f_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1419f_16_def P_0x1419f_16_regions_def post: Q_0x141ae_16_def regionset: P_0x1419f_16_regions_set_def)

definition P_0x141ae_true_17 :: state_pred where
  \<open>P_0x141ae_true_17 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_true_17_def[Ps]

definition P_0x141ae_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_true_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_true_17_regions :: state_pred where
  \<open>P_0x141ae_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14240_17 :: state_pred where
  \<open>Q_0x14240_17 \<sigma> \<equiv> RIP \<sigma> = 0x14240 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14240_17_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_17[blocks]:
  assumes \<open>(P_0x141ae_true_17 && P_0x141ae_true_17_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14240_17 ?\<sigma> \<and> block_usage P_0x141ae_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_true_17_def P_0x141ae_true_17_regions_def post: Q_0x14240_17_def regionset: P_0x141ae_true_17_regions_set_def)

definition P_0x141ae_false_18 :: state_pred where
  \<open>P_0x141ae_false_18 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_false_18_def[Ps]

definition P_0x141ae_false_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_false_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_false_18_regions :: state_pred where
  \<open>P_0x141ae_false_18_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_false_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141b4_18 :: state_pred where
  \<open>Q_0x141b4_18 \<sigma> \<equiv> RIP \<sigma> = 0x141b4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141b4_18_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_18[blocks]:
  assumes \<open>(P_0x141ae_false_18 && P_0x141ae_false_18_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141b4_18 ?\<sigma> \<and> block_usage P_0x141ae_false_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_false_18_def P_0x141ae_false_18_regions_def post: Q_0x141b4_18_def regionset: P_0x141ae_false_18_regions_set_def)

definition P_0x142f7_false_19 :: state_pred where
  \<open>P_0x142f7_false_19 \<sigma> \<equiv> RIP \<sigma> = 0x142f7 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x142f7_false_19_def[Ps]

definition P_0x142f7_false_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142f7_false_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x142f7_false_19_regions :: state_pred where
  \<open>P_0x142f7_false_19_regions \<sigma> \<equiv> \<exists>regions. P_0x142f7_false_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1430a_19 :: state_pred where
  \<open>Q_0x1430a_19 \<sigma> \<equiv> RIP \<sigma> = 0x1430a \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x1430a_19_def[Qs]

schematic_goal copy_sectors_0_4_0x142f7_0x14307_19[blocks]:
  assumes \<open>(P_0x142f7_false_19 && P_0x142f7_false_19_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 4 0x14307 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1430a_19 ?\<sigma> \<and> block_usage P_0x142f7_false_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142f7_false_19_def P_0x142f7_false_19_regions_def post: Q_0x1430a_19_def regionset: P_0x142f7_false_19_regions_set_def)

definition P_0x1430a_20 :: state_pred where
  \<open>P_0x1430a_20 \<sigma> \<equiv> RIP \<sigma> = 0x1430a \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x1430a_20_def[Ps]

definition P_0x1430a_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1430a_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x1430a_20_regions :: state_pred where
  \<open>P_0x1430a_20_regions \<sigma> \<equiv> \<exists>regions. P_0x1430a_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x1430a_20 :: state_pred where
  \<open>Q_bdrv_read_addr_0x1430a_20 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_bdrv_read_addr_0x1430a_20_def[Qs]

schematic_goal copy_sectors_0_1_0x1430a_0x1430a_20[blocks]:
  assumes \<open>(P_0x1430a_20 && P_0x1430a_20_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1430a 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x1430a_20 ?\<sigma> \<and> block_usage P_0x1430a_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1430a_20_def P_0x1430a_20_regions_def post: Q_bdrv_read_addr_0x1430a_20_def regionset: P_0x1430a_20_regions_set_def)

definition P_0x1430f_21 :: state_pred where
  \<open>P_0x1430f_21 \<sigma> \<equiv> RIP \<sigma> = 0x1430f \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x1430f_21_def[Ps]

definition P_0x1430f_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1430f_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x1430f_21_regions :: state_pred where
  \<open>P_0x1430f_21_regions \<sigma> \<equiv> \<exists>regions. P_0x1430f_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14311_21 :: state_pred where
  \<open>Q_0x14311_21 \<sigma> \<equiv> RIP \<sigma> = 0x14311 \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x14311_21_def[Qs]

schematic_goal copy_sectors_0_1_0x1430f_0x1430f_21[blocks]:
  assumes \<open>(P_0x1430f_21 && P_0x1430f_21_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1430f 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14311_21 ?\<sigma> \<and> block_usage P_0x1430f_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1430f_21_def P_0x1430f_21_regions_def post: Q_0x14311_21_def regionset: P_0x1430f_21_regions_set_def)

definition P_0x14311_true_22 :: state_pred where
  \<open>P_0x14311_true_22 \<sigma> \<equiv> RIP \<sigma> = 0x14311 \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x14311_true_22_def[Ps]

definition P_0x14311_true_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14311_true_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14311_true_22_regions :: state_pred where
  \<open>P_0x14311_true_22_regions \<sigma> \<equiv> \<exists>regions. P_0x14311_true_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1419f_22 :: state_pred where
  \<open>Q_0x1419f_22 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x1419f_22_def[Qs]

schematic_goal copy_sectors_0_4_0x14311_0x1419c_22[blocks]:
  assumes \<open>(P_0x14311_true_22 && P_0x14311_true_22_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1419c 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1419f_22 ?\<sigma> \<and> block_usage P_0x14311_true_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14311_true_22_def P_0x14311_true_22_regions_def post: Q_0x1419f_22_def regionset: P_0x14311_true_22_regions_set_def)

definition P_0x1419f_23 :: state_pred where
  \<open>P_0x1419f_23 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x1419f_23_def[Ps]

definition P_0x1419f_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1419f_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x1419f_23_regions :: state_pred where
  \<open>P_0x1419f_23_regions \<sigma> \<equiv> \<exists>regions. P_0x1419f_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141ae_23 :: state_pred where
  \<open>Q_0x141ae_23 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141ae_23_def[Qs]

schematic_goal copy_sectors_0_5_0x1419f_0x141ab_23[blocks]:
  assumes \<open>(P_0x1419f_23 && P_0x1419f_23_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x141ab 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141ae_23 ?\<sigma> \<and> block_usage P_0x1419f_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1419f_23_def P_0x1419f_23_regions_def post: Q_0x141ae_23_def regionset: P_0x1419f_23_regions_set_def)

definition P_0x141ae_true_24 :: state_pred where
  \<open>P_0x141ae_true_24 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_true_24_def[Ps]

definition P_0x141ae_true_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_true_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_true_24_regions :: state_pred where
  \<open>P_0x141ae_true_24_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_true_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14240_24 :: state_pred where
  \<open>Q_0x14240_24 \<sigma> \<equiv> RIP \<sigma> = 0x14240 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14240_24_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_24[blocks]:
  assumes \<open>(P_0x141ae_true_24 && P_0x141ae_true_24_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14240_24 ?\<sigma> \<and> block_usage P_0x141ae_true_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_true_24_def P_0x141ae_true_24_regions_def post: Q_0x14240_24_def regionset: P_0x141ae_true_24_regions_set_def)

definition P_0x141ae_false_25 :: state_pred where
  \<open>P_0x141ae_false_25 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_false_25_def[Ps]

definition P_0x141ae_false_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_false_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_false_25_regions :: state_pred where
  \<open>P_0x141ae_false_25_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_false_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141b4_25 :: state_pred where
  \<open>Q_0x141b4_25 \<sigma> \<equiv> RIP \<sigma> = 0x141b4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141b4_25_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_25[blocks]:
  assumes \<open>(P_0x141ae_false_25 && P_0x141ae_false_25_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141b4_25 ?\<sigma> \<and> block_usage P_0x141ae_false_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_false_25_def P_0x141ae_false_25_regions_def post: Q_0x141b4_25_def regionset: P_0x141ae_false_25_regions_set_def)

definition P_0x14311_false_26 :: state_pred where
  \<open>P_0x14311_false_26 \<sigma> \<equiv> RIP \<sigma> = 0x14311 \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x14311_false_26_def[Ps]

definition P_0x14311_false_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14311_false_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14311_false_26_regions :: state_pred where
  \<open>P_0x14311_false_26_regions \<sigma> \<equiv> \<exists>regions. P_0x14311_false_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14317_26 :: state_pred where
  \<open>Q_0x14317_26 \<sigma> \<equiv> RIP \<sigma> = 0x14317 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14317_26_def[Qs]

schematic_goal copy_sectors_0_1_0x14311_0x14311_26[blocks]:
  assumes \<open>(P_0x14311_false_26 && P_0x14311_false_26_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14311 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14317_26 ?\<sigma> \<and> block_usage P_0x14311_false_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14311_false_26_def P_0x14311_false_26_regions_def post: Q_0x14317_26_def regionset: P_0x14311_false_26_regions_set_def)

definition P_0x14178_false_27 :: state_pred where
  \<open>P_0x14178_false_27 \<sigma> \<equiv> RIP \<sigma> = 0x14178 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x14178_false_27_def[Ps]

definition P_0x14178_false_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14178_false_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14178_false_27_regions :: state_pred where
  \<open>P_0x14178_false_27_regions \<sigma> \<equiv> \<exists>regions. P_0x14178_false_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14181_27 :: state_pred where
  \<open>Q_0x14181_27 \<sigma> \<equiv> RIP \<sigma> = 0x14181 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x14181_27_def[Qs]

schematic_goal copy_sectors_0_2_0x14178_0x1417e_27[blocks]:
  assumes \<open>(P_0x14178_false_27 && P_0x14178_false_27_regions && ! jge) \<sigma>\<close>
  shows \<open>exec_block 2 0x1417e 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14181_27 ?\<sigma> \<and> block_usage P_0x14178_false_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14178_false_27_def P_0x14178_false_27_regions_def post: Q_0x14181_27_def regionset: P_0x14178_false_27_regions_set_def)

definition P_0x14181_true_28 :: state_pred where
  \<open>P_0x14181_true_28 \<sigma> \<equiv> RIP \<sigma> = 0x14181 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x14181_true_28_def[Ps]

definition P_0x14181_true_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14181_true_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14181_true_28_regions :: state_pred where
  \<open>P_0x14181_true_28_regions \<sigma> \<equiv> \<exists>regions. P_0x14181_true_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x142ed_28 :: state_pred where
  \<open>Q_0x142ed_28 \<sigma> \<equiv> RIP \<sigma> = 0x142ed \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x142ed_28_def[Qs]

schematic_goal copy_sectors_0_11_0x14181_0x142ea_28[blocks]:
  assumes \<open>(P_0x14181_true_28 && P_0x14181_true_28_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 11 0x142ea 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x142ed_28 ?\<sigma> \<and> block_usage P_0x14181_true_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14181_true_28_def P_0x14181_true_28_regions_def post: Q_0x142ed_28_def regionset: P_0x14181_true_28_regions_set_def)

definition P_0x142ed_29 :: state_pred where
  \<open>P_0x142ed_29 \<sigma> \<equiv> RIP \<sigma> = 0x142ed \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x142ed_29_def[Ps]

definition P_0x142ed_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142ed_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x142ed_29_regions :: state_pred where
  \<open>P_0x142ed_29_regions \<sigma> \<equiv> \<exists>regions. P_0x142ed_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memset_addr_0x142ed_29 :: state_pred where
  \<open>Q_memset_addr_0x142ed_29 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = memset_addr \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_memset_addr_0x142ed_29_def[Qs]

schematic_goal copy_sectors_0_1_0x142ed_0x142ed_29[blocks]:
  assumes \<open>(P_0x142ed_29 && P_0x142ed_29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x142ed 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memset_addr_0x142ed_29 ?\<sigma> \<and> block_usage P_0x142ed_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142ed_29_def P_0x142ed_29_regions_def post: Q_memset_addr_0x142ed_29_def regionset: P_0x142ed_29_regions_set_def)

definition P_0x142f2_30 :: state_pred where
  \<open>P_0x142f2_30 \<sigma> \<equiv> RIP \<sigma> = 0x142f2 \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x142f2_30_def[Ps]

definition P_0x142f2_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142f2_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x142f2_30_regions :: state_pred where
  \<open>P_0x142f2_30_regions \<sigma> \<equiv> \<exists>regions. P_0x142f2_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x142f5_30 :: state_pred where
  \<open>Q_0x142f5_30 \<sigma> \<equiv> RIP \<sigma> = 0x142f5 \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x142f5_30_def[Qs]

schematic_goal copy_sectors_0_1_0x142f2_0x142f2_30[blocks]:
  assumes \<open>(P_0x142f2_30 && P_0x142f2_30_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x142f2 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x142f5_30 ?\<sigma> \<and> block_usage P_0x142f2_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142f2_30_def P_0x142f2_30_regions_def post: Q_0x142f5_30_def regionset: P_0x142f2_30_regions_set_def)

definition P_0x142f5_31 :: state_pred where
  \<open>P_0x142f5_31 \<sigma> \<equiv> RIP \<sigma> = 0x142f5 \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x142f5_31_def[Ps]

definition P_0x142f5_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142f5_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x142f5_31_regions :: state_pred where
  \<open>P_0x142f5_31_regions \<sigma> \<equiv> \<exists>regions. P_0x142f5_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x142f7_31 :: state_pred where
  \<open>Q_0x142f7_31 \<sigma> \<equiv> RIP \<sigma> = 0x142f7 \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x142f7_31_def[Qs]

schematic_goal copy_sectors_0_1_0x142f5_0x142f5_31[blocks]:
  assumes \<open>(P_0x142f5_31 && P_0x142f5_31_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x142f5 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x142f7_31 ?\<sigma> \<and> block_usage P_0x142f5_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142f5_31_def P_0x142f5_31_regions_def post: Q_0x142f7_31_def regionset: P_0x142f5_31_regions_set_def)

definition P_0x142f7_true_32 :: state_pred where
  \<open>P_0x142f7_true_32 \<sigma> \<equiv> RIP \<sigma> = 0x142f7 \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x142f7_true_32_def[Ps]

definition P_0x142f7_true_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142f7_true_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x142f7_true_32_regions :: state_pred where
  \<open>P_0x142f7_true_32_regions \<sigma> \<equiv> \<exists>regions. P_0x142f7_true_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1419f_32 :: state_pred where
  \<open>Q_0x1419f_32 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x1419f_32_def[Qs]

schematic_goal copy_sectors_0_4_0x142f7_0x1419c_32[blocks]:
  assumes \<open>(P_0x142f7_true_32 && P_0x142f7_true_32_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 4 0x1419c 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1419f_32 ?\<sigma> \<and> block_usage P_0x142f7_true_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142f7_true_32_def P_0x142f7_true_32_regions_def post: Q_0x1419f_32_def regionset: P_0x142f7_true_32_regions_set_def)

definition P_0x1419f_33 :: state_pred where
  \<open>P_0x1419f_33 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x1419f_33_def[Ps]

definition P_0x1419f_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1419f_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x1419f_33_regions :: state_pred where
  \<open>P_0x1419f_33_regions \<sigma> \<equiv> \<exists>regions. P_0x1419f_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141ae_33 :: state_pred where
  \<open>Q_0x141ae_33 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141ae_33_def[Qs]

schematic_goal copy_sectors_0_5_0x1419f_0x141ab_33[blocks]:
  assumes \<open>(P_0x1419f_33 && P_0x1419f_33_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x141ab 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141ae_33 ?\<sigma> \<and> block_usage P_0x1419f_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1419f_33_def P_0x1419f_33_regions_def post: Q_0x141ae_33_def regionset: P_0x1419f_33_regions_set_def)

definition P_0x141ae_true_34 :: state_pred where
  \<open>P_0x141ae_true_34 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_true_34_def[Ps]

definition P_0x141ae_true_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_true_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_true_34_regions :: state_pred where
  \<open>P_0x141ae_true_34_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_true_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14240_34 :: state_pred where
  \<open>Q_0x14240_34 \<sigma> \<equiv> RIP \<sigma> = 0x14240 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14240_34_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_34[blocks]:
  assumes \<open>(P_0x141ae_true_34 && P_0x141ae_true_34_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14240_34 ?\<sigma> \<and> block_usage P_0x141ae_true_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_true_34_def P_0x141ae_true_34_regions_def post: Q_0x14240_34_def regionset: P_0x141ae_true_34_regions_set_def)

definition P_0x141ae_false_35 :: state_pred where
  \<open>P_0x141ae_false_35 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_false_35_def[Ps]

definition P_0x141ae_false_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_false_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_false_35_regions :: state_pred where
  \<open>P_0x141ae_false_35_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_false_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141b4_35 :: state_pred where
  \<open>Q_0x141b4_35 \<sigma> \<equiv> RIP \<sigma> = 0x141b4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141b4_35_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_35[blocks]:
  assumes \<open>(P_0x141ae_false_35 && P_0x141ae_false_35_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141b4_35 ?\<sigma> \<and> block_usage P_0x141ae_false_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_false_35_def P_0x141ae_false_35_regions_def post: Q_0x141b4_35_def regionset: P_0x141ae_false_35_regions_set_def)

definition P_0x142f7_false_36 :: state_pred where
  \<open>P_0x142f7_false_36 \<sigma> \<equiv> RIP \<sigma> = 0x142f7 \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((((((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word))::32 word) + (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RBX \<sigma>) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x142f7_false_36_def[Ps]

definition P_0x142f7_false_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142f7_false_36_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x142f7_false_36_regions :: state_pred where
  \<open>P_0x142f7_false_36_regions \<sigma> \<equiv> \<exists>regions. P_0x142f7_false_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1430a_36 :: state_pred where
  \<open>Q_0x1430a_36 \<sigma> \<equiv> RIP \<sigma> = 0x1430a \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x1430a_36_def[Qs]

schematic_goal copy_sectors_0_4_0x142f7_0x14307_36[blocks]:
  assumes \<open>(P_0x142f7_false_36 && P_0x142f7_false_36_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 4 0x14307 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1430a_36 ?\<sigma> \<and> block_usage P_0x142f7_false_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142f7_false_36_def P_0x142f7_false_36_regions_def post: Q_0x1430a_36_def regionset: P_0x142f7_false_36_regions_set_def)

definition P_0x1430a_37 :: state_pred where
  \<open>P_0x1430a_37 \<sigma> \<equiv> RIP \<sigma> = 0x1430a \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142f2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x1430a_37_def[Ps]

definition P_0x1430a_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1430a_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x1430a_37_regions :: state_pred where
  \<open>P_0x1430a_37_regions \<sigma> \<equiv> \<exists>regions. P_0x1430a_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x1430a_37 :: state_pred where
  \<open>Q_bdrv_read_addr_0x1430a_37 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = memset_0x142ed_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_bdrv_read_addr_0x1430a_37_def[Qs]

schematic_goal copy_sectors_0_1_0x1430a_0x1430a_37[blocks]:
  assumes \<open>(P_0x1430a_37 && P_0x1430a_37_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1430a 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x1430a_37 ?\<sigma> \<and> block_usage P_0x1430a_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1430a_37_def P_0x1430a_37_regions_def post: Q_bdrv_read_addr_0x1430a_37_def regionset: P_0x1430a_37_regions_set_def)

definition P_0x1430f_38 :: state_pred where
  \<open>P_0x1430f_38 \<sigma> \<equiv> RIP \<sigma> = 0x1430f \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x1430f_38_def[Ps]

definition P_0x1430f_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1430f_38_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x1430f_38_regions :: state_pred where
  \<open>P_0x1430f_38_regions \<sigma> \<equiv> \<exists>regions. P_0x1430f_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14311_38 :: state_pred where
  \<open>Q_0x14311_38 \<sigma> \<equiv> RIP \<sigma> = 0x14311 \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x14311_38_def[Qs]

schematic_goal copy_sectors_0_1_0x1430f_0x1430f_38[blocks]:
  assumes \<open>(P_0x1430f_38 && P_0x1430f_38_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1430f 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14311_38 ?\<sigma> \<and> block_usage P_0x1430f_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1430f_38_def P_0x1430f_38_regions_def post: Q_0x14311_38_def regionset: P_0x1430f_38_regions_set_def)

definition P_0x14311_true_39 :: state_pred where
  \<open>P_0x14311_true_39 \<sigma> \<equiv> RIP \<sigma> = 0x14311 \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x14311_true_39_def[Ps]

definition P_0x14311_true_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14311_true_39_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14311_true_39_regions :: state_pred where
  \<open>P_0x14311_true_39_regions \<sigma> \<equiv> \<exists>regions. P_0x14311_true_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1419f_39 :: state_pred where
  \<open>Q_0x1419f_39 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x1419f_39_def[Qs]

schematic_goal copy_sectors_0_4_0x14311_0x1419c_39[blocks]:
  assumes \<open>(P_0x14311_true_39 && P_0x14311_true_39_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1419c 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1419f_39 ?\<sigma> \<and> block_usage P_0x14311_true_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14311_true_39_def P_0x14311_true_39_regions_def post: Q_0x1419f_39_def regionset: P_0x14311_true_39_regions_set_def)

definition P_0x1419f_40 :: state_pred where
  \<open>P_0x1419f_40 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x1419f_40_def[Ps]

definition P_0x1419f_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1419f_40_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x1419f_40_regions :: state_pred where
  \<open>P_0x1419f_40_regions \<sigma> \<equiv> \<exists>regions. P_0x1419f_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141ae_40 :: state_pred where
  \<open>Q_0x141ae_40 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141ae_40_def[Qs]

schematic_goal copy_sectors_0_5_0x1419f_0x141ab_40[blocks]:
  assumes \<open>(P_0x1419f_40 && P_0x1419f_40_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x141ab 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141ae_40 ?\<sigma> \<and> block_usage P_0x1419f_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1419f_40_def P_0x1419f_40_regions_def post: Q_0x141ae_40_def regionset: P_0x1419f_40_regions_set_def)

definition P_0x141ae_true_41 :: state_pred where
  \<open>P_0x141ae_true_41 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_true_41_def[Ps]

definition P_0x141ae_true_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_true_41_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_true_41_regions :: state_pred where
  \<open>P_0x141ae_true_41_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_true_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14240_41 :: state_pred where
  \<open>Q_0x14240_41 \<sigma> \<equiv> RIP \<sigma> = 0x14240 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14240_41_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_41[blocks]:
  assumes \<open>(P_0x141ae_true_41 && P_0x141ae_true_41_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14240_41 ?\<sigma> \<and> block_usage P_0x141ae_true_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_true_41_def P_0x141ae_true_41_regions_def post: Q_0x14240_41_def regionset: P_0x141ae_true_41_regions_set_def)

definition P_0x141ae_false_42 :: state_pred where
  \<open>P_0x141ae_false_42 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_false_42_def[Ps]

definition P_0x141ae_false_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_false_42_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_false_42_regions :: state_pred where
  \<open>P_0x141ae_false_42_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_false_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141b4_42 :: state_pred where
  \<open>Q_0x141b4_42 \<sigma> \<equiv> RIP \<sigma> = 0x141b4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141b4_42_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_42[blocks]:
  assumes \<open>(P_0x141ae_false_42 && P_0x141ae_false_42_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141b4_42 ?\<sigma> \<and> block_usage P_0x141ae_false_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_false_42_def P_0x141ae_false_42_regions_def post: Q_0x141b4_42_def regionset: P_0x141ae_false_42_regions_set_def)

definition P_0x14311_false_43 :: state_pred where
  \<open>P_0x14311_false_43 \<sigma> \<equiv> RIP \<sigma> = 0x14311 \<and> RAX \<sigma> = bdrv_read_0x1430a_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)::32 word)::32 word) - (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1430f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x14311_false_43_def[Ps]

definition P_0x14311_false_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14311_false_43_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14311_false_43_regions :: state_pred where
  \<open>P_0x14311_false_43_regions \<sigma> \<equiv> \<exists>regions. P_0x14311_false_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14317_43 :: state_pred where
  \<open>Q_0x14317_43 \<sigma> \<equiv> RIP \<sigma> = 0x14317 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14317_43_def[Qs]

schematic_goal copy_sectors_0_1_0x14311_0x14311_43[blocks]:
  assumes \<open>(P_0x14311_false_43 && P_0x14311_false_43_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14311 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14317_43 ?\<sigma> \<and> block_usage P_0x14311_false_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14311_false_43_def P_0x14311_false_43_regions_def post: Q_0x14317_43_def regionset: P_0x14311_false_43_regions_set_def)

definition P_0x14181_false_44 :: state_pred where
  \<open>P_0x14181_false_44 \<sigma> \<equiv> RIP \<sigma> = 0x14181 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x14181_false_44_def[Ps]

definition P_0x14181_false_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14181_false_44_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14181_false_44_regions :: state_pred where
  \<open>P_0x14181_false_44_regions \<sigma> \<equiv> \<exists>regions. P_0x14181_false_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14190_44 :: state_pred where
  \<open>Q_0x14190_44 \<sigma> \<equiv> RIP \<sigma> = 0x14190 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x14190_44_def[Qs]

schematic_goal copy_sectors_0_4_0x14181_0x1418d_44[blocks]:
  assumes \<open>(P_0x14181_false_44 && P_0x14181_false_44_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 4 0x1418d 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14190_44 ?\<sigma> \<and> block_usage P_0x14181_false_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14181_false_44_def P_0x14181_false_44_regions_def post: Q_0x14190_44_def regionset: P_0x14181_false_44_regions_set_def)

definition P_0x14190_45 :: state_pred where
  \<open>P_0x14190_45 \<sigma> \<equiv> RIP \<sigma> = 0x14190 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x14190_45_def[Ps]

definition P_0x14190_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14190_45_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14190_45_regions :: state_pred where
  \<open>P_0x14190_45_regions \<sigma> \<equiv> \<exists>regions. P_0x14190_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memset_addr_0x14190_45 :: state_pred where
  \<open>Q_memset_addr_0x14190_45 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = memset_addr \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word)::64 word) + RBP \<sigma>) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14195 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_memset_addr_0x14190_45_def[Qs]

schematic_goal copy_sectors_0_1_0x14190_0x14190_45[blocks]:
  assumes \<open>(P_0x14190_45 && P_0x14190_45_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14190 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memset_addr_0x14190_45 ?\<sigma> \<and> block_usage P_0x14190_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14190_45_def P_0x14190_45_regions_def post: Q_memset_addr_0x14190_45_def regionset: P_0x14190_45_regions_set_def)

definition P_0x14195_46 :: state_pred where
  \<open>P_0x14195_46 \<sigma> \<equiv> RIP \<sigma> = 0x14195 \<and> RAX \<sigma> = memset_0x14190_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14195 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x14195_46_def[Ps]

definition P_0x14195_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14195_46_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x14195_46_regions :: state_pred where
  \<open>P_0x14195_46_regions \<sigma> \<equiv> \<exists>regions. P_0x14195_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1419f_46 :: state_pred where
  \<open>Q_0x1419f_46 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = memset_0x14190_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14195 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare Q_0x1419f_46_def[Qs]

schematic_goal copy_sectors_0_3_0x14195_0x1419c_46[blocks]:
  assumes \<open>(P_0x14195_46 && P_0x14195_46_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1419c 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1419f_46 ?\<sigma> \<and> block_usage P_0x14195_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14195_46_def P_0x14195_46_regions_def post: Q_0x1419f_46_def regionset: P_0x14195_46_regions_set_def)

definition P_0x1419f_47 :: state_pred where
  \<open>P_0x1419f_47 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = memset_0x14190_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14195 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word),8]::64 word)\<close>
declare P_0x1419f_47_def[Ps]

definition P_0x1419f_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1419f_47_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word), 8)
  }\<close>

definition P_0x1419f_47_regions :: state_pred where
  \<open>P_0x1419f_47_regions \<sigma> \<equiv> \<exists>regions. P_0x1419f_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141ae_47 :: state_pred where
  \<open>Q_0x141ae_47 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141ae_47_def[Qs]

schematic_goal copy_sectors_0_5_0x1419f_0x141ab_47[blocks]:
  assumes \<open>(P_0x1419f_47 && P_0x1419f_47_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x141ab 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141ae_47 ?\<sigma> \<and> block_usage P_0x1419f_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1419f_47_def P_0x1419f_47_regions_def post: Q_0x141ae_47_def regionset: P_0x1419f_47_regions_set_def)

definition P_0x141ae_true_48 :: state_pred where
  \<open>P_0x141ae_true_48 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_true_48_def[Ps]

definition P_0x141ae_true_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_true_48_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_true_48_regions :: state_pred where
  \<open>P_0x141ae_true_48_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_true_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14240_48 :: state_pred where
  \<open>Q_0x14240_48 \<sigma> \<equiv> RIP \<sigma> = 0x14240 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14240_48_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_48[blocks]:
  assumes \<open>(P_0x141ae_true_48 && P_0x141ae_true_48_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14240_48 ?\<sigma> \<and> block_usage P_0x141ae_true_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_true_48_def P_0x141ae_true_48_regions_def post: Q_0x14240_48_def regionset: P_0x141ae_true_48_regions_set_def)

definition P_0x141ae_false_49 :: state_pred where
  \<open>P_0x141ae_false_49 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_false_49_def[Ps]

definition P_0x141ae_false_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_false_49_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_false_49_regions :: state_pred where
  \<open>P_0x141ae_false_49_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_false_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141b4_49 :: state_pred where
  \<open>Q_0x141b4_49 \<sigma> \<equiv> RIP \<sigma> = 0x141b4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141b4_49_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_49[blocks]:
  assumes \<open>(P_0x141ae_false_49 && P_0x141ae_false_49_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141b4_49 ?\<sigma> \<and> block_usage P_0x141ae_false_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_false_49_def P_0x141ae_false_49_regions_def post: Q_0x141b4_49_def regionset: P_0x141ae_false_49_regions_set_def)

definition P_0x141d3_false_50 :: state_pred where
  \<open>P_0x141d3_false_50 \<sigma> \<equiv> RIP \<sigma> = 0x141d3 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RAX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare P_0x141d3_false_50_def[Ps]

definition P_0x141d3_false_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141d3_false_50_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x141d3_false_50_regions :: state_pred where
  \<open>P_0x141d3_false_50_regions \<sigma> \<equiv> \<exists>regions. P_0x141d3_false_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141f1_50 :: state_pred where
  \<open>Q_0x141f1_50 \<sigma> \<equiv> RIP \<sigma> = 0x141f1 \<and> RAX \<sigma> = 0x4000000000000000 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare Q_0x141f1_50_def[Qs]

schematic_goal copy_sectors_0_7_0x141d3_0x141ee_50[blocks]:
  assumes \<open>(P_0x141d3_false_50 && P_0x141d3_false_50_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x141ee 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141f1_50 ?\<sigma> \<and> block_usage P_0x141d3_false_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141d3_false_50_def P_0x141d3_false_50_regions_def post: Q_0x141f1_50_def regionset: P_0x141d3_false_50_regions_set_def)

definition P_0x141f1_true_51 :: state_pred where
  \<open>P_0x141f1_true_51 \<sigma> \<equiv> RIP \<sigma> = 0x141f1 \<and> RAX \<sigma> = 0x4000000000000000 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare P_0x141f1_true_51_def[Ps]

definition P_0x141f1_true_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141f1_true_51_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x141f1_true_51_regions :: state_pred where
  \<open>P_0x141f1_true_51_regions \<sigma> \<equiv> \<exists>regions. P_0x141f1_true_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14358_51 :: state_pred where
  \<open>Q_0x14358_51 \<sigma> \<equiv> RIP \<sigma> = 0x14358 \<and> RAX \<sigma> = 0x4000000000000000 \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x14358_51_def[Qs]

schematic_goal copy_sectors_0_8_0x141f1_0x14355_51[blocks]:
  assumes \<open>(P_0x141f1_true_51 && P_0x141f1_true_51_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x14355 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14358_51 ?\<sigma> \<and> block_usage P_0x141f1_true_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141f1_true_51_def P_0x141f1_true_51_regions_def post: Q_0x14358_51_def regionset: P_0x141f1_true_51_regions_set_def)

definition P_0x14358_52 :: state_pred where
  \<open>P_0x14358_52 \<sigma> \<equiv> RIP \<sigma> = 0x14358 \<and> RAX \<sigma> = 0x4000000000000000 \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x14358_52_def[Ps]

definition P_0x14358_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14358_52_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x14358_52_regions :: state_pred where
  \<open>P_0x14358_52_regions \<sigma> \<equiv> \<exists>regions. P_0x14358_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_pread_addr_0x14358_52 :: state_pred where
  \<open>Q_bdrv_pread_addr_0x14358_52 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = bdrv_pread_addr \<and> RAX \<sigma> = 0x4000000000000000 \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1435d \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_bdrv_pread_addr_0x14358_52_def[Qs]

schematic_goal copy_sectors_0_1_0x14358_0x14358_52[blocks]:
  assumes \<open>(P_0x14358_52 && P_0x14358_52_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14358 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_pread_addr_0x14358_52 ?\<sigma> \<and> block_usage P_0x14358_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14358_52_def P_0x14358_52_regions_def post: Q_bdrv_pread_addr_0x14358_52_def regionset: P_0x14358_52_regions_set_def)

definition P_0x1435d_53 :: state_pred where
  \<open>P_0x1435d_53 \<sigma> \<equiv> RIP \<sigma> = 0x1435d \<and> RAX \<sigma> = bdrv_pread_0x14358_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1435d \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x1435d_53_def[Ps]

definition P_0x1435d_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1435d_53_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x1435d_53_regions :: state_pred where
  \<open>P_0x1435d_53_regions \<sigma> \<equiv> \<exists>regions. P_0x1435d_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14369_53 :: state_pred where
  \<open>Q_0x14369_53 \<sigma> \<equiv> RIP \<sigma> = 0x14369 \<and> RAX \<sigma> = bdrv_pread_0x14358_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1435d \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x14369_53_def[Qs]

schematic_goal copy_sectors_0_4_0x1435d_0x14367_53[blocks]:
  assumes \<open>(P_0x1435d_53 && P_0x1435d_53_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x14367 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14369_53 ?\<sigma> \<and> block_usage P_0x1435d_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1435d_53_def P_0x1435d_53_regions_def post: Q_0x14369_53_def regionset: P_0x1435d_53_regions_set_def)

definition P_0x14369_true_54 :: state_pred where
  \<open>P_0x14369_true_54 \<sigma> \<equiv> RIP \<sigma> = 0x14369 \<and> RAX \<sigma> = bdrv_pread_0x14358_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1435d \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x14369_true_54_def[Ps]

definition P_0x14369_true_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14369_true_54_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x14369_true_54_regions :: state_pred where
  \<open>P_0x14369_true_54_regions \<sigma> \<equiv> \<exists>regions. P_0x14369_true_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14317_54 :: state_pred where
  \<open>Q_0x14317_54 \<sigma> \<equiv> RIP \<sigma> = 0x14317 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14317_54_def[Qs]

schematic_goal copy_sectors_0_1_0x14369_0x14369_54[blocks]:
  assumes \<open>(P_0x14369_true_54 && P_0x14369_true_54_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14369 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14317_54 ?\<sigma> \<and> block_usage P_0x14369_true_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14369_true_54_def P_0x14369_true_54_regions_def post: Q_0x14317_54_def regionset: P_0x14369_true_54_regions_set_def)

definition P_0x14369_false_55 :: state_pred where
  \<open>P_0x14369_false_55 \<sigma> \<equiv> RIP \<sigma> = 0x14369 \<and> RAX \<sigma> = bdrv_pread_0x14358_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1435d \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x14369_false_55_def[Ps]

definition P_0x14369_false_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14369_false_55_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x14369_false_55_regions :: state_pred where
  \<open>P_0x14369_false_55_regions \<sigma> \<equiv> \<exists>regions. P_0x14369_false_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14375_55 :: state_pred where
  \<open>Q_0x14375_55 \<sigma> \<equiv> RIP \<sigma> = 0x14375 \<and> RAX \<sigma> = bdrv_pread_0x14358_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1435d \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x14375_55_def[Qs]

schematic_goal copy_sectors_0_3_0x14369_0x14373_55[blocks]:
  assumes \<open>(P_0x14369_false_55 && P_0x14369_false_55_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x14373 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14375_55 ?\<sigma> \<and> block_usage P_0x14369_false_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14369_false_55_def P_0x14369_false_55_regions_def post: Q_0x14375_55_def regionset: P_0x14369_false_55_regions_set_def)

definition P_0x14375_true_56 :: state_pred where
  \<open>P_0x14375_true_56 \<sigma> \<equiv> RIP \<sigma> = 0x14375 \<and> RAX \<sigma> = bdrv_pread_0x14358_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1435d \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x14375_true_56_def[Ps]

definition P_0x14375_true_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14375_true_56_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x14375_true_56_regions :: state_pred where
  \<open>P_0x14375_true_56_regions \<sigma> \<equiv> \<exists>regions. P_0x14375_true_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1419f_56 :: state_pred where
  \<open>Q_0x1419f_56 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x1419f_56_def[Qs]

schematic_goal copy_sectors_0_1_0x14375_0x14375_56[blocks]:
  assumes \<open>(P_0x14375_true_56 && P_0x14375_true_56_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14375 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1419f_56 ?\<sigma> \<and> block_usage P_0x14375_true_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14375_true_56_def P_0x14375_true_56_regions_def post: Q_0x1419f_56_def regionset: P_0x14375_true_56_regions_set_def)

definition P_0x14375_false_57 :: state_pred where
  \<open>P_0x14375_false_57 \<sigma> \<equiv> RIP \<sigma> = 0x14375 \<and> RAX \<sigma> = bdrv_pread_0x14358_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1435d \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x14375_false_57_def[Ps]

definition P_0x14375_false_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14375_false_57_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x14375_false_57_regions :: state_pred where
  \<open>P_0x14375_false_57_regions \<sigma> \<equiv> \<exists>regions. P_0x14375_false_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1438f_57 :: state_pred where
  \<open>Q_0x1438f_57 \<sigma> \<equiv> RIP \<sigma> = 0x1438f \<and> RAX \<sigma> = bdrv_pread_0x14358_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x25c) \<and> R8 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1435d \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x1438f_57_def[Qs]

schematic_goal copy_sectors_0_6_0x14375_0x14387_57[blocks]:
  assumes \<open>(P_0x14375_false_57 && P_0x14375_false_57_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x14387 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1438f_57 ?\<sigma> \<and> block_usage P_0x14375_false_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14375_false_57_def P_0x14375_false_57_regions_def post: Q_0x1438f_57_def regionset: P_0x14375_false_57_regions_set_def)

definition P_0x1438f_58 :: state_pred where
  \<open>P_0x1438f_58 \<sigma> \<equiv> RIP \<sigma> = 0x1438f \<and> RAX \<sigma> = bdrv_pread_0x14358_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x25c) \<and> R8 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1435d \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x1438f_58_def[Ps]

definition P_0x1438f_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1438f_58_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x1438f_58_regions :: state_pred where
  \<open>P_0x1438f_58_regions \<sigma> \<equiv> \<exists>regions. P_0x1438f_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_encrypt_sectors_isra_12_addr_0x1438f_58 :: state_pred where
  \<open>Q_encrypt_sectors_isra_12_addr_0x1438f_58 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = encrypt_sectors_isra_12_addr \<and> RAX \<sigma> = bdrv_pread_0x14358_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x25c) \<and> R8 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14394 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_encrypt_sectors_isra_12_addr_0x1438f_58_def[Qs]

schematic_goal copy_sectors_0_1_0x1438f_0x1438f_58[blocks]:
  assumes \<open>(P_0x1438f_58 && P_0x1438f_58_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1438f 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_encrypt_sectors_isra_12_addr_0x1438f_58 ?\<sigma> \<and> block_usage P_0x1438f_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1438f_58_def P_0x1438f_58_regions_def post: Q_encrypt_sectors_isra_12_addr_0x1438f_58_def regionset: P_0x1438f_58_regions_set_def)

definition P_0x14394_59 :: state_pred where
  \<open>P_0x14394_59 \<sigma> \<equiv> RIP \<sigma> = 0x14394 \<and> RAX \<sigma> = encrypt_sectors_isra_12_0x1438f_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x25c) \<and> R8 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14394 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x14394_59_def[Ps]

definition P_0x14394_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14394_59_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x14394_59_regions :: state_pred where
  \<open>P_0x14394_59_regions \<sigma> \<equiv> \<exists>regions. P_0x14394_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14195_59 :: state_pred where
  \<open>Q_0x14195_59 \<sigma> \<equiv> RIP \<sigma> = 0x14195 \<and> RAX \<sigma> = encrypt_sectors_isra_12_0x1438f_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x25c) \<and> R8 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14394 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x14195_59_def[Qs]

schematic_goal copy_sectors_0_1_0x14394_0x14394_59[blocks]:
  assumes \<open>(P_0x14394_59 && P_0x14394_59_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14394 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14195_59 ?\<sigma> \<and> block_usage P_0x14394_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14394_59_def P_0x14394_59_regions_def post: Q_0x14195_59_def regionset: P_0x14394_59_regions_set_def)

definition P_0x14195_60 :: state_pred where
  \<open>P_0x14195_60 \<sigma> \<equiv> RIP \<sigma> = 0x14195 \<and> RAX \<sigma> = encrypt_sectors_isra_12_0x1438f_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x25c) \<and> R8 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x14394 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x14195_60_def[Ps]

definition P_0x14195_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14195_60_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x14195_60_regions :: state_pred where
  \<open>P_0x14195_60_regions \<sigma> \<equiv> \<exists>regions. P_0x14195_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1419f_60 :: state_pred where
  \<open>Q_0x1419f_60 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x1419f_60_def[Qs]

schematic_goal copy_sectors_0_3_0x14195_0x1419c_60[blocks]:
  assumes \<open>(P_0x14195_60 && P_0x14195_60_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1419c 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1419f_60 ?\<sigma> \<and> block_usage P_0x14195_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14195_60_def P_0x14195_60_regions_def post: Q_0x1419f_60_def regionset: P_0x14195_60_regions_set_def)

definition P_0x1419f_61 :: state_pred where
  \<open>P_0x1419f_61 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x1419f_61_def[Ps]

definition P_0x1419f_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1419f_61_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x1419f_61_regions :: state_pred where
  \<open>P_0x1419f_61_regions \<sigma> \<equiv> \<exists>regions. P_0x1419f_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141ae_61 :: state_pred where
  \<open>Q_0x141ae_61 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141ae_61_def[Qs]

schematic_goal copy_sectors_0_5_0x1419f_0x141ab_61[blocks]:
  assumes \<open>(P_0x1419f_61 && P_0x1419f_61_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x141ab 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141ae_61 ?\<sigma> \<and> block_usage P_0x1419f_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1419f_61_def P_0x1419f_61_regions_def post: Q_0x141ae_61_def regionset: P_0x1419f_61_regions_set_def)

definition P_0x141ae_true_62 :: state_pred where
  \<open>P_0x141ae_true_62 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_true_62_def[Ps]

definition P_0x141ae_true_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_true_62_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_true_62_regions :: state_pred where
  \<open>P_0x141ae_true_62_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_true_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14240_62 :: state_pred where
  \<open>Q_0x14240_62 \<sigma> \<equiv> RIP \<sigma> = 0x14240 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14240_62_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_62[blocks]:
  assumes \<open>(P_0x141ae_true_62 && P_0x141ae_true_62_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14240_62 ?\<sigma> \<and> block_usage P_0x141ae_true_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_true_62_def P_0x141ae_true_62_regions_def post: Q_0x14240_62_def regionset: P_0x141ae_true_62_regions_set_def)

definition P_0x141ae_false_63 :: state_pred where
  \<open>P_0x141ae_false_63 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_false_63_def[Ps]

definition P_0x141ae_false_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_false_63_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_false_63_regions :: state_pred where
  \<open>P_0x141ae_false_63_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_false_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141b4_63 :: state_pred where
  \<open>Q_0x141b4_63 \<sigma> \<equiv> RIP \<sigma> = 0x141b4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141b4_63_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_63[blocks]:
  assumes \<open>(P_0x141ae_false_63 && P_0x141ae_false_63_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141b4_63 ?\<sigma> \<and> block_usage P_0x141ae_false_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_false_63_def P_0x141ae_false_63_regions_def post: Q_0x141b4_63_def regionset: P_0x141ae_false_63_regions_set_def)

definition P_0x141f1_false_64 :: state_pred where
  \<open>P_0x141f1_false_64 \<sigma> \<equiv> RIP \<sigma> = 0x141f1 \<and> RAX \<sigma> = 0x4000000000000000 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare P_0x141f1_false_64_def[Ps]

definition P_0x141f1_false_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141f1_false_64_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x141f1_false_64_regions :: state_pred where
  \<open>P_0x141f1_false_64_regions \<sigma> \<equiv> \<exists>regions. P_0x141f1_false_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141fa_64 :: state_pred where
  \<open>Q_0x141fa_64 \<sigma> \<equiv> RIP \<sigma> = 0x141fa \<and> RAX \<sigma> = 0x4000000000000000 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare Q_0x141fa_64_def[Qs]

schematic_goal copy_sectors_0_2_0x141f1_0x141f7_64[blocks]:
  assumes \<open>(P_0x141f1_false_64 && P_0x141f1_false_64_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x141f7 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141fa_64 ?\<sigma> \<and> block_usage P_0x141f1_false_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141f1_false_64_def P_0x141f1_false_64_regions_def post: Q_0x141fa_64_def regionset: P_0x141f1_false_64_regions_set_def)

definition P_0x141fa_65 :: state_pred where
  \<open>P_0x141fa_65 \<sigma> \<equiv> RIP \<sigma> = 0x141fa \<and> RAX \<sigma> = 0x4000000000000000 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141cd\<close>
declare P_0x141fa_65_def[Ps]

definition P_0x141fa_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141fa_65_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x141fa_65_regions :: state_pred where
  \<open>P_0x141fa_65_regions \<sigma> \<equiv> \<exists>regions. P_0x141fa_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_decompress_cluster_addr_0x141fa_65 :: state_pred where
  \<open>Q_decompress_cluster_addr_0x141fa_65 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = decompress_cluster_addr \<and> RAX \<sigma> = 0x4000000000000000 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141ff\<close>
declare Q_decompress_cluster_addr_0x141fa_65_def[Qs]

schematic_goal copy_sectors_0_1_0x141fa_0x141fa_65[blocks]:
  assumes \<open>(P_0x141fa_65 && P_0x141fa_65_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141fa 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_decompress_cluster_addr_0x141fa_65 ?\<sigma> \<and> block_usage P_0x141fa_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141fa_65_def P_0x141fa_65_regions_def post: Q_decompress_cluster_addr_0x141fa_65_def regionset: P_0x141fa_65_regions_set_def)

definition P_0x141ff_66 :: state_pred where
  \<open>P_0x141ff_66 \<sigma> \<equiv> RIP \<sigma> = 0x141ff \<and> RAX \<sigma> = decompress_cluster_0x141fa_retval \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141ff\<close>
declare P_0x141ff_66_def[Ps]

definition P_0x141ff_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ff_66_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x141ff_66_regions :: state_pred where
  \<open>P_0x141ff_66_regions \<sigma> \<equiv> \<exists>regions. P_0x141ff_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14201_66 :: state_pred where
  \<open>Q_0x14201_66 \<sigma> \<equiv> RIP \<sigma> = 0x14201 \<and> RAX \<sigma> = decompress_cluster_0x141fa_retval \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141ff\<close>
declare Q_0x14201_66_def[Qs]

schematic_goal copy_sectors_0_1_0x141ff_0x141ff_66[blocks]:
  assumes \<open>(P_0x141ff_66 && P_0x141ff_66_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ff 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14201_66 ?\<sigma> \<and> block_usage P_0x141ff_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ff_66_def P_0x141ff_66_regions_def post: Q_0x14201_66_def regionset: P_0x141ff_66_regions_set_def)

definition P_0x14201_true_67 :: state_pred where
  \<open>P_0x14201_true_67 \<sigma> \<equiv> RIP \<sigma> = 0x14201 \<and> RAX \<sigma> = decompress_cluster_0x141fa_retval \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141ff\<close>
declare P_0x14201_true_67_def[Ps]

definition P_0x14201_true_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14201_true_67_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x14201_true_67_regions :: state_pred where
  \<open>P_0x14201_true_67_regions \<sigma> \<equiv> \<exists>regions. P_0x14201_true_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14317_67 :: state_pred where
  \<open>Q_0x14317_67 \<sigma> \<equiv> RIP \<sigma> = 0x14317 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14317_67_def[Qs]

schematic_goal copy_sectors_0_1_0x14201_0x14201_67[blocks]:
  assumes \<open>(P_0x14201_true_67 && P_0x14201_true_67_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14201 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14317_67 ?\<sigma> \<and> block_usage P_0x14201_true_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14201_true_67_def P_0x14201_true_67_regions_def post: Q_0x14317_67_def regionset: P_0x14201_true_67_regions_set_def)

definition P_0x14201_false_68 :: state_pred where
  \<open>P_0x14201_false_68 \<sigma> \<equiv> RIP \<sigma> = 0x14201 \<and> RAX \<sigma> = decompress_cluster_0x141fa_retval \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x44) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141ff\<close>
declare P_0x14201_false_68_def[Ps]

definition P_0x14201_false_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14201_false_68_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x14201_false_68_regions :: state_pred where
  \<open>P_0x14201_false_68_regions \<sigma> \<equiv> \<exists>regions. P_0x14201_false_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14226_68 :: state_pred where
  \<open>Q_0x14226_68 \<sigma> \<equiv> RIP \<sigma> = 0x14226 \<and> RAX \<sigma> = decompress_cluster_0x141fa_retval \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141ff\<close>
declare Q_0x14226_68_def[Qs]

schematic_goal copy_sectors_0_9_0x14201_0x14223_68[blocks]:
  assumes \<open>(P_0x14201_false_68 && P_0x14201_false_68_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 9 0x14223 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14226_68 ?\<sigma> \<and> block_usage P_0x14201_false_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14201_false_68_def P_0x14201_false_68_regions_def post: Q_0x14226_68_def regionset: P_0x14201_false_68_regions_set_def)

definition P_0x14226_69 :: state_pred where
  \<open>P_0x14226_69 \<sigma> \<equiv> RIP \<sigma> = 0x14226 \<and> RAX \<sigma> = decompress_cluster_0x141fa_retval \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x141ff\<close>
declare P_0x14226_69_def[Ps]

definition P_0x14226_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14226_69_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x14226_69_regions :: state_pred where
  \<open>P_0x14226_69_regions \<sigma> \<equiv> \<exists>regions. P_0x14226_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x14226_69 :: state_pred where
  \<open>Q_memcpy_addr_0x14226_69 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = decompress_cluster_0x141fa_retval \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1422b\<close>
declare Q_memcpy_addr_0x14226_69_def[Qs]

schematic_goal copy_sectors_0_1_0x14226_0x14226_69[blocks]:
  assumes \<open>(P_0x14226_69 && P_0x14226_69_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14226 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x14226_69 ?\<sigma> \<and> block_usage P_0x14226_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14226_69_def P_0x14226_69_regions_def post: Q_memcpy_addr_0x14226_69_def regionset: P_0x14226_69_regions_set_def)

definition P_0x1422b_70 :: state_pred where
  \<open>P_0x1422b_70 \<sigma> \<equiv> RIP \<sigma> = 0x1422b \<and> RAX \<sigma> = memcpy_0x14226_retval \<and> RDX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1422b\<close>
declare P_0x1422b_70_def[Ps]

definition P_0x1422b_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1422b_70_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1422b_70_regions :: state_pred where
  \<open>P_0x1422b_70_regions \<sigma> \<equiv> \<exists>regions. P_0x1422b_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1419f_70 :: state_pred where
  \<open>Q_0x1419f_70 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = memcpy_0x14226_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1422b\<close>
declare Q_0x1419f_70_def[Qs]

schematic_goal copy_sectors_0_4_0x1422b_0x14235_70[blocks]:
  assumes \<open>(P_0x1422b_70 && P_0x1422b_70_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x14235 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1419f_70 ?\<sigma> \<and> block_usage P_0x1422b_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1422b_70_def P_0x1422b_70_regions_def post: Q_0x1419f_70_def regionset: P_0x1422b_70_regions_set_def)

definition P_0x1419f_71 :: state_pred where
  \<open>P_0x1419f_71 \<sigma> \<equiv> RIP \<sigma> = 0x1419f \<and> RAX \<sigma> = memcpy_0x14226_retval \<and> RCX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word))) 32 64::64 word) \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>R14 \<sigma>::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RBP \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1422b\<close>
declare P_0x1419f_71_def[Ps]

definition P_0x1419f_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1419f_71_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x110), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1419f_71_regions :: state_pred where
  \<open>P_0x1419f_71_regions \<sigma> \<equiv> \<exists>regions. P_0x1419f_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141ae_71 :: state_pred where
  \<open>Q_0x141ae_71 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141ae_71_def[Qs]

schematic_goal copy_sectors_0_5_0x1419f_0x141ab_71[blocks]:
  assumes \<open>(P_0x1419f_71 && P_0x1419f_71_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x141ab 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141ae_71 ?\<sigma> \<and> block_usage P_0x1419f_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1419f_71_def P_0x1419f_71_regions_def post: Q_0x141ae_71_def regionset: P_0x1419f_71_regions_set_def)

definition P_0x141ae_true_72 :: state_pred where
  \<open>P_0x141ae_true_72 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_true_72_def[Ps]

definition P_0x141ae_true_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_true_72_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_true_72_regions :: state_pred where
  \<open>P_0x141ae_true_72_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_true_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14240_72 :: state_pred where
  \<open>Q_0x14240_72 \<sigma> \<equiv> RIP \<sigma> = 0x14240 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14240_72_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_72[blocks]:
  assumes \<open>(P_0x141ae_true_72 && P_0x141ae_true_72_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14240_72 ?\<sigma> \<and> block_usage P_0x141ae_true_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_true_72_def P_0x141ae_true_72_regions_def post: Q_0x14240_72_def regionset: P_0x141ae_true_72_regions_set_def)

definition P_0x141ae_false_73 :: state_pred where
  \<open>P_0x141ae_false_73 \<sigma> \<equiv> RIP \<sigma> = 0x141ae \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x141ae_false_73_def[Ps]

definition P_0x141ae_false_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x141ae_false_73_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x141ae_false_73_regions :: state_pred where
  \<open>P_0x141ae_false_73_regions \<sigma> \<equiv> \<exists>regions. P_0x141ae_false_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x141b4_73 :: state_pred where
  \<open>Q_0x141b4_73 \<sigma> \<equiv> RIP \<sigma> = 0x141b4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x141b4_73_def[Qs]

schematic_goal copy_sectors_0_1_0x141ae_0x141ae_73[blocks]:
  assumes \<open>(P_0x141ae_false_73 && P_0x141ae_false_73_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x141ae 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x141b4_73 ?\<sigma> \<and> block_usage P_0x141ae_false_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x141ae_false_73_def P_0x141ae_false_73_regions_def post: Q_0x141b4_73_def regionset: P_0x141ae_false_73_regions_set_def)

definition P_0x14317_74 :: state_pred where
  \<open>P_0x14317_74 \<sigma> \<equiv> RIP \<sigma> = 0x14317 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x14317_74_def[Ps]

definition P_0x14317_74_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14317_74_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x14317_74_regions :: state_pred where
  \<open>P_0x14317_74_regions \<sigma> \<equiv> \<exists>regions. P_0x14317_74_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x142ac_74 :: state_pred where
  \<open>Q_0x142ac_74 \<sigma> \<equiv> RIP \<sigma> = 0x142ac \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare Q_0x142ac_74_def[Qs]

schematic_goal copy_sectors_0_2_0x14317_0x1431c_74[blocks]:
  assumes \<open>(P_0x14317_74 && P_0x14317_74_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1431c 74 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x142ac_74 ?\<sigma> \<and> block_usage P_0x14317_74_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14317_74_def P_0x14317_74_regions_def post: Q_0x142ac_74_def regionset: P_0x14317_74_regions_set_def)

definition P_0x14240_75 :: state_pred where
  \<open>P_0x14240_75 \<sigma> \<equiv> RIP \<sigma> = 0x14240 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x14240_75_def[Ps]

definition P_0x14240_75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14240_75_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x14240_75_regions :: state_pred where
  \<open>P_0x14240_75_regions \<sigma> \<equiv> \<exists>regions. P_0x14240_75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14257_75 :: state_pred where
  \<open>Q_0x14257_75 \<sigma> \<equiv> RIP \<sigma> = 0x14257 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14257_75_def[Qs]

schematic_goal copy_sectors_0_4_0x14240_0x14255_75[blocks]:
  assumes \<open>(P_0x14240_75 && P_0x14240_75_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x14255 75 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14257_75 ?\<sigma> \<and> block_usage P_0x14240_75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14240_75_def P_0x14240_75_regions_def post: Q_0x14257_75_def regionset: P_0x14240_75_regions_set_def)

definition P_0x14257_true_76 :: state_pred where
  \<open>P_0x14257_true_76 \<sigma> \<equiv> RIP \<sigma> = 0x14257 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x14257_true_76_def[Ps]

definition P_0x14257_true_76_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14257_true_76_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x14257_true_76_regions :: state_pred where
  \<open>P_0x14257_true_76_regions \<sigma> \<equiv> \<exists>regions. P_0x14257_true_76_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14282_76 :: state_pred where
  \<open>Q_0x14282_76 \<sigma> \<equiv> RIP \<sigma> = 0x14282 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14282_76_def[Qs]

schematic_goal copy_sectors_0_1_0x14257_0x14257_76[blocks]:
  assumes \<open>(P_0x14257_true_76 && P_0x14257_true_76_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14257 76 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14282_76 ?\<sigma> \<and> block_usage P_0x14257_true_76_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14257_true_76_def P_0x14257_true_76_regions_def post: Q_0x14282_76_def regionset: P_0x14257_true_76_regions_set_def)

definition P_0x14257_false_77 :: state_pred where
  \<open>P_0x14257_false_77 \<sigma> \<equiv> RIP \<sigma> = 0x14257 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x14257_false_77_def[Ps]

definition P_0x14257_false_77_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14257_false_77_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x14257_false_77_regions :: state_pred where
  \<open>P_0x14257_false_77_regions \<sigma> \<equiv> \<exists>regions. P_0x14257_false_77_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14275_77 :: state_pred where
  \<open>Q_0x14275_77 \<sigma> \<equiv> RIP \<sigma> = 0x14275 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> R8 \<sigma> = 0x1 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14275_77_def[Qs]

schematic_goal copy_sectors_0_7_0x14257_0x1426f_77[blocks]:
  assumes \<open>(P_0x14257_false_77 && P_0x14257_false_77_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x1426f 77 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14275_77 ?\<sigma> \<and> block_usage P_0x14257_false_77_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14257_false_77_def P_0x14257_false_77_regions_def post: Q_0x14275_77_def regionset: P_0x14257_false_77_regions_set_def)

definition P_0x14275_78 :: state_pred where
  \<open>P_0x14275_78 \<sigma> \<equiv> RIP \<sigma> = 0x14275 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> R8 \<sigma> = 0x1 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x14275_78_def[Ps]

definition P_0x14275_78_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14275_78_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x14275_78_regions :: state_pred where
  \<open>P_0x14275_78_regions \<sigma> \<equiv> \<exists>regions. P_0x14275_78_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_encrypt_sectors_isra_12_addr_0x14275_78 :: state_pred where
  \<open>Q_encrypt_sectors_isra_12_addr_0x14275_78 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = encrypt_sectors_isra_12_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> R8 \<sigma> = 0x1 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1427a\<close>
declare Q_encrypt_sectors_isra_12_addr_0x14275_78_def[Qs]

schematic_goal copy_sectors_0_1_0x14275_0x14275_78[blocks]:
  assumes \<open>(P_0x14275_78 && P_0x14275_78_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14275 78 \<sigma> \<triangleq> ?\<sigma> \<and> Q_encrypt_sectors_isra_12_addr_0x14275_78 ?\<sigma> \<and> block_usage P_0x14275_78_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14275_78_def P_0x14275_78_regions_def post: Q_encrypt_sectors_isra_12_addr_0x14275_78_def regionset: P_0x14275_78_regions_set_def)

definition P_0x1427a_79 :: state_pred where
  \<open>P_0x1427a_79 \<sigma> \<equiv> RIP \<sigma> = 0x1427a \<and> RAX \<sigma> = encrypt_sectors_isra_12_0x14275_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> R8 \<sigma> = 0x1 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1427a\<close>
declare P_0x1427a_79_def[Ps]

definition P_0x1427a_79_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1427a_79_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1427a_79_regions :: state_pred where
  \<open>P_0x1427a_79_regions \<sigma> \<equiv> \<exists>regions. P_0x1427a_79_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14282_79 :: state_pred where
  \<open>Q_0x14282_79 \<sigma> \<equiv> RIP \<sigma> = 0x14282 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare Q_0x14282_79_def[Qs]

schematic_goal copy_sectors_0_1_0x1427a_0x1427a_79[blocks]:
  assumes \<open>(P_0x1427a_79 && P_0x1427a_79_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1427a 79 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14282_79 ?\<sigma> \<and> block_usage P_0x1427a_79_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1427a_79_def P_0x1427a_79_regions_def post: Q_0x14282_79_def regionset: P_0x1427a_79_regions_set_def)

definition P_0x14282_80 :: state_pred where
  \<open>P_0x14282_80 \<sigma> \<equiv> RIP \<sigma> = 0x14282 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44)\<close>
declare P_0x14282_80_def[Ps]

definition P_0x14282_80_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14282_80_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x14282_80_regions :: state_pred where
  \<open>P_0x14282_80_regions \<sigma> \<equiv> \<exists>regions. P_0x14282_80_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1429d_80 :: state_pred where
  \<open>Q_0x1429d_80 \<sigma> \<equiv> RIP \<sigma> = 0x1429d \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) + (RDX\<^sub>0 >> 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x1429d_80_def[Qs]

schematic_goal copy_sectors_0_7_0x14282_0x1429a_80[blocks]:
  assumes \<open>(P_0x14282_80 && P_0x14282_80_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1429a 80 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1429d_80 ?\<sigma> \<and> block_usage P_0x14282_80_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14282_80_def P_0x14282_80_regions_def post: Q_0x1429d_80_def regionset: P_0x14282_80_regions_set_def)

definition P_0x1429d_81 :: state_pred where
  \<open>P_0x1429d_81 \<sigma> \<equiv> RIP \<sigma> = 0x1429d \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) + (RDX\<^sub>0 >> 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x1429d_81_def[Ps]

definition P_0x1429d_81_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1429d_81_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (18, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x1429d_81_regions :: state_pred where
  \<open>P_0x1429d_81_regions \<sigma> \<equiv> \<exists>regions. P_0x1429d_81_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_write_addr_0x1429d_81 :: state_pred where
  \<open>Q_bdrv_write_addr_0x1429d_81 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = bdrv_write_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) + (RDX\<^sub>0 >> 9)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142a2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_bdrv_write_addr_0x1429d_81_def[Qs]

schematic_goal copy_sectors_0_1_0x1429d_0x1429d_81[blocks]:
  assumes \<open>(P_0x1429d_81 && P_0x1429d_81_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1429d 81 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_write_addr_0x1429d_81 ?\<sigma> \<and> block_usage P_0x1429d_81_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1429d_81_def P_0x1429d_81_regions_def post: Q_bdrv_write_addr_0x1429d_81_def regionset: P_0x1429d_81_regions_set_def)

definition P_0x142a2_82 :: state_pred where
  \<open>P_0x142a2_82 \<sigma> \<equiv> RIP \<sigma> = 0x142a2 \<and> RAX \<sigma> = bdrv_write_0x1429d_retval \<and> RCX \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) + (RDX\<^sub>0 >> 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((RSI\<^sub>0::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((((\<langle>31,0\<rangle>R8\<^sub>0::32 word)::32 word) - (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x44) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x142a2 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x142a2_82_def[Ps]

definition P_0x142a2_82_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142a2_82_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (18, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x142a2_82_regions :: state_pred where
  \<open>P_0x142a2_82_regions \<sigma> \<equiv> \<exists>regions. P_0x142a2_82_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x142ac_82 :: state_pred where
  \<open>Q_0x142ac_82 \<sigma> \<equiv> RIP \<sigma> = 0x142ac \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare Q_0x142ac_82_def[Qs]

schematic_goal copy_sectors_0_3_0x142a2_0x142a9_82[blocks]:
  assumes \<open>(P_0x142a2_82 && P_0x142a2_82_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x142a9 82 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x142ac_82 ?\<sigma> \<and> block_usage P_0x142a2_82_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142a2_82_def P_0x142a2_82_regions_def post: Q_0x142ac_82_def regionset: P_0x142a2_82_regions_set_def)

definition P_0x142ac_83 :: state_pred where
  \<open>P_0x142ac_83 \<sigma> \<equiv> RIP \<sigma> = 0x142ac \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare P_0x142ac_83_def[Ps]

definition P_0x142ac_83_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142ac_83_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x142ac_83_regions :: state_pred where
  \<open>P_0x142ac_83_regions \<sigma> \<equiv> \<exists>regions. P_0x142ac_83_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x142ba_83 :: state_pred where
  \<open>Q_0x142ba_83 \<sigma> \<equiv> RIP \<sigma> = 0x142ba \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare Q_0x142ba_83_def[Qs]

schematic_goal copy_sectors_0_2_0x142ac_0x142b1_83[blocks]:
  assumes \<open>(P_0x142ac_83 && P_0x142ac_83_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x142b1 83 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x142ba_83 ?\<sigma> \<and> block_usage P_0x142ac_83_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142ac_83_def P_0x142ac_83_regions_def post: Q_0x142ba_83_def regionset: P_0x142ac_83_regions_set_def)

definition P_0x142ba_true_84 :: state_pred where
  \<open>P_0x142ba_true_84 \<sigma> \<equiv> RIP \<sigma> = 0x142ba \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare P_0x142ba_true_84_def[Ps]

definition P_0x142ba_true_84_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142ba_true_84_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x142ba_true_84_regions :: state_pred where
  \<open>P_0x142ba_true_84_regions \<sigma> \<equiv> \<exists>regions. P_0x142ba_true_84_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14399_84 :: state_pred where
  \<open>Q_0x14399_84 \<sigma> \<equiv> RIP \<sigma> = 0x14399 \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare Q_0x14399_84_def[Qs]

schematic_goal copy_sectors_0_1_0x142ba_0x142ba_84[blocks]:
  assumes \<open>(P_0x142ba_true_84 && P_0x142ba_true_84_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x142ba 84 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14399_84 ?\<sigma> \<and> block_usage P_0x142ba_true_84_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142ba_true_84_def P_0x142ba_true_84_regions_def post: Q_0x14399_84_def regionset: P_0x142ba_true_84_regions_set_def)

definition P_0x14399_85 :: state_pred where
  \<open>P_0x14399_85 \<sigma> \<equiv> RIP \<sigma> = 0x14399 \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare P_0x14399_85_def[Ps]

definition P_0x14399_85_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14399_85_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x14399_85_regions :: state_pred where
  \<open>P_0x14399_85_regions \<sigma> \<equiv> \<exists>regions. P_0x14399_85_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x14399_85 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x14399_85 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare Q_stack_chk_fail_addr_0x14399_85_def[Qs]

schematic_goal copy_sectors_0_1_0x14399_0x14399_85[blocks]:
  assumes \<open>(P_0x14399_85 && P_0x14399_85_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14399 85 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x14399_85 ?\<sigma> \<and> block_usage P_0x14399_85_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14399_85_def P_0x14399_85_regions_def post: Q_stack_chk_fail_addr_0x14399_85_def regionset: P_0x14399_85_regions_set_def)

definition P_0x142ba_false_86 :: state_pred where
  \<open>P_0x142ba_false_86 \<sigma> \<equiv> RIP \<sigma> = 0x142ba \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare P_0x142ba_false_86_def[Ps]

definition P_0x142ba_false_86_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x142ba_false_86_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x142ba_false_86_regions :: state_pred where
  \<open>P_0x142ba_false_86_regions \<sigma> \<equiv> \<exists>regions. P_0x142ba_false_86_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_86 :: state_pred where
  \<open>Q_ret_address_86 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDX\<^sub>0\<close>
declare Q_ret_address_86_def[Qs]

schematic_goal copy_sectors_0_9_0x142ba_0x142ce_86[blocks]:
  assumes \<open>(P_0x142ba_false_86 && P_0x142ba_false_86_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x142ce 86 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_86 ?\<sigma> \<and> block_usage P_0x142ba_false_86_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x142ba_false_86_def P_0x142ba_false_86_regions_def post: Q_ret_address_86_def regionset: P_0x142ba_false_86_regions_set_def)

definition copy_sectors_acode :: ACode where
  \<open>copy_sectors_acode =
    Block 13 0x14116 0;
    IF jle THEN
      Block (Suc 0) 0x14119 (Suc 0)
    ELSE
      Block 14 0x14153 2;
      WHILE P_0x141b4_3 DO
        Block 5 0x141c4 3;
        Block (Suc 0) 0x141c8 4;
        CALL get_cluster_offset_acode;
        Block 2 0x141d0 5;
        IF ZF THEN
          Block 4 0x14163 6;
          IF ZF THEN
            Block 5 0x14328 7;
            Block (Suc 0) 0x1432b 8;
            CALL memset_acode;
            Block 4 0x1433a 9;
            Block 5 0x141ab 10;
            IF jle THEN
              Block (Suc 0) 0x141ae 11
            ELSE
              Block (Suc 0) 0x141ae 12
            FI
          ELSE
            Block 5 0x14175 13;
            IF jge THEN
              Block 2 0x142f5 14;
              IF jle THEN
                Block 4 0x1419c 15;
                Block 5 0x141ab 16;
                IF jle THEN
                  Block (Suc 0) 0x141ae 17
                ELSE
                  Block (Suc 0) 0x141ae 18
                FI
              ELSE
                Block 4 0x14307 19;
                Block (Suc 0) 0x1430a 20;
                CALL bdrv_read_acode;
                Block (Suc 0) 0x1430f 21;
                IF !SF THEN
                  Block 4 0x1419c 22;
                  Block 5 0x141ab 23;
                  IF jle THEN
                    Block (Suc 0) 0x141ae 24
                  ELSE
                    Block (Suc 0) 0x141ae 25
                  FI
                ELSE
                  Block (Suc 0) 0x14311 26
                FI
              FI
            ELSE
              Block 2 0x1417e 27;
              IF jg THEN
                Block 11 0x142ea 28;
                Block (Suc 0) 0x142ed 29;
                CALL memset_acode;
                Block (Suc 0) 0x142f2 30;
                Block (Suc 0) 0x142f5 31;
                IF jle THEN
                  Block 4 0x1419c 32;
                  Block 5 0x141ab 33;
                  IF jle THEN
                    Block (Suc 0) 0x141ae 34
                  ELSE
                    Block (Suc 0) 0x141ae 35
                  FI
                ELSE
                  Block 4 0x14307 36;
                  Block (Suc 0) 0x1430a 37;
                  CALL bdrv_read_acode;
                  Block (Suc 0) 0x1430f 38;
                  IF !SF THEN
                    Block 4 0x1419c 39;
                    Block 5 0x141ab 40;
                    IF jle THEN
                      Block (Suc 0) 0x141ae 41
                    ELSE
                      Block (Suc 0) 0x141ae 42
                    FI
                  ELSE
                    Block (Suc 0) 0x14311 43
                  FI
                FI
              ELSE
                Block 4 0x1418d 44;
                Block (Suc 0) 0x14190 45;
                CALL memset_acode;
                Block 3 0x1419c 46;
                Block 5 0x141ab 47;
                IF jle THEN
                  Block (Suc 0) 0x141ae 48
                ELSE
                  Block (Suc 0) 0x141ae 49
                FI
              FI
            FI
          FI
        ELSE
          Block 7 0x141ee 50;
          IF ZF THEN
            Block 8 0x14355 51;
            Block (Suc 0) 0x14358 52;
            CALL bdrv_pread_acode;
            Block 4 0x14367 53;
            IF !ZF THEN
              Block (Suc 0) 0x14369 54
            ELSE
              Block 3 0x14373 55;
              IF ZF THEN
                Block (Suc 0) 0x14375 56
              ELSE
                Block 6 0x14387 57;
                Block (Suc 0) 0x1438f 58;
                CALL encrypt_sectors_isra_12_acode;
                Block (Suc 0) 0x14394 59;
                Block 3 0x1419c 60
              FI;
              Block 5 0x141ab 61;
              IF jle THEN
                Block (Suc 0) 0x141ae 62
              ELSE
                Block (Suc 0) 0x141ae 63
              FI
            FI
          ELSE
            Block 2 0x141f7 64;
            Block (Suc 0) 0x141fa 65;
            CALL decompress_cluster_acode;
            Block (Suc 0) 0x141ff 66;
            IF SF THEN
              Block (Suc 0) 0x14201 67
            ELSE
              Block 9 0x14223 68;
              Block (Suc 0) 0x14226 69;
              CALL memcpy_acode;
              Block 4 0x14235 70;
              Block 5 0x141ab 71;
              IF jle THEN
                Block (Suc 0) 0x141ae 72
              ELSE
                Block (Suc 0) 0x141ae 73
              FI
            FI
          FI
        FI
      OD;
      CASES [
        (P_0x14317_74,
          Block 2 0x1431c 74
        ),
        (P_0x14240_75,
          Block 4 0x14255 75;
          IF ZF THEN
            Block (Suc 0) 0x14257 76
          ELSE
            Block 7 0x1426f 77;
            Block (Suc 0) 0x14275 78;
            CALL encrypt_sectors_isra_12_acode;
            Block (Suc 0) 0x1427a 79
          FI;
          Block 7 0x1429a 80;
          Block (Suc 0) 0x1429d 81;
          CALL bdrv_write_acode;
          Block 3 0x142a9 82
        )
      ]
    FI;
    Block 2 0x142b1 83;
    IF !ZF THEN
      Block (Suc 0) 0x142ba 84;
      Block (Suc 0) 0x14399 85;
      CALL stack_chk_fail_acode
    ELSE
      Block 9 0x142ce 86
    FI
  \<close>

schematic_goal "copy_sectors":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14119 \<longrightarrow> P_0x14119_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14119 \<longrightarrow> P_0x14119_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141b4 \<longrightarrow> P_0x141b4_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141c8 \<longrightarrow> P_0x141c8_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141cd \<longrightarrow> P_0x141cd_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141d3 \<longrightarrow> P_0x141d3_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14166 \<longrightarrow> P_0x14166_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1432b \<longrightarrow> P_0x1432b_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14330 \<longrightarrow> P_0x14330_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1419f \<longrightarrow> P_0x1419f_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14166 \<longrightarrow> P_0x14166_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14178 \<longrightarrow> P_0x14178_true_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142f7 \<longrightarrow> P_0x142f7_true_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1419f \<longrightarrow> P_0x1419f_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_false_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142f7 \<longrightarrow> P_0x142f7_false_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1430a \<longrightarrow> P_0x1430a_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1430f \<longrightarrow> P_0x1430f_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14311 \<longrightarrow> P_0x14311_true_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1419f \<longrightarrow> P_0x1419f_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_true_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_false_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14311 \<longrightarrow> P_0x14311_false_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14178 \<longrightarrow> P_0x14178_false_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14181 \<longrightarrow> P_0x14181_true_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142ed \<longrightarrow> P_0x142ed_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142f2 \<longrightarrow> P_0x142f2_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142f5 \<longrightarrow> P_0x142f5_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142f7 \<longrightarrow> P_0x142f7_true_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1419f \<longrightarrow> P_0x1419f_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_true_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_false_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142f7 \<longrightarrow> P_0x142f7_false_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1430a \<longrightarrow> P_0x1430a_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1430f \<longrightarrow> P_0x1430f_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14311 \<longrightarrow> P_0x14311_true_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1419f \<longrightarrow> P_0x1419f_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_true_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_false_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14311 \<longrightarrow> P_0x14311_false_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14181 \<longrightarrow> P_0x14181_false_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14190 \<longrightarrow> P_0x14190_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14195 \<longrightarrow> P_0x14195_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1419f \<longrightarrow> P_0x1419f_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_true_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_false_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141d3 \<longrightarrow> P_0x141d3_false_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141f1 \<longrightarrow> P_0x141f1_true_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14358 \<longrightarrow> P_0x14358_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1435d \<longrightarrow> P_0x1435d_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14369 \<longrightarrow> P_0x14369_true_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14369 \<longrightarrow> P_0x14369_false_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14375 \<longrightarrow> P_0x14375_true_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14375 \<longrightarrow> P_0x14375_false_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1438f \<longrightarrow> P_0x1438f_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14394 \<longrightarrow> P_0x14394_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14195 \<longrightarrow> P_0x14195_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1419f \<longrightarrow> P_0x1419f_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_true_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_false_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141f1 \<longrightarrow> P_0x141f1_false_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141fa \<longrightarrow> P_0x141fa_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ff \<longrightarrow> P_0x141ff_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14201 \<longrightarrow> P_0x14201_true_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14201 \<longrightarrow> P_0x14201_false_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14226 \<longrightarrow> P_0x14226_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1422b \<longrightarrow> P_0x1422b_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1419f \<longrightarrow> P_0x1419f_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_true_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x141ae \<longrightarrow> P_0x141ae_false_73_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14317 \<longrightarrow> P_0x14317_74_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14240 \<longrightarrow> P_0x14240_75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14257 \<longrightarrow> P_0x14257_true_76_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14257 \<longrightarrow> P_0x14257_false_77_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14275 \<longrightarrow> P_0x14275_78_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1427a \<longrightarrow> P_0x1427a_79_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14282 \<longrightarrow> P_0x14282_80_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1429d \<longrightarrow> P_0x1429d_81_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142a2 \<longrightarrow> P_0x142a2_82_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142ac \<longrightarrow> P_0x142ac_83_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142ba \<longrightarrow> P_0x142ba_true_84_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14399 \<longrightarrow> P_0x14399_85_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x142ba \<longrightarrow> P_0x142ba_false_86_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_get_cluster_offset_addr_0x141c8_4}} \<box>get_cluster_offset_acode {{P_0x141cd_5;M_0x141c8}}\<close>
    and [blocks]: \<open>{{Q_memset_addr_0x1432b_8}} \<box>memset_acode {{P_0x14330_9;M_0x1432b}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x1430a_20}} \<box>bdrv_read_acode {{P_0x1430f_21;M_0x1430a}}\<close>
    and [blocks]: \<open>{{Q_memset_addr_0x142ed_29}} \<box>memset_acode {{P_0x142f2_30;M_0x142ed}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x1430a_37}} \<box>bdrv_read_acode {{P_0x1430f_38;M_0x1430a}}\<close>
    and [blocks]: \<open>{{Q_memset_addr_0x14190_45}} \<box>memset_acode {{P_0x14195_46;M_0x14190}}\<close>
    and [blocks]: \<open>{{Q_bdrv_pread_addr_0x14358_52}} \<box>bdrv_pread_acode {{P_0x1435d_53;M_0x14358}}\<close>
    and [blocks]: \<open>{{Q_encrypt_sectors_isra_12_addr_0x1438f_58}} \<box>encrypt_sectors_isra_12_acode {{P_0x14394_59;M_0x1438f}}\<close>
    and [blocks]: \<open>{{Q_decompress_cluster_addr_0x141fa_65}} \<box>decompress_cluster_acode {{P_0x141ff_66;M_0x141fa}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x14226_69}} \<box>memcpy_acode {{P_0x1422b_70;M_0x14226}}\<close>
    and [blocks]: \<open>{{Q_encrypt_sectors_isra_12_addr_0x14275_78}} \<box>encrypt_sectors_isra_12_acode {{P_0x1427a_79;M_0x14275}}\<close>
    and [blocks]: \<open>{{Q_bdrv_write_addr_0x1429d_81}} \<box>bdrv_write_acode {{P_0x142a2_82;M_0x1429d}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x14399_85}} \<box>stack_chk_fail_acode {{Q_fail;M_0x14399}}\<close>
  shows \<open>{{?P}} copy_sectors_acode {{?Q;?M}}\<close>
  apply (vcg acode: copy_sectors_acode_def assms: assms)
        apply (vcg_while \<open>P_0x141b4_3 || P_0x14317_74 || P_0x14240_75\<close> assms: assms)
  done

end

end
