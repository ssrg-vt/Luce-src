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
theory example
  imports "../../isabelle/VCG/HTriple"
begin

locale "example" = execution_context + exec_code +
  fixes is_even_0x124b_retval\<^sub>v stack_chk_fail_0x127b_retval\<^sub>v stack_chk_fail_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode :: ACode
  assumes fetch:
    "fetch 0x1135 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1136 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x1139 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 4)))) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x113c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 4))))), 3)"
    "fetch 0x113f \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x1142 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1144 \<equiv> (Unary (IS_80386 Sete) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x1147 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1148 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1149 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x114a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x114d \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x114e \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 72)), 4)"
    "fetch 0x1152 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 68)))) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x1155 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 80)))) (Storage (Reg (General SixtyFour rsi))), 4)"
    "fetch 0x1159 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x1162 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1166 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1168 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x116b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x116e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 80))))), 4)"
    "fetch 0x1172 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1176 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 80))))), 4)"
    "fetch 0x117a \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x117e \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 48)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1182 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 56))))), 4)"
    "fetch 0x1186 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1188 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 48))))), 4)"
    "fetch 0x118c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x118e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 80))))), 4)"
    "fetch 0x1192 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x1196 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x1198 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x119a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 80))))), 4)"
    "fetch 0x119e \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 97)), 3)"
    "fetch 0x11a1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 68))))), 3)"
    "fetch 0x11a4 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x11a7 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x11ab \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 40)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x11af \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x11b2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x11b5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r11)) (Immediate SixtyFour (ImmVal 0)), 6)"
    "fetch 0x11bb \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x11be \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x11c1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 0)), 6)"
    "fetch 0x11c7 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x11c9 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_Mult 4 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))), 8)"
    "fetch 0x11d1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 16)), 5)"
    "fetch 0x11d6 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x11da \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x11dd \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 16)), 5)"
    "fetch 0x11e2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 0)), 5)"
    "fetch 0x11e7 \<equiv> (Unary (IS_8088 Div) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x11ea \<equiv> (Ternary (IS_8088 Imul) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x11ee \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x11f1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x11f4 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x11f8 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 2)), 4)"
    "fetch 0x11fc \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 2)), 4)"
    "fetch 0x1200 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 32)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1204 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 60)))) (Immediate SixtyFour (ImmVal 0)), 7)"
    "fetch 0x120b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 4670)), 2)"
    "fetch 0x120d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 60))))), 3)"
    "fetch 0x1210 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x1212 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))), 8)"
    "fetch 0x121a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 80))))), 4)"
    "fetch 0x121e \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1221 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x1224 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x1227 \<equiv> (Binary (IS_80386 Movsx) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x122a \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 1 (A_FromReg (General SixtyFour rax)))))), 3)"
    "fetch 0x122d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 32))))), 4)"
    "fetch 0x1231 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 60))))), 3)"
    "fetch 0x1234 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x1237 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rdx)))))) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x123a \<equiv> (Binary (IS_8088 Add) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 60)))) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x123e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 60))))), 3)"
    "fetch 0x1241 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 68))))), 3)"
    "fetch 0x1244 \<equiv> (Unary (IS_8088 Jl) (Immediate SixtyFour (ImmVal 4621)), 2)"
    "fetch 0x1246 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 68))))), 3)"
    "fetch 0x1249 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x124b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''is_even'')), 5)"
    "fetch 0x1250 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rax)) (Storage (Reg (General Eight rax))), 2)"
    "fetch 0x1252 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 4707)), 2)"
    "fetch 0x1254 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 32))))), 4)"
    "fetch 0x1258 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 68))))), 3)"
    "fetch 0x125b \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x125e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 3)"
    "fetch 0x1261 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 4713)), 2)"
    "fetch 0x1263 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 32))))), 4)"
    "fetch 0x1267 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1269 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsp)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x126c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 24))))), 4)"
    "fetch 0x1270 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x1279 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 4736)), 2)"
    "fetch 0x127b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x1280 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 8))))), 4)"
    "fetch 0x1284 \<equiv> (Nullary (IS_80188 Leave), 1)"
    "fetch 0x1285 \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and is_even\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''is_even'') = 0x1135\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>is_even_0x124b_retval \<equiv> is_even_0x124b_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x127b_retval \<equiv> stack_chk_fail_0x127b_retval\<^sub>v\<close>

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

