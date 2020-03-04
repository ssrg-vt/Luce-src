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
theory xen_cpuid
  imports "../../../isabelle/VCG/HTriple"
begin

locale xen_cpuid = execution_context + exec_code +
  fixes printf_chk_0x2a17_retval\<^sub>v puts_0x2a23_retval\<^sub>v printf_chk_0x2a62_retval\<^sub>v printf_chk_0x2ab3_retval\<^sub>v puts_0x2aca_retval\<^sub>v printf_chk_0x2aeb_retval\<^sub>v printf_chk_0x2b24_retval\<^sub>v printf_chk_addr puts_addr :: \<open>64 word\<close>
    and printf_chk_acode puts_acode :: ACode
  assumes fetch:
    "fetch 0x29f0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x29f2 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x29f4 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x29f6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x29f9 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x29fb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x29fe \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x29ff \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x2a02 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x2a04 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x2a07 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x2a08 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2a0d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x2a10 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1521)))), 7)"
    "fetch 0x2a17 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2a1c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1813)))), 7)"
    "fetch 0x2a23 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''puts'')), 5)"
    "fetch 0x2a28 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 2522)))), 7)"
    "fetch 0x2a2f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1802)))), 7)"
    "fetch 0x2a36 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2a3b \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x2a3c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 2443)))), 7)"
    "fetch 0x2a43 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1502)))), 7)"
    "fetch 0x2a4a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x2a4b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 2407)))), 7)"
    "fetch 0x2a52 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 2379)))), 7)"
    "fetch 0x2a59 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2a5b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1761)))), 7)"
    "fetch 0x2a62 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2a67 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rcx))), 1)"
    "fetch 0x2a68 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rsi))), 1)"
    "fetch 0x2a69 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x2a6c \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 10947)), 2)"
    "fetch 0x2a6e \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour r12)) (A_WordConstant 1)))), 5)"
    "fetch 0x2a73 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1494)))), 7)"
    "fetch 0x2a7a \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 2 (A_FromReg (General SixtyFour rax)))))), 4)"
    "fetch 0x2a7e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rax))) (A_WordConstant 24))))), 5)"
    "fetch 0x2a83 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x2a88 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8))))), 4)"
    "fetch 0x2a8c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 12))))), 4)"
    "fetch 0x2a90 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 20))))), 3)"
    "fetch 0x2a93 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 16))))), 3)"
    "fetch 0x2a96 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x2a99 \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0x2a9c \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x2a9e \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x2aa0 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 10938)), 2)"
    "fetch 0x2aa2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 4))))), 3)"
    "fetch 0x2aa5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rsi))), 1)"
    "fetch 0x2aa6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2aab \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x2aae \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rdx))), 1)"
    "fetch 0x2aaf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x2ab1 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2ab3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2ab8 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x2ab9 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rdx))), 1)"
    "fetch 0x2aba \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x2abe \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x2ac1 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 10888)), 2)"
    "fetch 0x2ac3 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1662)))), 7)"
    "fetch 0x2aca \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''puts'')), 5)"
    "fetch 0x2acf \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2ad1 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1655)))), 7)"
    "fetch 0x2ad8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1654)))), 7)"
    "fetch 0x2adf \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1653)))), 7)"
    "fetch 0x2ae6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2aeb \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2af0 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x2af3 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 11054)), 2)"
    "fetch 0x2af5 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour r13)) (A_WordConstant 1)))), 4)"
    "fetch 0x2af9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x2afc \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0x2b00 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 16))))), 5)"
    "fetch 0x2b05 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1632)))), 7)"
    "fetch 0x2b0c \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x2b10 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8))))), 4)"
    "fetch 0x2b14 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x2b16 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x2b19 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2b1e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2b20 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x2b24 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2b29 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x2b2c \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 11024)), 2)"
    "fetch 0x2b2e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x2b2f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x2b30 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x2b32 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x2b34 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x2b36 \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and printf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__printf_chk'') = printf_chk_addr\<close>
    and puts\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''puts'') = puts_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>printf_chk_0x2a17_retval \<equiv> printf_chk_0x2a17_retval\<^sub>v\<close>
definition \<open>puts_0x2a23_retval \<equiv> puts_0x2a23_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2a62_retval \<equiv> printf_chk_0x2a62_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2ab3_retval \<equiv> printf_chk_0x2ab3_retval\<^sub>v\<close>
definition \<open>puts_0x2aca_retval \<equiv> puts_0x2aca_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2aeb_retval \<equiv> printf_chk_0x2aeb_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2b24_retval \<equiv> printf_chk_0x2b24_retval\<^sub>v\<close>

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
  rewrite_one_let' add: U_instr_defs,
  auto simp add: simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def step_def exec_instr_def presimplify add simp del: del

method steps uses pre post add del =
  auto simp: pred_logic pre,
  (step add: add del: del)+,
  auto simp: next_step_def eq_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post

