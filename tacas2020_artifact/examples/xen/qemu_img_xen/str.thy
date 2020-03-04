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
theory str
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes strlen_0x55ad_retval\<^sub>v ctype_toupper_loc_0x567a_retval\<^sub>v ctype_toupper_loc_addr strlen_addr :: \<open>64 word\<close>
    and ctype_toupper_loc_acode strlen_acode :: ACode
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
    "fetch 0x5620 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 22068)), 2)"
    "fetch 0x5622 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x5628 \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rdi)))) (Storage (Reg (General Eight rax))), 2)"
    "fetch 0x562a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 22096)), 2)"
    "fetch 0x562c \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5630 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5634 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsi))))), 3)"
    "fetch 0x5637 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rax)) (Storage (Reg (General Eight rax))), 2)"
    "fetch 0x5639 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 22056)), 2)"
    "fetch 0x563b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x5640 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x5643 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 22098)), 2)"
    "fetch 0x5645 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdx)))) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5648 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5649 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x5650 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5652 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5653 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x565e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 5)"
    "fetch 0x5660 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5662 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x5665 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5667 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x566a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x566b \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x566c \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x5670 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbx)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsi))))), 3)"
    "fetch 0x5673 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rbx)) (Storage (Reg (General Eight rbx))), 2)"
    "fetch 0x5675 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 22200)), 2)"
    "fetch 0x5677 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x567a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__ctype_toupper_loc'')), 5)"
    "fetch 0x567f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x5682 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 22168)), 2)"
    "fetch 0x5684 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x5688 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x568c \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0))))), 4)"
    "fetch 0x5690 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5694 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rbx)) (Storage (Reg (General Eight rbx))), 2)"
    "fetch 0x5696 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 22200)), 2)"
    "fetch 0x5698 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour r12))))), 5)"
    "fetch 0x569d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbx))))))), 3)"
    "fetch 0x56a0 \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rcx)))))) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x56a3 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 22152)), 2)"
    "fetch 0x56a5 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x56a7 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x56ab \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x56ac \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x56ad \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x56af \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x56b1 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x56b2 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x56b8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x56bd \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x56c0 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 22183)), 2)"
    "fetch 0x56c2 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 0)))) (Storage (Reg (General SixtyFour r12))), 4)"
    "fetch 0x56c6 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x56ca \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x56cb \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x56cc \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x56ce \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x56d0 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x56d1 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and ctype_toupper_loc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__ctype_toupper_loc'') = ctype_toupper_loc_addr\<close>
    and strlen\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strlen'') = strlen_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>strlen_0x55ad_retval \<equiv> strlen_0x55ad_retval\<^sub>v\<close>
definition \<open>ctype_toupper_loc_0x567a_retval \<equiv> ctype_toupper_loc_0x567a_retval\<^sub>v\<close>

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
  auto simp: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

method vcg_step uses assms =
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

locale "strstart" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5620_0 :: state_pred where
  \<open>P_0x5620_0 \<sigma> \<equiv> RIP \<sigma> = 0x5620 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5620_0_def[Ps]

definition P_0x5620_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5620_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5620_0_regions :: state_pred where
  \<open>P_0x5620_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5620_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5634_0 :: state_pred where
  \<open>Q_0x5634_0 \<sigma> \<equiv> RIP \<sigma> = 0x5634 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5634_0_def[Qs]

schematic_goal strstart_0_1_0x5620_0x5620_0[blocks]:
  assumes \<open>(P_0x5620_0 && P_0x5620_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5620 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5634_0 ?\<sigma> \<and> block_usage P_0x5620_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5620_0_def P_0x5620_0_regions_def post: Q_0x5634_0_def regionset: P_0x5620_0_regions_set_def)

definition P_0x5634_1 :: state_pred where
  \<open>P_0x5634_1 \<sigma> \<equiv> RIP \<sigma> = 0x5634 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5634_1_def[Ps]