locale "is_even" = "example" +
  fixes RAX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1135_0 :: state_pred where
  \<open>P_0x1135_0 \<sigma> \<equiv> RIP \<sigma> = 0x1135 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1135_0_def[Ps]

definition P_0x1135_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1135_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0xc), 4)
  }\<close>

definition P_0x1135_0_regions :: state_pred where
  \<open>P_0x1135_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1135_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_0 :: state_pred where
  \<open>Q_ret_address_0 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)::32 word) AND 0x1)::32 word) = (ucast ((0x0::64 word))::32 word) then 0x1 else (0x0::8 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare Q_ret_address_0_def[Qs]

schematic_goal is_even_0_9_0x1135_0x1148_0[blocks]:
  assumes \<open>(P_0x1135_0 && P_0x1135_0_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x1148 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_0 ?\<sigma> \<and> block_usage P_0x1135_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1135_0_def P_0x1135_0_regions_def post: Q_ret_address_0_def regionset: P_0x1135_0_regions_set_def)

definition is_even_acode :: ACode where
  \<open>is_even_acode =
    Block 9 0x1148 0
  \<close>

schematic_goal "is_even":
  \<open>{{?P}} is_even_acode {{?Q;?M}}\<close>
  by (vcg acode: is_even_acode_def)

end

locale "main" = "example" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R11\<^sub>0\<^sub>v R10\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R11\<^sub>0 \<equiv> R11\<^sub>0\<^sub>v\<close>
definition \<open>R10\<^sub>0 \<equiv> R10\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1149_0 :: state_pred where
  \<open>P_0x1149_0 \<sigma> \<equiv> RIP \<sigma> = 0x1149 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1149_0_def[Ps]

definition P_0x1149_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1149_0_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, 4),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x58), 8)
  }\<close>

definition P_0x1149_0_regions :: state_pred where
  \<open>P_0x1149_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1149_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(0,1)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(0,1), (1,0)}))
\<close>

definition Q_0x123e_0 :: state_pred where
  \<open>Q_0x123e_0 \<sigma> \<equiv> RIP \<sigma> = 0x123e \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0\<close>
declare Q_0x123e_0_def[Qs]

schematic_goal main_0_53_0x1149_0x120b_0[blocks]:
  assumes \<open>(P_0x1149_0 && P_0x1149_0_regions) \<sigma>\<close>
  shows \<open>exec_block 53 0x120b 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x123e_0 ?\<sigma> \<and> block_usage P_0x1149_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1149_0_def P_0x1149_0_regions_def post: Q_0x123e_0_def regionset: P_0x1149_0_regions_set_def)

definition P_0x123e_1 :: state_pred where
  \<open>P_0x123e_1 \<sigma> \<equiv> RIP \<sigma> = 0x123e \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0\<close>
declare P_0x123e_1_def[Ps]

definition P_0x123e_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x123e_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8)
  }\<close>

definition P_0x123e_1_regions :: state_pred where
  \<open>P_0x123e_1_regions \<sigma> \<equiv> \<exists>regions. P_0x123e_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1244_1 :: state_pred where
  \<open>Q_0x1244_1 \<sigma> \<equiv> RIP \<sigma> = 0x1244 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0\<close>
declare Q_0x1244_1_def[Qs]

schematic_goal main_0_2_0x123e_0x1241_1[blocks]:
  assumes \<open>(P_0x123e_1 && P_0x123e_1_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1241 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1244_1 ?\<sigma> \<and> block_usage P_0x123e_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x123e_1_def P_0x123e_1_regions_def post: Q_0x1244_1_def regionset: P_0x123e_1_regions_set_def)

definition P_0x1244_true_2 :: state_pred where
  \<open>P_0x1244_true_2 \<sigma> \<equiv> RIP \<sigma> = 0x1244 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0\<close>
declare P_0x1244_true_2_def[Ps]

definition P_0x1244_true_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1244_true_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)), 8),
    (4, ((((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)),8]::64 word), Suc 0)
  }\<close>

definition P_0x1244_true_2_regions :: state_pred where
  \<open>P_0x1244_true_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1244_true_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x123e_2 :: state_pred where
  \<open>Q_0x123e_2 \<sigma> \<equiv> RIP \<sigma> = 0x123e \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0\<close>
declare Q_0x123e_2_def[Qs]