method vcg_step uses assms =
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  ((auto simp: eq_def)[])+

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale print_policy = xen_cpuid +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v regRBX_4\<^sub>0\<^sub>v varRBX\<^sub>0_4\<^sub>0\<^sub>v varRSP\<^sub>0_8\<^sub>0\<^sub>v regRBXADDval4_4\<^sub>0\<^sub>v regRBXADDval8_4\<^sub>0\<^sub>v regRBXADDval8_8\<^sub>0\<^sub>v regRBXADDval12_4\<^sub>0\<^sub>v regRBXADDval16_4\<^sub>0\<^sub>v regRBXADDval20_4\<^sub>0\<^sub>v varRBX\<^sub>0ADDval4_4\<^sub>0\<^sub>v varRBX\<^sub>0ADDval8_4\<^sub>0\<^sub>v varRBX\<^sub>0ADDval8_8\<^sub>0\<^sub>v varRBX\<^sub>0ADDval12_4\<^sub>0\<^sub>v varRBX\<^sub>0ADDval16_4\<^sub>0\<^sub>v varRBX\<^sub>0ADDval20_4\<^sub>0\<^sub>v varRSP\<^sub>0ADDval8_8\<^sub>0\<^sub>v varRSP\<^sub>0ADDval16_8\<^sub>0\<^sub>v varRSP\<^sub>0ADDval24_8\<^sub>0\<^sub>v varRSP\<^sub>0ADDval32_8\<^sub>0\<^sub>v varRSP\<^sub>0ADDval40_8\<^sub>0\<^sub>v varRSP\<^sub>0SUBval8_8\<^sub>0\<^sub>v varRSP\<^sub>0SUBval16_8\<^sub>0\<^sub>v varRSP\<^sub>0SUBval24_8\<^sub>0\<^sub>v varRSP\<^sub>0SUBval32_8\<^sub>0\<^sub>v varRSP\<^sub>0SUBval40_8\<^sub>0\<^sub>v varRSP\<^sub>0SUBval48_8\<^sub>0\<^sub>v varRSP\<^sub>0SUBval56_8\<^sub>0\<^sub>v varRSP\<^sub>0SUBval64_8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R14\<^sub>0 \<equiv> R14\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>regRBX_4\<^sub>0 \<equiv> regRBX_4\<^sub>0\<^sub>v\<close>
definition \<open>varRBX\<^sub>0_4\<^sub>0 \<equiv> varRBX\<^sub>0_4\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0_8\<^sub>0 \<equiv> varRSP\<^sub>0_8\<^sub>0\<^sub>v\<close>
definition \<open>regRBXADDval4_4\<^sub>0 \<equiv> regRBXADDval4_4\<^sub>0\<^sub>v\<close>
definition \<open>regRBXADDval8_4\<^sub>0 \<equiv> regRBXADDval8_4\<^sub>0\<^sub>v\<close>
definition \<open>regRBXADDval8_8\<^sub>0 \<equiv> regRBXADDval8_8\<^sub>0\<^sub>v\<close>
definition \<open>regRBXADDval12_4\<^sub>0 \<equiv> regRBXADDval12_4\<^sub>0\<^sub>v\<close>
definition \<open>regRBXADDval16_4\<^sub>0 \<equiv> regRBXADDval16_4\<^sub>0\<^sub>v\<close>
definition \<open>regRBXADDval20_4\<^sub>0 \<equiv> regRBXADDval20_4\<^sub>0\<^sub>v\<close>
definition \<open>varRBX\<^sub>0ADDval4_4\<^sub>0 \<equiv> varRBX\<^sub>0ADDval4_4\<^sub>0\<^sub>v\<close>
definition \<open>varRBX\<^sub>0ADDval8_4\<^sub>0 \<equiv> varRBX\<^sub>0ADDval8_4\<^sub>0\<^sub>v\<close>
definition \<open>varRBX\<^sub>0ADDval8_8\<^sub>0 \<equiv> varRBX\<^sub>0ADDval8_8\<^sub>0\<^sub>v\<close>
definition \<open>varRBX\<^sub>0ADDval12_4\<^sub>0 \<equiv> varRBX\<^sub>0ADDval12_4\<^sub>0\<^sub>v\<close>
definition \<open>varRBX\<^sub>0ADDval16_4\<^sub>0 \<equiv> varRBX\<^sub>0ADDval16_4\<^sub>0\<^sub>v\<close>
definition \<open>varRBX\<^sub>0ADDval20_4\<^sub>0 \<equiv> varRBX\<^sub>0ADDval20_4\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0ADDval8_8\<^sub>0 \<equiv> varRSP\<^sub>0ADDval8_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0ADDval16_8\<^sub>0 \<equiv> varRSP\<^sub>0ADDval16_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0ADDval24_8\<^sub>0 \<equiv> varRSP\<^sub>0ADDval24_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0ADDval32_8\<^sub>0 \<equiv> varRSP\<^sub>0ADDval32_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0ADDval40_8\<^sub>0 \<equiv> varRSP\<^sub>0ADDval40_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0SUBval8_8\<^sub>0 \<equiv> varRSP\<^sub>0SUBval8_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0SUBval16_8\<^sub>0 \<equiv> varRSP\<^sub>0SUBval16_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0SUBval24_8\<^sub>0 \<equiv> varRSP\<^sub>0SUBval24_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0SUBval32_8\<^sub>0 \<equiv> varRSP\<^sub>0SUBval32_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0SUBval40_8\<^sub>0 \<equiv> varRSP\<^sub>0SUBval40_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0SUBval48_8\<^sub>0 \<equiv> varRSP\<^sub>0SUBval48_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0SUBval56_8\<^sub>0 \<equiv> varRSP\<^sub>0SUBval56_8\<^sub>0\<^sub>v\<close>
definition \<open>varRSP\<^sub>0SUBval64_8\<^sub>0 \<equiv> varRSP\<^sub>0SUBval64_8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x29f0 :: state_pred where
  \<open>P_0x29f0 \<sigma> \<equiv> RIP \<sigma> = 0x29f0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = varRSP\<^sub>0SUBval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = varRSP\<^sub>0SUBval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = varRSP\<^sub>0SUBval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = varRSP\<^sub>0SUBval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = varRSP\<^sub>0SUBval40_8\<^sub>0\<close>
declare P_0x29f0_def[Ps]

definition P_0x29f0_regions :: state_pred where
  \<open>P_0x29f0_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2a17 :: state_pred where
  \<open>Q_0x2a17 \<sigma> \<equiv> RIP \<sigma> = 0x2a17 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2a17_def[Qs]

schematic_goal print_policy_0_14_0x29f0_0x2a10[blocks]:
  assumes \<open>(P_0x29f0 && P_0x29f0_regions) \<sigma>\<close>
  shows \<open>exec_block 14 0x29f0 0x2a10 \<sigma> \<triangleq> ?mp \<and> Q_0x2a17 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x29f0_def P_0x29f0_regions_def post: Q_0x2a17_def)

definition P_0x2a17 :: state_pred where
  \<open>P_0x2a17 \<sigma> \<equiv> RIP \<sigma> = 0x2a17 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2a17_def[Ps]

definition P_0x2a17_regions :: state_pred where
  \<open>P_0x2a17_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_printf_chk_addr_0x2a17 :: state_pred where
  \<open>Q_printf_chk_addr_0x2a17 \<sigma> \<equiv> RSP \<sigma> = (RSP\<^sub>0 - 0x30) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3008 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2a1c\<close>
declare Q_printf_chk_addr_0x2a17_def[Qs]

schematic_goal print_policy_0_1_0x2a17_0x2a17[blocks]:
  assumes \<open>(P_0x2a17 && P_0x2a17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2a17 0x2a17 \<sigma> \<triangleq> ?mp \<and> Q_printf_chk_addr_0x2a17 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2a17_def P_0x2a17_regions_def post: Q_printf_chk_addr_0x2a17_def)

definition P_0x2a1c :: state_pred where
  \<open>P_0x2a1c \<sigma> \<equiv> RIP \<sigma> = 0x2a1c \<and> RAX \<sigma> = printf_chk_0x2a17_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2a1c\<close>
declare P_0x2a1c_def[Ps]

definition P_0x2a1c_regions :: state_pred where
  \<open>P_0x2a1c_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2a23 :: state_pred where
  \<open>Q_0x2a23 \<sigma> \<equiv> RIP \<sigma> = 0x2a23 \<and> RAX \<sigma> = printf_chk_0x2a17_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x3138 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2a1c\<close>
declare Q_0x2a23_def[Qs]

schematic_goal print_policy_0_1_0x2a1c_0x2a1c[blocks]:
  assumes \<open>(P_0x2a1c && P_0x2a1c_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2a1c 0x2a1c \<sigma> \<triangleq> ?mp \<and> Q_0x2a23 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2a1c_def P_0x2a1c_regions_def post: Q_0x2a23_def)

definition P_0x2a23 :: state_pred where
  \<open>P_0x2a23 \<sigma> \<equiv> RIP \<sigma> = 0x2a23 \<and> RAX \<sigma> = printf_chk_0x2a17_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x3138 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2a1c\<close>
declare P_0x2a23_def[Ps]

definition P_0x2a23_regions :: state_pred where
  \<open>P_0x2a23_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_puts_addr_0x2a23 :: state_pred where
  \<open>Q_puts_addr_0x2a23 \<sigma> \<equiv> RSP \<sigma> = (RSP\<^sub>0 - 0x30) \<and> RIP \<sigma> = puts_addr \<and> RAX \<sigma> = printf_chk_0x2a17_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x3138 \<and> RSI \<sigma> = 0x3008 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2a28\<close>