definition P_0x5634_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5634_1_regions_set \<sigma> \<equiv> {
    (0, RSI \<sigma>, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5634_1_regions :: state_pred where
  \<open>P_0x5634_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5634_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5639_1 :: state_pred where
  \<open>Q_0x5639_1 \<sigma> \<equiv> RIP \<sigma> = 0x5639 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5639_1_def[Qs]

schematic_goal strstart_0_2_0x5634_0x5637_1[blocks]:
  assumes \<open>(P_0x5634_1 && P_0x5634_1_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5637 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5639_1 ?\<sigma> \<and> block_usage P_0x5634_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5634_1_def P_0x5634_1_regions_def post: Q_0x5639_1_def regionset: P_0x5634_1_regions_set_def)

definition P_0x5639_true_2 :: state_pred where
  \<open>P_0x5639_true_2 \<sigma> \<equiv> RIP \<sigma> = 0x5639 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5639_true_2_def[Ps]

definition P_0x5639_true_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5639_true_2_regions_set \<sigma> \<equiv> {
    (0, RDI \<sigma>, Suc 0),
    (1, RSI \<sigma>, Suc 0),
    (2, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5639_true_2_regions :: state_pred where
  \<open>P_0x5639_true_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5639_true_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x562a_2 :: state_pred where
  \<open>Q_0x562a_2 \<sigma> \<equiv> RIP \<sigma> = 0x562a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x562a_2_def[Qs]

schematic_goal strstart_0_2_0x5639_0x5628_2[blocks]:
  assumes \<open>(P_0x5639_true_2 && P_0x5639_true_2_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5628 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x562a_2 ?\<sigma> \<and> block_usage P_0x5639_true_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5639_true_2_def P_0x5639_true_2_regions_def post: Q_0x562a_2_def regionset: P_0x5639_true_2_regions_set_def)

definition P_0x562a_true_3 :: state_pred where
  \<open>P_0x562a_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x562a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x562a_true_3_def[Ps]

definition P_0x562a_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x562a_true_3_regions_set \<sigma> \<equiv> {
    (0, RDI \<sigma>, Suc 0),
    (1, RSI \<sigma>, Suc 0),
    (2, RSP\<^sub>0, 8)
  }\<close>

definition P_0x562a_true_3_regions :: state_pred where
  \<open>P_0x562a_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x562a_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5650_3 :: state_pred where
  \<open>Q_0x5650_3 \<sigma> \<equiv> RIP \<sigma> = 0x5650 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5650_3_def[Qs]

schematic_goal strstart_0_1_0x562a_0x562a_3[blocks]:
  assumes \<open>(P_0x562a_true_3 && P_0x562a_true_3_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x562a 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5650_3 ?\<sigma> \<and> block_usage P_0x562a_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x562a_true_3_def P_0x562a_true_3_regions_def post: Q_0x5650_3_def regionset: P_0x562a_true_3_regions_set_def)

definition P_0x562a_false_4 :: state_pred where
  \<open>P_0x562a_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x562a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x562a_false_4_def[Ps]

definition P_0x562a_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x562a_false_4_regions_set \<sigma> \<equiv> {
    (0, RDI \<sigma>, Suc 0),
    (1, RSI \<sigma>, Suc 0),
    (2, RSP\<^sub>0, 8)
  }\<close>

definition P_0x562a_false_4_regions :: state_pred where
  \<open>P_0x562a_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x562a_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5634_4 :: state_pred where
  \<open>Q_0x5634_4 \<sigma> \<equiv> RIP \<sigma> = 0x5634 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5634_4_def[Qs]

schematic_goal strstart_0_3_0x562a_0x5630_4[blocks]:
  assumes \<open>(P_0x562a_false_4 && P_0x562a_false_4_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5630 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5634_4 ?\<sigma> \<and> block_usage P_0x562a_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x562a_false_4_def P_0x562a_false_4_regions_def post: Q_0x5634_4_def regionset: P_0x562a_false_4_regions_set_def)

definition P_0x5639_false_5 :: state_pred where
  \<open>P_0x5639_false_5 \<sigma> \<equiv> RIP \<sigma> = 0x5639 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5639_false_5_def[Ps]

definition P_0x5639_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5639_false_5_regions_set \<sigma> \<equiv> {
    (0, RSI \<sigma>, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5639_false_5_regions :: state_pred where
  \<open>P_0x5639_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0x5639_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x563b_5 :: state_pred where
  \<open>Q_0x563b_5 \<sigma> \<equiv> RIP \<sigma> = 0x563b \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x563b_5_def[Qs]

schematic_goal strstart_0_1_0x5639_0x5639_5[blocks]:
  assumes \<open>(P_0x5639_false_5 && P_0x5639_false_5_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5639 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x563b_5 ?\<sigma> \<and> block_usage P_0x5639_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5639_false_5_def P_0x5639_false_5_regions_def post: Q_0x563b_5_def regionset: P_0x5639_false_5_regions_set_def)

definition P_0x5650_6 :: state_pred where
  \<open>P_0x5650_6 \<sigma> \<equiv> RIP \<sigma> = 0x5650 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5650_6_def[Ps]

definition P_0x5650_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5650_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5650_6_regions :: state_pred where
  \<open>P_0x5650_6_regions \<sigma> \<equiv> \<exists>regions. P_0x5650_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5652_6 :: state_pred where
  \<open>Q_0x5652_6 \<sigma> \<equiv> RIP \<sigma> = 0x5652 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5652_6_def[Qs]

schematic_goal strstart_0_1_0x5650_0x5650_6[blocks]:
  assumes \<open>(P_0x5650_6 && P_0x5650_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5650 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5652_6 ?\<sigma> \<and> block_usage P_0x5650_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5650_6_def P_0x5650_6_regions_def post: Q_0x5652_6_def regionset: P_0x5650_6_regions_set_def)

definition P_0x5652_7 :: state_pred where
  \<open>P_0x5652_7 \<sigma> \<equiv> RIP \<sigma> = 0x5652 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5652_7_def[Ps]

definition P_0x5652_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5652_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5652_7_regions :: state_pred where
  \<open>P_0x5652_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5652_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_7 :: state_pred where
  \<open>Q_ret_address_7 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_7_def[Qs]

schematic_goal strstart_0_1_0x5652_0x5652_7[blocks]:
  assumes \<open>(P_0x5652_7 && P_0x5652_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5652 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_7 ?\<sigma> \<and> block_usage P_0x5652_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5652_7_def P_0x5652_7_regions_def post: Q_ret_address_7_def regionset: P_0x5652_7_regions_set_def)

definition P_0x563b_8 :: state_pred where
  \<open>P_0x563b_8 \<sigma> \<equiv> RIP \<sigma> = 0x563b \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x563b_8_def[Ps]

definition P_0x563b_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x563b_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x563b_8_regions :: state_pred where
  \<open>P_0x563b_8_regions \<sigma> \<equiv> \<exists>regions. P_0x563b_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5643_8 :: state_pred where
  \<open>Q_0x5643_8 \<sigma> \<equiv> RIP \<sigma> = 0x5643 \<and> RAX \<sigma> = 0x1 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5643_8_def[Qs]

schematic_goal strstart_0_2_0x563b_0x5640_8[blocks]:
  assumes \<open>(P_0x563b_8 && P_0x563b_8_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5640 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5643_8 ?\<sigma> \<and> block_usage P_0x563b_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x563b_8_def P_0x563b_8_regions_def post: Q_0x5643_8_def regionset: P_0x563b_8_regions_set_def)

definition P_0x5643_true_9 :: state_pred where
  \<open>P_0x5643_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x5643 \<and> RAX \<sigma> = 0x1 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5643_true_9_def[Ps]

definition P_0x5643_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5643_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5643_true_9_regions :: state_pred where
  \<open>P_0x5643_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5643_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_9 :: state_pred where
  \<open>Q_ret_address_9 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_9_def[Qs]

schematic_goal strstart_0_2_0x5643_0x5652_9[blocks]:
  assumes \<open>(P_0x5643_true_9 && P_0x5643_true_9_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5652 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_9 ?\<sigma> \<and> block_usage P_0x5643_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5643_true_9_def P_0x5643_true_9_regions_def post: Q_ret_address_9_def regionset: P_0x5643_true_9_regions_set_def)

definition P_0x5643_false_10 :: state_pred where
  \<open>P_0x5643_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x5643 \<and> RAX \<sigma> = 0x1 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5643_false_10_def[Ps]

definition P_0x5643_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5643_false_10_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5643_false_10_regions :: state_pred where
  \<open>P_0x5643_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5643_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_10 :: state_pred where
  \<open>Q_ret_address_10 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_10_def[Qs]

schematic_goal strstart_0_3_0x5643_0x5648_10[blocks]:
  assumes \<open>(P_0x5643_false_10 && P_0x5643_false_10_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5648 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_10 ?\<sigma> \<and> block_usage P_0x5643_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5643_false_10_def P_0x5643_false_10_regions_def post: Q_ret_address_10_def regionset: P_0x5643_false_10_regions_set_def)

definition strstart_acode :: ACode where
  \<open>strstart_acode =
    Block (Suc 0) 0x5620 0;
    WHILE P_0x5634_1 DO
      Block 2 0x5637 (Suc 0);
      IF !ZF THEN
        Block 2 0x5628 2;
        IF !ZF THEN
          Block (Suc 0) 0x562a 3
        ELSE
          Block 3 0x5630 4
        FI
      ELSE
        Block (Suc 0) 0x5639 5
      FI
    OD;
    CASES [
      (P_0x5650_6,
        Block (Suc 0) 0x5650 6;
        Block (Suc 0) 0x5652 7
      ),
      (P_0x563b_8,
        Block 2 0x5640 8;
        IF ZF THEN
          Block 2 0x5652 9
        ELSE
          Block 3 0x5648 10
        FI
      )
    ]
  \<close>

schematic_goal "strstart":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5634 \<longrightarrow> P_0x5634_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5639 \<longrightarrow> P_0x5639_true_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x562a \<longrightarrow> P_0x562a_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x562a \<longrightarrow> P_0x562a_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5639 \<longrightarrow> P_0x5639_false_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5650 \<longrightarrow> P_0x5650_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5652 \<longrightarrow> P_0x5652_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x563b \<longrightarrow> P_0x563b_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5643 \<longrightarrow> P_0x5643_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5643 \<longrightarrow> P_0x5643_false_10_regions \<sigma>\<close>
  shows \<open>{{?P}} strstart_acode {{?Q;?M}}\<close>
  apply (vcg acode: strstart_acode_def assms: assms)
   apply (vcg_while \<open>P_0x5634_1 || P_0x5650_6 || P_0x563b_8\<close> assms: assms)
      apply (vcg_step assms: assms)+
     apply (simp add: pred_logic Ps Qs assms)
    apply (rule htriples)+
       apply (simp only: snd_conv fst_conv)
       apply (vcg_step assms: assms)+
  done

end

locale "stristart" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5660_0 :: state_pred where
  \<open>P_0x5660_0 \<sigma> \<equiv> RIP \<sigma> = 0x5660 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5660_0_def[Ps]

definition P_0x5660_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5660_0_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5660_0_regions :: state_pred where
  \<open>P_0x5660_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5660_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5675_0 :: state_pred where
  \<open>Q_0x5675_0 \<sigma> \<equiv> RIP \<sigma> = 0x5675 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5675_0_def[Qs]

schematic_goal stristart_0_9_0x5660_0x5673_0[blocks]:
  assumes \<open>(P_0x5660_0 && P_0x5660_0_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x5673 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5675_0 ?\<sigma> \<and> block_usage P_0x5660_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5660_0_def P_0x5660_0_regions_def post: Q_0x5675_0_def regionset: P_0x5660_0_regions_set_def)

definition P_0x5675_true_1 :: state_pred where
  \<open>P_0x5675_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x5675 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5675_true_1_def[Ps]

definition P_0x5675_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5675_true_1_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5675_true_1_regions :: state_pred where
  \<open>P_0x5675_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5675_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x56c0_1 :: state_pred where
  \<open>Q_0x56c0_1 \<sigma> \<equiv> RIP \<sigma> = 0x56c0 \<and> RAX \<sigma> = 0x1 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x56c0_1_def[Qs]

schematic_goal stristart_0_3_0x5675_0x56bd_1[blocks]:
  assumes \<open>(P_0x5675_true_1 && P_0x5675_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x56bd (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x56c0_1 ?\<sigma> \<and> block_usage P_0x5675_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5675_true_1_def P_0x5675_true_1_regions_def post: Q_0x56c0_1_def regionset: P_0x5675_true_1_regions_set_def)

definition P_0x56c0_true_2 :: state_pred where
  \<open>P_0x56c0_true_2 \<sigma> \<equiv> RIP \<sigma> = 0x56c0 \<and> RAX \<sigma> = 0x1 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x56c0_true_2_def[Ps]

definition P_0x56c0_true_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56c0_true_2_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x56c0_true_2_regions :: state_pred where
  \<open>P_0x56c0_true_2_regions \<sigma> \<equiv> \<exists>regions. P_0x56c0_true_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_2 :: state_pred where
  \<open>Q_ret_address_2 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_2_def[Qs]

schematic_goal stristart_0_7_0x56c0_0x56b1_2[blocks]:
  assumes \<open>(P_0x56c0_true_2 && P_0x56c0_true_2_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x56b1 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_2 ?\<sigma> \<and> block_usage P_0x56c0_true_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56c0_true_2_def P_0x56c0_true_2_regions_def post: Q_ret_address_2_def regionset: P_0x56c0_true_2_regions_set_def)

definition P_0x56c0_false_3 :: state_pred where
  \<open>P_0x56c0_false_3 \<sigma> \<equiv> RIP \<sigma> = 0x56c0 \<and> RAX \<sigma> = 0x1 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x56c0_false_3_def[Ps]

definition P_0x56c0_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56c0_false_3_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x56c0_false_3_regions :: state_pred where
  \<open>P_0x56c0_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0x56c0_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_3 :: state_pred where
  \<open>Q_ret_address_3 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_3_def[Qs]

schematic_goal stristart_0_8_0x56c0_0x56d0_3[blocks]:
  assumes \<open>(P_0x56c0_false_3 && P_0x56c0_false_3_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x56d0 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_3 ?\<sigma> \<and> block_usage P_0x56c0_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56c0_false_3_def P_0x56c0_false_3_regions_def post: Q_ret_address_3_def regionset: P_0x56c0_false_3_regions_set_def)

definition P_0x5675_false_4 :: state_pred where
  \<open>P_0x5675_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x5675 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5675_false_4_def[Ps]

definition P_0x5675_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5675_false_4_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5675_false_4_regions :: state_pred where
  \<open>P_0x5675_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x5675_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x567a_4 :: state_pred where
  \<open>Q_0x567a_4 \<sigma> \<equiv> RIP \<sigma> = 0x567a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x567a_4_def[Qs]

schematic_goal stristart_0_2_0x5675_0x5677_4[blocks]:
  assumes \<open>(P_0x5675_false_4 && P_0x5675_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5677 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x567a_4 ?\<sigma> \<and> block_usage P_0x5675_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5675_false_4_def P_0x5675_false_4_regions_def post: Q_0x567a_4_def regionset: P_0x5675_false_4_regions_set_def)

definition P_0x567a_5 :: state_pred where
  \<open>P_0x567a_5 \<sigma> \<equiv> RIP \<sigma> = 0x567a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x567a_5_def[Ps]

definition P_0x567a_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x567a_5_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x567a_5_regions :: state_pred where
  \<open>P_0x567a_5_regions \<sigma> \<equiv> \<exists>regions. P_0x567a_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ctype_toupper_loc_addr_0x567a_5 :: state_pred where
  \<open>Q_ctype_toupper_loc_addr_0x567a_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = ctype_toupper_loc_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f\<close>
declare Q_ctype_toupper_loc_addr_0x567a_5_def[Qs]

schematic_goal stristart_0_1_0x567a_0x567a_5[blocks]:
  assumes \<open>(P_0x567a_5 && P_0x567a_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x567a 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ctype_toupper_loc_addr_0x567a_5 ?\<sigma> \<and> block_usage P_0x567a_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x567a_5_def P_0x567a_5_regions_def post: Q_ctype_toupper_loc_addr_0x567a_5_def regionset: P_0x567a_5_regions_set_def)

definition P_0x567f_6 :: state_pred where
  \<open>P_0x567f_6 \<sigma> \<equiv> RIP \<sigma> = 0x567f \<and> RAX \<sigma> = ctype_toupper_loc_0x567a_retval \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f\<close>
declare P_0x567f_6_def[Ps]

definition P_0x567f_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x567f_6_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x567f_6_regions :: state_pred where
  \<open>P_0x567f_6_regions \<sigma> \<equiv> \<exists>regions. P_0x567f_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5698_6 :: state_pred where
  \<open>Q_0x5698_6 \<sigma> \<equiv> RIP \<sigma> = 0x5698 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare Q_0x5698_6_def[Qs]

schematic_goal stristart_0_2_0x567f_0x5682_6[blocks]:
  assumes \<open>(P_0x567f_6 && P_0x567f_6_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5682 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5698_6 ?\<sigma> \<and> block_usage P_0x567f_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x567f_6_def P_0x567f_6_regions_def post: Q_0x5698_6_def regionset: P_0x567f_6_regions_set_def)

definition P_0x5698_7 :: state_pred where
  \<open>P_0x5698_7 \<sigma> \<equiv> RIP \<sigma> = 0x5698 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare P_0x5698_7_def[Ps]

definition P_0x5698_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5698_7_regions_set \<sigma> \<equiv> {
    (0, R12 \<sigma>, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, (((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)), 4),
    (4, (((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x5698_7_regions :: state_pred where
  \<open>P_0x5698_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5698_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x56a3_7 :: state_pred where
  \<open>Q_0x56a3_7 \<sigma> \<equiv> RIP \<sigma> = 0x56a3 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare Q_0x56a3_7_def[Qs]

schematic_goal stristart_0_3_0x5698_0x56a0_7[blocks]:
  assumes \<open>(P_0x5698_7 && P_0x5698_7_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x56a0 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x56a3_7 ?\<sigma> \<and> block_usage P_0x5698_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5698_7_def P_0x5698_7_regions_def post: Q_0x56a3_7_def regionset: P_0x5698_7_regions_set_def)

definition P_0x56a3_true_8 :: state_pred where
  \<open>P_0x56a3_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x56a3 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare P_0x56a3_true_8_def[Ps]

definition P_0x56a3_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56a3_true_8_regions_set \<sigma> \<equiv> {
    (0, R12 \<sigma>, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RBP \<sigma>::64 word) + 0x1), Suc 0),
    (4, (((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)), 4),
    (5, (((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x56a3_true_8_regions :: state_pred where
  \<open>P_0x56a3_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x56a3_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5696_8 :: state_pred where
  \<open>Q_0x5696_8 \<sigma> \<equiv> RIP \<sigma> = 0x5696 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare Q_0x5696_8_def[Qs]

schematic_goal stristart_0_5_0x56a3_0x5694_8[blocks]:
  assumes \<open>(P_0x56a3_true_8 && P_0x56a3_true_8_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x5694 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5696_8 ?\<sigma> \<and> block_usage P_0x56a3_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56a3_true_8_def P_0x56a3_true_8_regions_def post: Q_0x5696_8_def regionset: P_0x56a3_true_8_regions_set_def)

definition P_0x5696_true_9 :: state_pred where
  \<open>P_0x5696_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x5696 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare P_0x5696_true_9_def[Ps]

definition P_0x5696_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5696_true_9_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x5696_true_9_regions :: state_pred where
  \<open>P_0x5696_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5696_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x56b8_9 :: state_pred where
  \<open>Q_0x56b8_9 \<sigma> \<equiv> RIP \<sigma> = 0x56b8 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare Q_0x56b8_9_def[Qs]

schematic_goal stristart_0_1_0x5696_0x5696_9[blocks]:
  assumes \<open>(P_0x5696_true_9 && P_0x5696_true_9_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5696 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x56b8_9 ?\<sigma> \<and> block_usage P_0x5696_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5696_true_9_def P_0x5696_true_9_regions_def post: Q_0x56b8_9_def regionset: P_0x5696_true_9_regions_set_def)

definition P_0x5696_false_10 :: state_pred where
  \<open>P_0x5696_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x5696 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare P_0x5696_false_10_def[Ps]

definition P_0x5696_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5696_false_10_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x5696_false_10_regions :: state_pred where
  \<open>P_0x5696_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5696_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5698_10 :: state_pred where
  \<open>Q_0x5698_10 \<sigma> \<equiv> RIP \<sigma> = 0x5698 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare Q_0x5698_10_def[Qs]

schematic_goal stristart_0_1_0x5696_0x5696_10[blocks]:
  assumes \<open>(P_0x5696_false_10 && P_0x5696_false_10_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5696 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5698_10 ?\<sigma> \<and> block_usage P_0x5696_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5696_false_10_def P_0x5696_false_10_regions_def post: Q_0x5698_10_def regionset: P_0x5696_false_10_regions_set_def)

definition P_0x56a3_false_11 :: state_pred where
  \<open>P_0x56a3_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x56a3 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word) = ucast ((\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare P_0x56a3_false_11_def[Ps]

definition P_0x56a3_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56a3_false_11_regions_set \<sigma> \<equiv> {
    (0, R12 \<sigma>, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, (((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word)), 4),
    (4, (((\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[R12 \<sigma>,1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x56a3_false_11_regions :: state_pred where
  \<open>P_0x56a3_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x56a3_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x56a5_11 :: state_pred where
  \<open>Q_0x56a5_11 \<sigma> \<equiv> RIP \<sigma> = 0x56a5 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare Q_0x56a5_11_def[Qs]

schematic_goal stristart_0_1_0x56a3_0x56a3_11[blocks]:
  assumes \<open>(P_0x56a3_false_11 && P_0x56a3_false_11_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x56a3 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x56a5_11 ?\<sigma> \<and> block_usage P_0x56a3_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56a3_false_11_def P_0x56a3_false_11_regions_def post: Q_0x56a5_11_def regionset: P_0x56a3_false_11_regions_set_def)

definition P_0x56b8_12 :: state_pred where
  \<open>P_0x56b8_12 \<sigma> \<equiv> RIP \<sigma> = 0x56b8 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare P_0x56b8_12_def[Ps]

definition P_0x56b8_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56b8_12_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x56b8_12_regions :: state_pred where
  \<open>P_0x56b8_12_regions \<sigma> \<equiv> \<exists>regions. P_0x56b8_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x56c0_12 :: state_pred where
  \<open>Q_0x56c0_12 \<sigma> \<equiv> RIP \<sigma> = 0x56c0 \<and> RAX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare Q_0x56c0_12_def[Qs]

schematic_goal stristart_0_2_0x56b8_0x56bd_12[blocks]:
  assumes \<open>(P_0x56b8_12 && P_0x56b8_12_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x56bd 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x56c0_12 ?\<sigma> \<and> block_usage P_0x56b8_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56b8_12_def P_0x56b8_12_regions_def post: Q_0x56c0_12_def regionset: P_0x56b8_12_regions_set_def)

definition P_0x56c0_true_13 :: state_pred where
  \<open>P_0x56c0_true_13 \<sigma> \<equiv> RIP \<sigma> = 0x56c0 \<and> RAX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare P_0x56c0_true_13_def[Ps]

definition P_0x56c0_true_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56c0_true_13_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x56c0_true_13_regions :: state_pred where
  \<open>P_0x56c0_true_13_regions \<sigma> \<equiv> \<exists>regions. P_0x56c0_true_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_13 :: state_pred where
  \<open>Q_ret_address_13 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_13_def[Qs]

schematic_goal stristart_0_7_0x56c0_0x56b1_13[blocks]:
  assumes \<open>(P_0x56c0_true_13 && P_0x56c0_true_13_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x56b1 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_13 ?\<sigma> \<and> block_usage P_0x56c0_true_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56c0_true_13_def P_0x56c0_true_13_regions_def post: Q_ret_address_13_def regionset: P_0x56c0_true_13_regions_set_def)

definition P_0x56c0_false_14 :: state_pred where
  \<open>P_0x56c0_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x56c0 \<and> RAX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare P_0x56c0_false_14_def[Ps]

definition P_0x56c0_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56c0_false_14_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x56c0_false_14_regions :: state_pred where
  \<open>P_0x56c0_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x56c0_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_14 :: state_pred where
  \<open>Q_ret_address_14 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_14_def[Qs]

schematic_goal stristart_0_8_0x56c0_0x56d0_14[blocks]:
  assumes \<open>(P_0x56c0_false_14 && P_0x56c0_false_14_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x56d0 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_14 ?\<sigma> \<and> block_usage P_0x56c0_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56c0_false_14_def P_0x56c0_false_14_regions_def post: Q_ret_address_14_def regionset: P_0x56c0_false_14_regions_set_def)

definition P_0x56a5_15 :: state_pred where
  \<open>P_0x56a5_15 \<sigma> \<equiv> RIP \<sigma> = 0x56a5 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare P_0x56a5_15_def[Ps]

definition P_0x56a5_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56a5_15_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x56a5_15_regions :: state_pred where
  \<open>P_0x56a5_15_regions \<sigma> \<equiv> \<exists>regions. P_0x56a5_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x56a7_15 :: state_pred where
  \<open>Q_0x56a7_15 \<sigma> \<equiv> RIP \<sigma> = 0x56a7 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare Q_0x56a7_15_def[Qs]

schematic_goal stristart_0_1_0x56a5_0x56a5_15[blocks]:
  assumes \<open>(P_0x56a5_15 && P_0x56a5_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x56a5 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x56a7_15 ?\<sigma> \<and> block_usage P_0x56a5_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56a5_15_def P_0x56a5_15_regions_def post: Q_0x56a7_15_def regionset: P_0x56a5_15_regions_set_def)

definition P_0x56a7_16 :: state_pred where
  \<open>P_0x56a7_16 \<sigma> \<equiv> RIP \<sigma> = 0x56a7 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x567f \<and> (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word) = (\<sigma> \<turnstile> *[ctype_toupper_loc_0x567a_retval,8]::64 word)\<close>
declare P_0x56a7_16_def[Ps]

definition P_0x56a7_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56a7_16_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ctype_toupper_loc_0x567a_retval, 8)
  }\<close>

definition P_0x56a7_16_regions :: state_pred where
  \<open>P_0x56a7_16_regions \<sigma> \<equiv> \<exists>regions. P_0x56a7_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_16 :: state_pred where
  \<open>Q_ret_address_16 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_16_def[Qs]

schematic_goal stristart_0_6_0x56a7_0x56b1_16[blocks]:
  assumes \<open>(P_0x56a7_16 && P_0x56a7_16_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x56b1 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_16 ?\<sigma> \<and> block_usage P_0x56a7_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56a7_16_def P_0x56a7_16_regions_def post: Q_ret_address_16_def regionset: P_0x56a7_16_regions_set_def)

definition stristart_acode :: ACode where
  \<open>stristart_acode =
    Block 9 0x5673 0;
    IF ZF THEN
      Block 3 0x56bd (Suc 0);
      IF ZF THEN
        Block 7 0x56b1 2
      ELSE
        Block 8 0x56d0 3
      FI
    ELSE
      Block 2 0x5677 4;
      Block (Suc 0) 0x567a 5;
      CALL ctype_toupper_loc_acode;
      Block 2 0x5682 6;
      WHILE P_0x5698_7 DO
        Block 3 0x56a0 7;
        IF ZF THEN
          Block 5 0x5694 8;
          IF ZF THEN
            Block (Suc 0) 0x5696 9
          ELSE
            Block (Suc 0) 0x5696 10
          FI
        ELSE
          Block (Suc 0) 0x56a3 11
        FI
      OD;
      CASES [
        (P_0x56b8_12,
          Block 2 0x56bd 12;
          IF ZF THEN
            Block 7 0x56b1 13
          ELSE
            Block 8 0x56d0 14
          FI
        ),
        (P_0x56a5_15,
          Block (Suc 0) 0x56a5 15;
          Block 6 0x56b1 16
        )
      ]
    FI
  \<close>

schematic_goal "stristart":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5675 \<longrightarrow> P_0x5675_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56c0 \<longrightarrow> P_0x56c0_true_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56c0 \<longrightarrow> P_0x56c0_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5675 \<longrightarrow> P_0x5675_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x567a \<longrightarrow> P_0x567a_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x567f \<longrightarrow> P_0x567f_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5698 \<longrightarrow> P_0x5698_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56a3 \<longrightarrow> P_0x56a3_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5696 \<longrightarrow> P_0x5696_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5696 \<longrightarrow> P_0x5696_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56a3 \<longrightarrow> P_0x56a3_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56b8 \<longrightarrow> P_0x56b8_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56c0 \<longrightarrow> P_0x56c0_true_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56c0 \<longrightarrow> P_0x56c0_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56a5 \<longrightarrow> P_0x56a5_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56a7 \<longrightarrow> P_0x56a7_16_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_ctype_toupper_loc_addr_0x567a_5}} \<box>ctype_toupper_loc_acode {{P_0x567f_6;M_0x567a}}\<close>
  shows \<open>{{?P}} stristart_acode {{?Q;?M}}\<close>
  apply (vcg acode: stristart_acode_def assms: assms)
         apply (vcg_while \<open>P_0x5698_7 || P_0x56b8_12 || P_0x56a5_15\<close> assms: assms)
            apply (vcg_step assms: assms)+
           apply (simp add: pred_logic Ps Qs assms)
          apply (rule htriples)+
             apply (simp only: snd_conv fst_conv)
             apply (vcg_step assms: assms)+
  done

end

end