schematic_goal main_0_15_0x1244_0x123a_2[blocks]:
  assumes \<open>(P_0x1244_true_2 && P_0x1244_true_2_regions && jl) \<sigma>\<close>
  shows \<open>exec_block 15 0x123a 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x123e_2 ?\<sigma> \<and> block_usage P_0x1244_true_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1244_true_2_def P_0x1244_true_2_regions_def post: Q_0x123e_2_def regionset: P_0x1244_true_2_regions_set_def)

definition P_0x1244_false_3 :: state_pred where
  \<open>P_0x1244_false_3 \<sigma> \<equiv> RIP \<sigma> = 0x1244 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0\<close>
declare P_0x1244_false_3_def[Ps]

definition P_0x1244_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1244_false_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8)
  }\<close>

definition P_0x1244_false_3_regions :: state_pred where
  \<open>P_0x1244_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1244_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1246_3 :: state_pred where
  \<open>Q_0x1246_3 \<sigma> \<equiv> RIP \<sigma> = 0x1246 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0\<close>
declare Q_0x1246_3_def[Qs]

schematic_goal main_0_1_0x1244_0x1244_3[blocks]:
  assumes \<open>(P_0x1244_false_3 && P_0x1244_false_3_regions && ! jl) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1244 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1246_3 ?\<sigma> \<and> block_usage P_0x1244_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1244_false_3_def P_0x1244_false_3_regions_def post: Q_0x1246_3_def regionset: P_0x1244_false_3_regions_set_def)

definition P_0x1246_4 :: state_pred where
  \<open>P_0x1246_4 \<sigma> \<equiv> RIP \<sigma> = 0x1246 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0\<close>
declare P_0x1246_4_def[Ps]

definition P_0x1246_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1246_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8)
  }\<close>

definition P_0x1246_4_regions :: state_pred where
  \<open>P_0x1246_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1246_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x124b_4 :: state_pred where
  \<open>Q_0x124b_4 \<sigma> \<equiv> RIP \<sigma> = 0x124b \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0\<close>
declare Q_0x124b_4_def[Qs]

schematic_goal main_0_2_0x1246_0x1249_4[blocks]:
  assumes \<open>(P_0x1246_4 && P_0x1246_4_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1249 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x124b_4 ?\<sigma> \<and> block_usage P_0x1246_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1246_4_def P_0x1246_4_regions_def post: Q_0x124b_4_def regionset: P_0x1246_4_regions_set_def)

definition P_0x124b_5 :: state_pred where
  \<open>P_0x124b_5 \<sigma> \<equiv> RIP \<sigma> = 0x124b \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0\<close>
declare P_0x124b_5_def[Ps]

definition P_0x124b_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x124b_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60), 8)
  }\<close>

definition P_0x124b_5_regions :: state_pred where
  \<open>P_0x124b_5_regions \<sigma> \<equiv> \<exists>regions. P_0x124b_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1135_0x124b_5 :: state_pred where
  \<open>Q_0x1135_0x124b_5 \<sigma> \<equiv> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60) \<and> RIP \<sigma> = 0x1135 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x10 \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare Q_0x1135_0x124b_5_def[Qs]

schematic_goal main_0_1_0x124b_0x124b_5[blocks]:
  assumes \<open>(P_0x124b_5 && P_0x124b_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x124b 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1135_0x124b_5 ?\<sigma> \<and> block_usage P_0x124b_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x124b_5_def P_0x124b_5_regions_def post: Q_0x1135_0x124b_5_def regionset: P_0x124b_5_regions_set_def)

definition P_0x1250_6 :: state_pred where
  \<open>P_0x1250_6 \<sigma> \<equiv> RIP \<sigma> = 0x1250 \<and> RAX \<sigma> = ucast (is_even_0x124b_retval) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare P_0x1250_6_def[Ps]

definition P_0x1250_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1250_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60), 8)
  }\<close>

definition P_0x1250_6_regions :: state_pred where
  \<open>P_0x1250_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1250_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1252_6 :: state_pred where
  \<open>Q_0x1252_6 \<sigma> \<equiv> RIP \<sigma> = 0x1252 \<and> RAX \<sigma> = ucast (is_even_0x124b_retval) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare Q_0x1252_6_def[Qs]

schematic_goal main_0_1_0x1250_0x1250_6[blocks]:
  assumes \<open>(P_0x1250_6 && P_0x1250_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1250 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1252_6 ?\<sigma> \<and> block_usage P_0x1250_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1250_6_def P_0x1250_6_regions_def post: Q_0x1252_6_def regionset: P_0x1250_6_regions_set_def)