declare Q_puts_addr_0x2a23_def[Qs]

schematic_goal print_policy_0_1_0x2a23_0x2a23[blocks]:
  assumes \<open>(P_0x2a23 && P_0x2a23_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2a23 0x2a23 \<sigma> \<triangleq> ?mp \<and> Q_puts_addr_0x2a23 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2a23_def P_0x2a23_regions_def post: Q_puts_addr_0x2a23_def)

definition P_0x2a28 :: state_pred where
  \<open>P_0x2a28 \<sigma> \<equiv> RIP \<sigma> = 0x2a28 \<and> RAX \<sigma> = ucast (puts_0x2a23_retval) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x3138 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2a28\<close>
declare P_0x2a28_def[Ps]

definition P_0x2a28_regions :: state_pred where
  \<open>P_0x2a28_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8),
    (19, (RSP\<^sub>0 - 0x38), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2a62 :: state_pred where
  \<open>Q_0x2a62 \<sigma> \<equiv> RIP \<sigma> = 0x2a62 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x3140 \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3028 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x38),8]::64 word) = 0x33ce\<close>
declare Q_0x2a62_def[Qs]

schematic_goal print_policy_0_11_0x2a28_0x2a5b[blocks]:
  assumes \<open>(P_0x2a28 && P_0x2a28_regions) \<sigma>\<close>
  shows \<open>exec_block 11 0x2a28 0x2a5b \<sigma> \<triangleq> ?mp \<and> Q_0x2a62 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2a28_def P_0x2a28_regions_def post: Q_0x2a62_def)

definition P_0x2a62 :: state_pred where
  \<open>P_0x2a62 \<sigma> \<equiv> RIP \<sigma> = 0x2a62 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x3140 \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3028 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x38),8]::64 word) = 0x33ce\<close>
declare P_0x2a62_def[Ps]

definition P_0x2a62_regions :: state_pred where
  \<open>P_0x2a62_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8),
    (19, (RSP\<^sub>0 - 0x38), 8),
    (20, (RSP\<^sub>0 - 0x40), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_printf_chk_addr_0x2a62 :: state_pred where
  \<open>Q_printf_chk_addr_0x2a62 \<sigma> \<equiv> RSP \<sigma> = (RSP\<^sub>0 - 0x40) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x3140 \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3028 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x38),8]::64 word) = 0x33ce \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x40),8]::64 word) = 0x2a67\<close>
declare Q_printf_chk_addr_0x2a62_def[Qs]

schematic_goal print_policy_0_1_0x2a62_0x2a62[blocks]:
  assumes \<open>(P_0x2a62 && P_0x2a62_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2a62 0x2a62 \<sigma> \<triangleq> ?mp \<and> Q_printf_chk_addr_0x2a62 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2a62_def P_0x2a62_regions_def post: Q_printf_chk_addr_0x2a62_def)

definition P_0x2a67 :: state_pred where
  \<open>P_0x2a67 \<sigma> \<equiv> RIP \<sigma> = 0x2a67 \<and> RAX \<sigma> = printf_chk_0x2a62_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x3140 \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3028 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x38),8]::64 word) = 0x33ce \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x40),8]::64 word) = 0x2a67\<close>
declare P_0x2a67_def[Ps]

definition P_0x2a67_regions :: state_pred where
  \<open>P_0x2a67_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8),
    (19, (RSP\<^sub>0 - 0x38), 8),
    (20, (RSP\<^sub>0 - 0x40), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2a6c :: state_pred where
  \<open>Q_0x2a6c \<sigma> \<equiv> RIP \<sigma> = 0x2a6c \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2a6c_def[Qs]

schematic_goal print_policy_0_3_0x2a67_0x2a69[blocks]:
  assumes \<open>(P_0x2a67 && P_0x2a67_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x2a67 0x2a69 \<sigma> \<triangleq> ?mp \<and> Q_0x2a6c (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2a67_def P_0x2a67_regions_def post: Q_0x2a6c_def)

definition P_0x2a6c_true :: state_pred where
  \<open>P_0x2a6c_true \<sigma> \<equiv> RIP \<sigma> = 0x2a6c \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2a6c_true_def[Ps]

definition P_0x2a6c_true_regions :: state_pred where
  \<open>P_0x2a6c_true_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2ac3 :: state_pred where
  \<open>Q_0x2ac3 \<sigma> \<equiv> RIP \<sigma> = 0x2ac3 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2ac3_def[Qs]

schematic_goal print_policy_0_1_0x2a6c_0x2a6c[blocks]:
  assumes \<open>(P_0x2a6c_true && P_0x2a6c_true_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2a6c 0x2a6c \<sigma> \<triangleq> ?mp \<and> Q_0x2ac3 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2a6c_true_def P_0x2a6c_true_regions_def post: Q_0x2ac3_def)

definition P_0x2a6c_false :: state_pred where
  \<open>P_0x2a6c_false \<sigma> \<equiv> RIP \<sigma> = 0x2a6c \<and> RAX \<sigma> = printf_chk_0x2a62_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x33ce \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3409 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x38),8]::64 word) = 0x33ce \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x40),8]::64 word) = 0x2a67\<close>
declare P_0x2a6c_false_def[Ps]

definition P_0x2a6c_false_regions :: state_pred where
  \<open>P_0x2a6c_false_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8),
    (19, (RSP\<^sub>0 - 0x38), 8),
    (20, (RSP\<^sub>0 - 0x40), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2a88 :: state_pred where
  \<open>Q_0x2a88 \<sigma> \<equiv> RIP \<sigma> = 0x2a88 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2a88_def[Qs]

schematic_goal print_policy_0_6_0x2a6c_0x2a83[blocks]:
  assumes \<open>(P_0x2a6c_false && P_0x2a6c_false_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x2a6c 0x2a83 \<sigma> \<triangleq> ?mp \<and> Q_0x2a88 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2a6c_false_def P_0x2a6c_false_regions_def post: Q_0x2a88_def)

definition P_0x2a88 :: state_pred where
  \<open>P_0x2a88 \<sigma> \<equiv> RIP \<sigma> = 0x2a88 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2a88_def[Ps]

definition P_0x2a88_regions :: state_pred where
  \<open>P_0x2a88_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX \<sigma> + 0x8), 4),
    (3, (RBX \<sigma> + 0xc), 4),
    (4, (RBX \<sigma> + 0x10), 4),
    (5, (RBX \<sigma> + 0x14), 4),
    (6, (RBX\<^sub>0 + 0x4), 4),
    (7, (RBX\<^sub>0 + 0x8), 4),
    (8, (RBX\<^sub>0 + 0x8), 8),
    (9, (RBX\<^sub>0 + 0xc), 4),
    (10, (RBX\<^sub>0 + 0x10), 4),
    (11, (RBX\<^sub>0 + 0x14), 4),
    (12, (RSP\<^sub>0 + 0x8), 8),
    (13, (RSP\<^sub>0 + 0x10), 8),
    (14, (RSP\<^sub>0 + 0x18), 8),
    (15, (RSP\<^sub>0 + 0x20), 8),
    (16, (RSP\<^sub>0 + 0x28), 8),
    (17, (RSP\<^sub>0 - 0x8), 8),
    (18, (RSP\<^sub>0 - 0x10), 8),
    (19, (RSP\<^sub>0 - 0x18), 8),
    (20, (RSP\<^sub>0 - 0x20), 8),
    (21, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(7,8), (9,8)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(7,8), (8,7), (8,9), (9,8)}))
\<close>

definition Q_0x2aa0 :: state_pred where
  \<open>Q_0x2aa0 \<sigma> \<equiv> RIP \<sigma> = 0x2aa0 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2aa0_def[Qs]

schematic_goal print_policy_0_8_0x2a88_0x2a9e[blocks]:
  assumes \<open>(P_0x2a88 && P_0x2a88_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x2a88 0x2a9e \<sigma> \<triangleq> ?mp \<and> Q_0x2aa0 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2a88_def P_0x2a88_regions_def post: Q_0x2aa0_def)

definition P_0x2aa0_true :: state_pred where
  \<open>P_0x2aa0_true \<sigma> \<equiv> RIP \<sigma> = 0x2aa0 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2aa0_true_def[Ps]

definition P_0x2aa0_true_regions :: state_pred where
  \<open>P_0x2aa0_true_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX \<sigma> + 0x8), 4),
    (3, (RBX \<sigma> + 0xc), 4),
    (4, (RBX \<sigma> + 0x10), 4),
    (5, (RBX \<sigma> + 0x14), 4),
    (6, (RBX\<^sub>0 + 0x4), 4),
    (7, (RBX\<^sub>0 + 0x8), 4),
    (8, (RBX\<^sub>0 + 0x8), 8),
    (9, (RBX\<^sub>0 + 0xc), 4),
    (10, (RBX\<^sub>0 + 0x10), 4),
    (11, (RBX\<^sub>0 + 0x14), 4),
    (12, (RSP\<^sub>0 + 0x8), 8),
    (13, (RSP\<^sub>0 + 0x10), 8),
    (14, (RSP\<^sub>0 + 0x18), 8),
    (15, (RSP\<^sub>0 + 0x20), 8),
    (16, (RSP\<^sub>0 + 0x28), 8),
    (17, (RSP\<^sub>0 - 0x8), 8),
    (18, (RSP\<^sub>0 - 0x10), 8),
    (19, (RSP\<^sub>0 - 0x18), 8),
    (20, (RSP\<^sub>0 - 0x20), 8),
    (21, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(7,8), (9,8)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(7,8), (8,7), (8,9), (9,8)}))
\<close>

definition Q_0x2aba :: state_pred where
  \<open>Q_0x2aba \<sigma> \<equiv> RIP \<sigma> = 0x2aba \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2aba_def[Qs]

schematic_goal print_policy_0_1_0x2aa0_0x2aa0[blocks]:
  assumes \<open>(P_0x2aa0_true && P_0x2aa0_true_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2aa0 0x2aa0 \<sigma> \<triangleq> ?mp \<and> Q_0x2aba (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2aa0_true_def P_0x2aa0_true_regions_def post: Q_0x2aba_def)

definition P_0x2aa0_false :: state_pred where
  \<open>P_0x2aa0_false \<sigma> \<equiv> RIP \<sigma> = 0x2aa0 \<and> RAX \<sigma> = ucast (((((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) OR (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) OR (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) OR (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2aa0_false_def[Ps]

definition P_0x2aa0_false_regions :: state_pred where
  \<open>P_0x2aa0_false_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX \<sigma>, 4),
    (1, RBX\<^sub>0, 4),
    (2, RSP\<^sub>0, 8),
    (3, (RBX \<sigma> + 0x4), 4),
    (4, (RBX \<sigma> + 0x8), 4),
    (5, (RBX \<sigma> + 0xc), 4),
    (6, (RBX \<sigma> + 0x10), 4),
    (7, (RBX \<sigma> + 0x14), 4),
    (8, (RBX\<^sub>0 + 0x4), 4),
    (9, (RBX\<^sub>0 + 0x8), 4),
    (10, (RBX\<^sub>0 + 0x8), 8),
    (11, (RBX\<^sub>0 + 0xc), 4),
    (12, (RBX\<^sub>0 + 0x10), 4),
    (13, (RBX\<^sub>0 + 0x14), 4),
    (14, (RSP\<^sub>0 + 0x8), 8),
    (15, (RSP\<^sub>0 + 0x10), 8),
    (16, (RSP\<^sub>0 + 0x18), 8),
    (17, (RSP\<^sub>0 + 0x20), 8),
    (18, (RSP\<^sub>0 + 0x28), 8),
    (19, (RSP\<^sub>0 - 0x8), 8),
    (20, (RSP\<^sub>0 - 0x10), 8),
    (21, (RSP\<^sub>0 - 0x18), 8),
    (22, (RSP\<^sub>0 - 0x20), 8),
    (23, (RSP\<^sub>0 - 0x28), 8),
    (24, (RSP\<^sub>0 - 0x30), 8),
    (25, (RSP\<^sub>0 - 0x38), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(9,10), (11,10)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(9,10), (10,9), (10,11), (11,10)}))
\<close>

definition Q_0x2ab3 :: state_pred where
  \<open>Q_0x2ab3 \<sigma> \<equiv> RIP \<sigma> = 0x2ab3 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3050 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x38),8]::64 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word))\<close>
declare Q_0x2ab3_def[Qs]

schematic_goal print_policy_0_8_0x2aa0_0x2ab1[blocks]:
  assumes \<open>(P_0x2aa0_false && P_0x2aa0_false_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x2aa0 0x2ab1 \<sigma> \<triangleq> ?mp \<and> Q_0x2ab3 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2aa0_false_def P_0x2aa0_false_regions_def post: Q_0x2ab3_def)

definition P_0x2ab3 :: state_pred where
  \<open>P_0x2ab3 \<sigma> \<equiv> RIP \<sigma> = 0x2ab3 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3050 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x38),8]::64 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word))\<close>
declare P_0x2ab3_def[Ps]

definition P_0x2ab3_regions :: state_pred where
  \<open>P_0x2ab3_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX \<sigma>, 4),
    (1, RBX\<^sub>0, 4),
    (2, RSP\<^sub>0, 8),
    (3, (RBX \<sigma> + 0x4), 4),
    (4, (RBX \<sigma> + 0x8), 4),
    (5, (RBX \<sigma> + 0xc), 4),
    (6, (RBX \<sigma> + 0x10), 4),
    (7, (RBX \<sigma> + 0x14), 4),
    (8, (RBX\<^sub>0 + 0x4), 4),
    (9, (RBX\<^sub>0 + 0x8), 4),
    (10, (RBX\<^sub>0 + 0x8), 8),
    (11, (RBX\<^sub>0 + 0xc), 4),
    (12, (RBX\<^sub>0 + 0x10), 4),
    (13, (RBX\<^sub>0 + 0x14), 4),
    (14, (RSP\<^sub>0 + 0x8), 8),
    (15, (RSP\<^sub>0 + 0x10), 8),
    (16, (RSP\<^sub>0 + 0x18), 8),
    (17, (RSP\<^sub>0 + 0x20), 8),
    (18, (RSP\<^sub>0 + 0x28), 8),
    (19, (RSP\<^sub>0 - 0x8), 8),
    (20, (RSP\<^sub>0 - 0x10), 8),
    (21, (RSP\<^sub>0 - 0x18), 8),
    (22, (RSP\<^sub>0 - 0x20), 8),
    (23, (RSP\<^sub>0 - 0x28), 8),
    (24, (RSP\<^sub>0 - 0x30), 8),
    (25, (RSP\<^sub>0 - 0x38), 8),
    (26, (RSP\<^sub>0 - 0x40), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(9,10), (11,10)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(9,10), (10,9), (10,11), (11,10)}))