definition P_0x1252_true_7 :: state_pred where
  \<open>P_0x1252_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x1252 \<and> RAX \<sigma> = ucast (is_even_0x124b_retval) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare P_0x1252_true_7_def[Ps]

definition P_0x1252_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1252_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60), 8)
  }\<close>

definition P_0x1252_true_7_regions :: state_pred where
  \<open>P_0x1252_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1252_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1269_7 :: state_pred where
  \<open>Q_0x1269_7 \<sigma> \<equiv> RIP \<sigma> = 0x1269 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare Q_0x1269_7_def[Qs]

schematic_goal main_0_3_0x1252_0x1267_7[blocks]:
  assumes \<open>(P_0x1252_true_7 && P_0x1252_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1267 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1269_7 ?\<sigma> \<and> block_usage P_0x1252_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1252_true_7_def P_0x1252_true_7_regions_def post: Q_0x1269_7_def regionset: P_0x1252_true_7_regions_set_def)

definition P_0x1252_false_8 :: state_pred where
  \<open>P_0x1252_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x1252 \<and> RAX \<sigma> = ucast (is_even_0x124b_retval) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare P_0x1252_false_8_def[Ps]

definition P_0x1252_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1252_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60), 8)
  }\<close>

definition P_0x1252_false_8_regions :: state_pred where
  \<open>P_0x1252_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1252_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1269_8 :: state_pred where
  \<open>Q_0x1269_8 \<sigma> \<equiv> RIP \<sigma> = 0x1269 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare Q_0x1269_8_def[Qs]

schematic_goal main_0_6_0x1252_0x1261_8[blocks]:
  assumes \<open>(P_0x1252_false_8 && P_0x1252_false_8_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x1261 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1269_8 ?\<sigma> \<and> block_usage P_0x1252_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1252_false_8_def P_0x1252_false_8_regions_def post: Q_0x1269_8_def regionset: P_0x1252_false_8_regions_set_def)

definition P_0x1269_9 :: state_pred where
  \<open>P_0x1269_9 \<sigma> \<equiv> RIP \<sigma> = 0x1269 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x10 \<and> RSP \<sigma> = ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare P_0x1269_9_def[Ps]

definition P_0x1269_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1269_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60), 8)
  }\<close>

definition P_0x1269_9_regions :: state_pred where
  \<open>P_0x1269_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1269_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1279_9 :: state_pred where
  \<open>Q_0x1279_9 \<sigma> \<equiv> RIP \<sigma> = 0x1279 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare Q_0x1279_9_def[Qs]

schematic_goal main_0_3_0x1269_0x1270_9[blocks]:
  assumes \<open>(P_0x1269_9 && P_0x1269_9_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1270 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1279_9 ?\<sigma> \<and> block_usage P_0x1269_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1269_9_def P_0x1269_9_regions_def post: Q_0x1279_9_def regionset: P_0x1269_9_regions_set_def)

definition P_0x1279_true_10 :: state_pred where
  \<open>P_0x1279_true_10 \<sigma> \<equiv> RIP \<sigma> = 0x1279 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare P_0x1279_true_10_def[Ps]

definition P_0x1279_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1279_true_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60), 8)
  }\<close>

definition P_0x1279_true_10_regions :: state_pred where
  \<open>P_0x1279_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1279_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_10 :: state_pred where
  \<open>Q_ret_address_10 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare Q_ret_address_10_def[Qs]

schematic_goal main_0_4_0x1279_0x1285_10[blocks]:
  assumes \<open>(P_0x1279_true_10 && P_0x1279_true_10_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1285 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_10 ?\<sigma> \<and> block_usage P_0x1279_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1279_true_10_def P_0x1279_true_10_regions_def post: Q_ret_address_10_def regionset: P_0x1279_true_10_regions_set_def)

definition P_0x1279_false_11 :: state_pred where
  \<open>P_0x1279_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x1279 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare P_0x1279_false_11_def[Ps]

definition P_0x1279_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1279_false_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60), 8)
  }\<close>

definition P_0x1279_false_11_regions :: state_pred where
  \<open>P_0x1279_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1279_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x127b_11 :: state_pred where
  \<open>Q_0x127b_11 \<sigma> \<equiv> RIP \<sigma> = 0x127b \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare Q_0x127b_11_def[Qs]