\<close>

definition Q_printf_chk_addr_0x2ab3 :: state_pred where
  \<open>Q_printf_chk_addr_0x2ab3 \<sigma> \<equiv> RSP \<sigma> = (RSP\<^sub>0 - 0x40) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3050 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x38),8]::64 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x40),8]::64 word) = 0x2ab8\<close>
declare Q_printf_chk_addr_0x2ab3_def[Qs]

schematic_goal print_policy_0_1_0x2ab3_0x2ab3[blocks]:
  assumes \<open>(P_0x2ab3 && P_0x2ab3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2ab3 0x2ab3 \<sigma> \<triangleq> ?mp \<and> Q_printf_chk_addr_0x2ab3 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2ab3_def P_0x2ab3_regions_def post: Q_printf_chk_addr_0x2ab3_def)

definition P_0x2ab8 :: state_pred where
  \<open>P_0x2ab8 \<sigma> \<equiv> RIP \<sigma> = 0x2ab8 \<and> RAX \<sigma> = printf_chk_0x2ab3_retval \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3050 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x38),8]::64 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x40),8]::64 word) = 0x2ab8\<close>
declare P_0x2ab8_def[Ps]

definition P_0x2ab8_regions :: state_pred where
  \<open>P_0x2ab8_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX \<sigma>, 4),
    (1, RBX\<^sub>0, 4),
    (2, RSP\<^sub>0, 8),
    (3, (RBX \<sigma> + 0x4), 4),
    (4, (RBX \<sigma> + 0x8), 4),
    (5, (RBX \<sigma> + 0xc), 4),
    (6, (RBX \<sigma> + 0x10), 4),
    (7, (RBX \<sigma> + 0x14), 4),
    (8, (RBX\<^sub>0 + 0x4), 4),
    (9, (RBX\<^sub>0 + 0x8), 4),
    (10, (RBX\<^sub>0 + 0x8), 8),
    (11, (RBX\<^sub>0 + 0xc), 4),
    (12, (RBX\<^sub>0 + 0x10), 4),
    (13, (RBX\<^sub>0 + 0x14), 4),
    (14, (RSP\<^sub>0 + 0x8), 8),
    (15, (RSP\<^sub>0 + 0x10), 8),
    (16, (RSP\<^sub>0 + 0x18), 8),
    (17, (RSP\<^sub>0 + 0x20), 8),
    (18, (RSP\<^sub>0 + 0x28), 8),
    (19, (RSP\<^sub>0 - 0x8), 8),
    (20, (RSP\<^sub>0 - 0x10), 8),
    (21, (RSP\<^sub>0 - 0x18), 8),
    (22, (RSP\<^sub>0 - 0x20), 8),
    (23, (RSP\<^sub>0 - 0x28), 8),
    (24, (RSP\<^sub>0 - 0x30), 8),
    (25, (RSP\<^sub>0 - 0x38), 8),
    (26, (RSP\<^sub>0 - 0x40), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(9,10), (11,10)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(9,10), (10,9), (10,11), (11,10)}))
\<close>

definition Q_0x2aba :: state_pred where
  \<open>Q_0x2aba \<sigma> \<equiv> RIP \<sigma> = 0x2aba \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2aba_def[Qs]

schematic_goal print_policy_0_2_0x2ab8_0x2ab9[blocks]:
  assumes \<open>(P_0x2ab8 && P_0x2ab8_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x2ab8 0x2ab9 \<sigma> \<triangleq> ?mp \<and> Q_0x2aba (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2ab8_def P_0x2ab8_regions_def post: Q_0x2aba_def)

definition P_0x2aba :: state_pred where
  \<open>P_0x2aba \<sigma> \<equiv> RIP \<sigma> = 0x2aba \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RSI\<^sub>0 + ((\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) + (\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>RDX\<^sub>0::32 word) - 0x1)::32 word) * 0x2)::64 word)) * 0x8)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(RBX \<sigma> + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2aba_def[Ps]

definition P_0x2aba_regions :: state_pred where
  \<open>P_0x2aba_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX \<sigma> + 0x8), 4),
    (3, (RBX \<sigma> + 0xc), 4),
    (4, (RBX \<sigma> + 0x10), 4),
    (5, (RBX \<sigma> + 0x14), 4),
    (6, (RBX\<^sub>0 + 0x4), 4),
    (7, (RBX\<^sub>0 + 0x8), 4),
    (8, (RBX\<^sub>0 + 0x8), 8),
    (9, (RBX\<^sub>0 + 0xc), 4),
    (10, (RBX\<^sub>0 + 0x10), 4),
    (11, (RBX\<^sub>0 + 0x14), 4),
    (12, (RSP\<^sub>0 + 0x8), 8),
    (13, (RSP\<^sub>0 + 0x10), 8),
    (14, (RSP\<^sub>0 + 0x18), 8),
    (15, (RSP\<^sub>0 + 0x20), 8),
    (16, (RSP\<^sub>0 + 0x28), 8),
    (17, (RSP\<^sub>0 - 0x8), 8),
    (18, (RSP\<^sub>0 - 0x10), 8),
    (19, (RSP\<^sub>0 - 0x18), 8),
    (20, (RSP\<^sub>0 - 0x20), 8),
    (21, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(7,8), (9,8)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(7,8), (8,7), (8,9), (9,8)}))
\<close>

definition Q_0x2ac1 :: state_pred where
  \<open>Q_0x2ac1 \<sigma> \<equiv> RIP \<sigma> = 0x2ac1 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2ac1_def[Qs]

schematic_goal print_policy_0_2_0x2aba_0x2abe[blocks]:
  assumes \<open>(P_0x2aba && P_0x2aba_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x2aba 0x2abe \<sigma> \<triangleq> ?mp \<and> Q_0x2ac1 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2aba_def P_0x2aba_regions_def post: Q_0x2ac1_def)

definition P_0x2ac1_true :: state_pred where
  \<open>P_0x2ac1_true \<sigma> \<equiv> RIP \<sigma> = 0x2ac1 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2ac1_true_def[Ps]

definition P_0x2ac1_true_regions :: state_pred where
  \<open>P_0x2ac1_true_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2a88 :: state_pred where
  \<open>Q_0x2a88 \<sigma> \<equiv> RIP \<sigma> = 0x2a88 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2a88_def[Qs]

schematic_goal print_policy_0_1_0x2ac1_0x2ac1[blocks]:
  assumes \<open>(P_0x2ac1_true && P_0x2ac1_true_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2ac1 0x2ac1 \<sigma> \<triangleq> ?mp \<and> Q_0x2a88 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2ac1_true_def P_0x2ac1_true_regions_def post: Q_0x2a88_def)

definition P_0x2ac1_false :: state_pred where
  \<open>P_0x2ac1_false \<sigma> \<equiv> RIP \<sigma> = 0x2ac1 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2ac1_false_def[Ps]

definition P_0x2ac1_false_regions :: state_pred where
  \<open>P_0x2ac1_false_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2ac3 :: state_pred where
  \<open>Q_0x2ac3 \<sigma> \<equiv> RIP \<sigma> = 0x2ac3 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2ac3_def[Qs]

schematic_goal print_policy_0_1_0x2ac1_0x2ac1[blocks]:
  assumes \<open>(P_0x2ac1_false && P_0x2ac1_false_regions && !!ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2ac1 0x2ac1 \<sigma> \<triangleq> ?mp \<and> Q_0x2ac3 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2ac1_false_def P_0x2ac1_false_regions_def post: Q_0x2ac3_def)

definition P_0x2ac3 :: state_pred where
  \<open>P_0x2ac3 \<sigma> \<equiv> RIP \<sigma> = 0x2ac3 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2ac3_def[Ps]

definition P_0x2ac3_regions :: state_pred where
  \<open>P_0x2ac3_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2aca :: state_pred where
  \<open>Q_0x2aca \<sigma> \<equiv> RIP \<sigma> = 0x2aca \<and> RDI \<sigma> = 0x3148 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2aca_def[Qs]

schematic_goal print_policy_0_1_0x2ac3_0x2ac3[blocks]:
  assumes \<open>(P_0x2ac3 && P_0x2ac3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2ac3 0x2ac3 \<sigma> \<triangleq> ?mp \<and> Q_0x2aca (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2ac3_def P_0x2ac3_regions_def post: Q_0x2aca_def)

definition P_0x2aca :: state_pred where
  \<open>P_0x2aca \<sigma> \<equiv> RIP \<sigma> = 0x2aca \<and> RDI \<sigma> = 0x3148 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2aca_def[Ps]

definition P_0x2aca_regions :: state_pred where
  \<open>P_0x2aca_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_puts_addr_0x2aca :: state_pred where
  \<open>Q_puts_addr_0x2aca \<sigma> \<equiv> RSP \<sigma> = (RSP\<^sub>0 - 0x30) \<and> RIP \<sigma> = puts_addr \<and> RDI \<sigma> = 0x3148 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2acf\<close>
declare Q_puts_addr_0x2aca_def[Qs]

schematic_goal print_policy_0_1_0x2aca_0x2aca[blocks]:
  assumes \<open>(P_0x2aca && P_0x2aca_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2aca 0x2aca \<sigma> \<triangleq> ?mp \<and> Q_puts_addr_0x2aca (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2aca_def P_0x2aca_regions_def post: Q_puts_addr_0x2aca_def)

definition P_0x2acf :: state_pred where
  \<open>P_0x2acf \<sigma> \<equiv> RIP \<sigma> = 0x2acf \<and> RDI \<sigma> = 0x3148 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2acf\<close>
declare P_0x2acf_def[Ps]

definition P_0x2acf_regions :: state_pred where
  \<open>P_0x2acf_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2aeb :: state_pred where
  \<open>Q_0x2aeb \<sigma> \<equiv> RIP \<sigma> = 0x2aeb \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2acf\<close>
declare Q_0x2aeb_def[Qs]

schematic_goal print_policy_0_5_0x2acf_0x2ae6[blocks]:
  assumes \<open>(P_0x2acf && P_0x2acf_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x2acf 0x2ae6 \<sigma> \<triangleq> ?mp \<and> Q_0x2aeb (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2acf_def P_0x2acf_regions_def post: Q_0x2aeb_def)

definition P_0x2aeb :: state_pred where
  \<open>P_0x2aeb \<sigma> \<equiv> RIP \<sigma> = 0x2aeb \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2acf\<close>
declare P_0x2aeb_def[Ps]

definition P_0x2aeb_regions :: state_pred where
  \<open>P_0x2aeb_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_printf_chk_addr_0x2aeb :: state_pred where
  \<open>Q_printf_chk_addr_0x2aeb \<sigma> \<equiv> RSP \<sigma> = (RSP\<^sub>0 - 0x30) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2af0\<close>
declare Q_printf_chk_addr_0x2aeb_def[Qs]

schematic_goal print_policy_0_1_0x2aeb_0x2aeb[blocks]:
  assumes \<open>(P_0x2aeb && P_0x2aeb_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2aeb 0x2aeb \<sigma> \<triangleq> ?mp \<and> Q_printf_chk_addr_0x2aeb (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2aeb_def P_0x2aeb_regions_def post: Q_printf_chk_addr_0x2aeb_def)

definition P_0x2af0 :: state_pred where
  \<open>P_0x2af0 \<sigma> \<equiv> RIP \<sigma> = 0x2af0 \<and> RAX \<sigma> = printf_chk_0x2aeb_retval \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2af0\<close>
declare P_0x2af0_def[Ps]

definition P_0x2af0_regions :: state_pred where
  \<open>P_0x2af0_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2af3 :: state_pred where
  \<open>Q_0x2af3 \<sigma> \<equiv> RIP \<sigma> = 0x2af3 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2af3_def[Qs]

schematic_goal print_policy_0_1_0x2af0_0x2af0[blocks]:
  assumes \<open>(P_0x2af0 && P_0x2af0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2af0 0x2af0 \<sigma> \<triangleq> ?mp \<and> Q_0x2af3 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2af0_def P_0x2af0_regions_def post: Q_0x2af3_def)

definition P_0x2af3_true :: state_pred where
  \<open>P_0x2af3_true \<sigma> \<equiv> RIP \<sigma> = 0x2af3 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2af3_true_def[Ps]

definition P_0x2af3_true_regions :: state_pred where
  \<open>P_0x2af3_true_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2b2e :: state_pred where
  \<open>Q_0x2b2e \<sigma> \<equiv> RIP \<sigma> = 0x2b2e \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b2e_def[Qs]

schematic_goal print_policy_0_1_0x2af3_0x2af3[blocks]:
  assumes \<open>(P_0x2af3_true && P_0x2af3_true_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2af3 0x2af3 \<sigma> \<triangleq> ?mp \<and> Q_0x2b2e (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2af3_true_def P_0x2af3_true_regions_def post: Q_0x2b2e_def)

definition P_0x2af3_false :: state_pred where
  \<open>P_0x2af3_false \<sigma> \<equiv> RIP \<sigma> = 0x2af3 \<and> RAX \<sigma> = printf_chk_0x2aeb_retval \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2af0\<close>
declare P_0x2af3_false_def[Ps]

definition P_0x2af3_false_regions :: state_pred where
  \<open>P_0x2af3_false_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2b10 :: state_pred where
  \<open>Q_0x2b10 \<sigma> \<equiv> RIP \<sigma> = 0x2b10 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RCX\<^sub>0 + ((\<langle>63,0\<rangle>((\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>R8\<^sub>0::32 word) - 0x1)::32 word) << 0x4)::64 word) * 0x1)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b10_def[Qs]

schematic_goal print_policy_0_7_0x2af3_0x2b0c[blocks]:
  assumes \<open>(P_0x2af3_false && P_0x2af3_false_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x2af3 0x2b0c \<sigma> \<triangleq> ?mp \<and> Q_0x2b10 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2af3_false_def P_0x2af3_false_regions_def post: Q_0x2b10_def)

definition P_0x2b10 :: state_pred where
  \<open>P_0x2b10 \<sigma> \<equiv> RIP \<sigma> = 0x2b10 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RCX\<^sub>0 + ((\<langle>63,0\<rangle>((\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>R8\<^sub>0::32 word) - 0x1)::32 word) << 0x4)::64 word) * 0x1)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2b10_def[Ps]

definition P_0x2b10_regions :: state_pred where
  \<open>P_0x2b10_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX \<sigma>, 4),
    (1, RBX\<^sub>0, 4),
    (2, RSP\<^sub>0, 8),
    (3, (RBX \<sigma> + 0x8), 8),
    (4, (RBX\<^sub>0 + 0x4), 4),
    (5, (RBX\<^sub>0 + 0x8), 4),
    (6, (RBX\<^sub>0 + 0x8), 8),
    (7, (RBX\<^sub>0 + 0xc), 4),
    (8, (RBX\<^sub>0 + 0x10), 4),
    (9, (RBX\<^sub>0 + 0x14), 4),
    (10, (RSP\<^sub>0 + 0x8), 8),
    (11, (RSP\<^sub>0 + 0x10), 8),
    (12, (RSP\<^sub>0 + 0x18), 8),
    (13, (RSP\<^sub>0 + 0x20), 8),
    (14, (RSP\<^sub>0 + 0x28), 8),
    (15, (RSP\<^sub>0 - 0x8), 8),
    (16, (RSP\<^sub>0 - 0x10), 8),
    (17, (RSP\<^sub>0 - 0x18), 8),
    (18, (RSP\<^sub>0 - 0x20), 8),
    (19, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(5,6), (7,6)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(5,6), (6,5), (6,7), (7,6)}))