schematic_goal main_0_1_0x1279_0x1279_11[blocks]:
  assumes \<open>(P_0x1279_false_11 && P_0x1279_false_11_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1279 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x127b_11 ?\<sigma> \<and> block_usage P_0x1279_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1279_false_11_def P_0x1279_false_11_regions_def post: Q_0x127b_11_def regionset: P_0x1279_false_11_regions_set_def)

definition P_0x127b_12 :: state_pred where
  \<open>P_0x127b_12 \<sigma> \<equiv> RIP \<sigma> = 0x127b \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare P_0x127b_12_def[Ps]

definition P_0x127b_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x127b_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x20), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60), 8)
  }\<close>

definition P_0x127b_12_regions :: state_pred where
  \<open>P_0x127b_12_regions \<sigma> \<equiv> \<exists>regions. P_0x127b_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x127b_12 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x127b_12 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> R11 \<sigma> = 0x0 \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x20),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = ((ucast ((((ucast ((((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x55)::64 word))::64 word) >> 2)::64 word))::64 word) << 2) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ((RSI\<^sub>0::64 word) + 0x20) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - (\<langle>63,0\<rangle>(((ucast ((((0xf::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word))::128 word) udiv (ucast ((0x10::32 word))::64 word)::64 word) * 0x10)::64 word))::64 word) - 0x60),8]::64 word) = 0x1250\<close>
declare Q_stack_chk_fail_addr_0x127b_12_def[Qs]

schematic_goal main_0_1_0x127b_0x127b_12[blocks]:
  assumes \<open>(P_0x127b_12 && P_0x127b_12_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x127b 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x127b_12 ?\<sigma> \<and> block_usage P_0x127b_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x127b_12_def P_0x127b_12_regions_def post: Q_stack_chk_fail_addr_0x127b_12_def regionset: P_0x127b_12_regions_set_def)

text \<open>Manually fixed\<close>
interpretation is_even_0x124b_5: is_even _ _ _ _ _ _ _ _ _ _ _ _ _ _ \<open>ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close> \<open>((RSP\<^sub>0::64 word) - 0x58)\<close> \<open>ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close> \<open>0x10\<close> \<open>0x124b\<close>
  by unfold_locales

definition main_acode :: ACode where
  \<open>main_acode =
    Block 53 0x120b 0;
    WHILE P_0x123e_1 DO
      Block 2 0x1241 (Suc 0);
      IF jl THEN
        Block 15 0x123a 2
      ELSE
        Block (Suc 0) 0x1244 3
      FI
    OD;
    Block 2 0x1249 4;
    Block (Suc 0) 0x124b 5;
    CALL is_even_0x124b_5.is_even_acode;
    Block (Suc 0) 0x1250 6;
    IF ZF THEN
      Block 3 0x1267 7
    ELSE
      Block 6 0x1261 8
    FI;
    Block 3 0x1270 9;
    IF ZF THEN
      Block 4 0x1285 10
    ELSE
      Block (Suc 0) 0x1279 11;
      Block (Suc 0) 0x127b 12;
      CALL stack_chk_fail_acode
    FI
  \<close>

schematic_goal "main":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x123e \<longrightarrow> P_0x123e_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1244 \<longrightarrow> P_0x1244_true_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1244 \<longrightarrow> P_0x1244_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1246 \<longrightarrow> P_0x1246_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x124b \<longrightarrow> P_0x124b_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1250 \<longrightarrow> P_0x1250_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1252 \<longrightarrow> P_0x1252_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1252 \<longrightarrow> P_0x1252_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1269 \<longrightarrow> P_0x1269_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1279 \<longrightarrow> P_0x1279_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1279 \<longrightarrow> P_0x1279_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x127b \<longrightarrow> P_0x127b_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1135 \<longrightarrow> is_even_0x124b_5.P_0x1135_0_regions \<sigma>\<close> \<comment> \<open>Manually fixed\<close>
    and [blocks]: \<open>{{Q_0x1135_0x124b_5}} \<box>is_even_0x124b_5.is_even_acode {{P_0x1250_6;M_0x124b}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x127b_12}} \<box>stack_chk_fail_acode {{Q_fail;M_0x127b}}\<close>
  shows \<open>{{?P}} main_acode {{?Q;?M}}\<close>
  apply (vcg acode: main_acode_def assms: assms)
   apply (vcg_while \<open>P_0x123e_1 || P_0x1246_4\<close> assms: assms) \<comment> \<open>Done manually\<close>
     apply (vcg_step assms: assms)+
  done

end

end