\<close>

definition Q_0x2b24 :: state_pred where
  \<open>Q_0x2b24 \<sigma> \<equiv> RIP \<sigma> = 0x2b24 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x316c \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RCX\<^sub>0 + ((\<langle>63,0\<rangle>((\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>R8\<^sub>0::32 word) - 0x1)::32 word) << 0x4)::64 word) * 0x1)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b24_def[Qs]

schematic_goal print_policy_0_6_0x2b10_0x2b20[blocks]:
  assumes \<open>(P_0x2b10 && P_0x2b10_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x2b10 0x2b20 \<sigma> \<triangleq> ?mp \<and> Q_0x2b24 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2b10_def P_0x2b10_regions_def post: Q_0x2b24_def)

definition P_0x2b24 :: state_pred where
  \<open>P_0x2b24 \<sigma> \<equiv> RIP \<sigma> = 0x2b24 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x316c \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RCX\<^sub>0 + ((\<langle>63,0\<rangle>((\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>R8\<^sub>0::32 word) - 0x1)::32 word) << 0x4)::64 word) * 0x1)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2b24_def[Ps]

definition P_0x2b24_regions :: state_pred where
  \<open>P_0x2b24_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_printf_chk_addr_0x2b24 :: state_pred where
  \<open>Q_printf_chk_addr_0x2b24 \<sigma> \<equiv> RSP \<sigma> = (RSP\<^sub>0 - 0x30) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x316c \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RCX\<^sub>0 + ((\<langle>63,0\<rangle>((\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>R8\<^sub>0::32 word) - 0x1)::32 word) << 0x4)::64 word) * 0x1)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2b29\<close>
declare Q_printf_chk_addr_0x2b24_def[Qs]

schematic_goal print_policy_0_1_0x2b24_0x2b24[blocks]:
  assumes \<open>(P_0x2b24 && P_0x2b24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b24 0x2b24 \<sigma> \<triangleq> ?mp \<and> Q_printf_chk_addr_0x2b24 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2b24_def P_0x2b24_regions_def post: Q_printf_chk_addr_0x2b24_def)

definition P_0x2b29 :: state_pred where
  \<open>P_0x2b29 \<sigma> \<equiv> RIP \<sigma> = 0x2b29 \<and> RAX \<sigma> = printf_chk_0x2b24_retval \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x316c \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = (RCX\<^sub>0 + ((\<langle>63,0\<rangle>((\<langle>63,0\<rangle>((\<langle>31,0\<rangle>((\<langle>31,0\<rangle>R8\<^sub>0::32 word) - 0x1)::32 word) << 0x4)::64 word) * 0x1)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x30),8]::64 word) = 0x2b29\<close>
declare P_0x2b29_def[Ps]

definition P_0x2b29_regions :: state_pred where
  \<open>P_0x2b29_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8),
    (18, (RSP\<^sub>0 - 0x30), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2b2c :: state_pred where
  \<open>Q_0x2b2c \<sigma> \<equiv> RIP \<sigma> = 0x2b2c \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b2c_def[Qs]

schematic_goal print_policy_0_1_0x2b29_0x2b29[blocks]:
  assumes \<open>(P_0x2b29 && P_0x2b29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b29 0x2b29 \<sigma> \<triangleq> ?mp \<and> Q_0x2b2c (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2b29_def P_0x2b29_regions_def post: Q_0x2b2c_def)

definition P_0x2b2c_true :: state_pred where
  \<open>P_0x2b2c_true \<sigma> \<equiv> RIP \<sigma> = 0x2b2c \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2b2c_true_def[Ps]

definition P_0x2b2c_true_regions :: state_pred where
  \<open>P_0x2b2c_true_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2b10 :: state_pred where
  \<open>Q_0x2b10 \<sigma> \<equiv> RIP \<sigma> = 0x2b10 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b10_def[Qs]

schematic_goal print_policy_0_1_0x2b2c_0x2b2c[blocks]:
  assumes \<open>(P_0x2b2c_true && P_0x2b2c_true_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b2c 0x2b2c \<sigma> \<triangleq> ?mp \<and> Q_0x2b10 (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2b2c_true_def P_0x2b2c_true_regions_def post: Q_0x2b10_def)

definition P_0x2b2c_false :: state_pred where
  \<open>P_0x2b2c_false \<sigma> \<equiv> RIP \<sigma> = 0x2b2c \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2b2c_false_def[Ps]

definition P_0x2b2c_false_regions :: state_pred where
  \<open>P_0x2b2c_false_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_0x2b2e :: state_pred where
  \<open>Q_0x2b2e \<sigma> \<equiv> RIP \<sigma> = 0x2b2e \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b2e_def[Qs]

schematic_goal print_policy_0_1_0x2b2c_0x2b2c[blocks]:
  assumes \<open>(P_0x2b2c_false && P_0x2b2c_false_regions && !!ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b2c 0x2b2c \<sigma> \<triangleq> ?mp \<and> Q_0x2b2e (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2b2c_false_def P_0x2b2c_false_regions_def post: Q_0x2b2e_def)

definition P_0x2b2e :: state_pred where
  \<open>P_0x2b2e \<sigma> \<equiv> RIP \<sigma> = 0x2b2e \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2b2e_def[Ps]

definition P_0x2b2e_regions :: state_pred where
  \<open>P_0x2b2e_regions \<sigma> \<equiv> \<exists>regions::(nat \<times> 64 word \<times> nat) set. {
    (0, RBX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, (RBX\<^sub>0 + 0x4), 4),
    (3, (RBX\<^sub>0 + 0x8), 4),
    (4, (RBX\<^sub>0 + 0x8), 8),
    (5, (RBX\<^sub>0 + 0xc), 4),
    (6, (RBX\<^sub>0 + 0x10), 4),
    (7, (RBX\<^sub>0 + 0x14), 4),
    (8, (RSP\<^sub>0 + 0x8), 8),
    (9, (RSP\<^sub>0 + 0x10), 8),
    (10, (RSP\<^sub>0 + 0x18), 8),
    (11, (RSP\<^sub>0 + 0x20), 8),
    (12, (RSP\<^sub>0 + 0x28), 8),
    (13, (RSP\<^sub>0 - 0x8), 8),
    (14, (RSP\<^sub>0 - 0x10), 8),
    (15, (RSP\<^sub>0 - 0x18), 8),
    (16, (RSP\<^sub>0 - 0x20), 8),
    (17, (RSP\<^sub>0 - 0x28), 8)
  } \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(3,4), (5,4)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(3,4), (4,3), (4,5), (5,4)}))
\<close>

definition Q_ret_address :: state_pred where
  \<open>Q_ret_address \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = (RSP\<^sub>0 + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBX\<^sub>0,4]::32 word) = ucast (varRBX\<^sub>0_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x4),4]::32 word) = ucast (varRBX\<^sub>0ADDval4_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),4]::32 word) = ucast (varRBX\<^sub>0ADDval8_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x8),8]::64 word) = varRBX\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0xc),4]::32 word) = ucast (varRBX\<^sub>0ADDval12_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x10),4]::32 word) = ucast (varRBX\<^sub>0ADDval16_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RBX\<^sub>0 + 0x14),4]::32 word) = ucast (varRBX\<^sub>0ADDval20_4\<^sub>0) \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x8),8]::64 word) = varRSP\<^sub>0ADDval8_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x10),8]::64 word) = varRSP\<^sub>0ADDval16_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x18),8]::64 word) = varRSP\<^sub>0ADDval24_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x20),8]::64 word) = varRSP\<^sub>0ADDval32_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 + 0x28),8]::64 word) = varRSP\<^sub>0ADDval40_8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[(RSP\<^sub>0 - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_def[Qs]

schematic_goal print_policy_0_6_0x2b2e_0x2b36[blocks]:
  assumes \<open>(P_0x2b2e && P_0x2b2e_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x2b2e 0x2b36 \<sigma> \<triangleq> ?mp \<and> Q_ret_address (mp_state ?mp)\<close>
  using assms
  by (steps pre: P_0x2b2e_def P_0x2b2e_regions_def post: Q_ret_address_def)

definition print_policy_acode :: ACode where
  \<open>print_policy_acode =
    Block 14 0x29f0 0x2a10;
    Block 1 0x2a17 0x2a17;
    CALL printf_chk_acode;
    Block 1 0x2a1c 0x2a1c;
    Block 1 0x2a23 0x2a23;
    CALL puts_acode;
    Block 11 0x2a28 0x2a5b;
    Block 1 0x2a62 0x2a62;
    CALL printf_chk_acode;
    Block 3 0x2a67 0x2a69;
    IF ZF THEN
      Block 1 0x2a6c 0x2a6c
    ELSE
      Block 6 0x2a6c 0x2a83;
      WHILE _ DO
        Block 8 0x2a88 0x2a9e;
        IF ZF THEN
          Block 1 0x2aa0 0x2aa0
        ELSE
          Block 8 0x2aa0 0x2ab1;
          Block 1 0x2ab3 0x2ab3;
          CALL printf_chk_acode;
          Block 2 0x2ab8 0x2ab9
        FI;
        Block 2 0x2aba 0x2abe;
        IF !ZF THEN
          Block 1 0x2ac1 0x2ac1
        ELSE
          Block 1 0x2ac1 0x2ac1
        FI
      OD
    FI;
    Block 1 0x2ac3 0x2ac3;
    Block 1 0x2aca 0x2aca;
    CALL puts_acode;
    Block 5 0x2acf 0x2ae6;
    Block 1 0x2aeb 0x2aeb;
    CALL printf_chk_acode;
    Block 1 0x2af0 0x2af0;
    IF ZF THEN
      Block 1 0x2af3 0x2af3
    ELSE
      Block 7 0x2af3 0x2b0c;
      WHILE _ DO
        Block 6 0x2b10 0x2b20;
        Block 1 0x2b24 0x2b24;
        CALL printf_chk_acode;
        Block 1 0x2b29 0x2b29;
        IF !ZF THEN
          Block 1 0x2b2c 0x2b2c
        ELSE
          Block 1 0x2b2c 0x2b2c
        FI
      OD
    FI;
    Block 6 0x2b2e 0x2b36
  \<close>

schematic_goal print_policy:
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a17 \<longrightarrow> P_0x2a17_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a1c \<longrightarrow> P_0x2a1c_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a23 \<longrightarrow> P_0x2a23_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a28 \<longrightarrow> P_0x2a28_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a62 \<longrightarrow> P_0x2a62_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a67 \<longrightarrow> P_0x2a67_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a6c \<longrightarrow> P_0x2a6c_true_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a6c \<longrightarrow> P_0x2a6c_false_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a88 \<longrightarrow> P_0x2a88_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2aa0 \<longrightarrow> P_0x2aa0_true_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2aa0 \<longrightarrow> P_0x2aa0_false_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ab3 \<longrightarrow> P_0x2ab3_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ab8 \<longrightarrow> P_0x2ab8_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2aba \<longrightarrow> P_0x2aba_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ac1 \<longrightarrow> P_0x2ac1_true_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ac1 \<longrightarrow> P_0x2ac1_false_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ac3 \<longrightarrow> P_0x2ac3_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2aca \<longrightarrow> P_0x2aca_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2acf \<longrightarrow> P_0x2acf_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2aeb \<longrightarrow> P_0x2aeb_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2af0 \<longrightarrow> P_0x2af0_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2af3 \<longrightarrow> P_0x2af3_true_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2af3 \<longrightarrow> P_0x2af3_false_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b10 \<longrightarrow> P_0x2b10_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b24 \<longrightarrow> P_0x2b24_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b29 \<longrightarrow> P_0x2b29_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b2c \<longrightarrow> P_0x2b2c_true_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b2c \<longrightarrow> P_0x2b2c_false_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b2e \<longrightarrow> P_0x2b2e_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2a17}} \<box>printf_chk_acode {{P_0x2a1c;M_0x2a17}}\<close>
    and [blocks]: \<open>{{Q_puts_addr_0x2a23}} \<box>puts_acode {{P_0x2a28;M_0x2a23}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2a62}} \<box>printf_chk_acode {{P_0x2a67;M_0x2a62}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2ab3}} \<box>printf_chk_acode {{P_0x2ab8;M_0x2ab3}}\<close>
    and [blocks]: \<open>{{Q_puts_addr_0x2aca}} \<box>puts_acode {{P_0x2acf;M_0x2aca}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2aeb}} \<box>printf_chk_acode {{P_0x2af0;M_0x2aeb}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2b24}} \<box>printf_chk_acode {{P_0x2b29;M_0x2b24}}\<close>
  shows \<open>{{?P}} print_policy_acode {{?Q;?M}}\<close>
  by (vcg acode: print_policy_acode_def assms: assms)

end

end
