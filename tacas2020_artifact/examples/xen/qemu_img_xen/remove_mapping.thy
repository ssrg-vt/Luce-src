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
theory remove_mapping
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes array_remove_0xbc4c_retval\<^sub>v free_0xbcf4_retval\<^sub>v assert_fail_0xbd18_retval\<^sub>v assert_fail_addr array_remove_addr free_addr :: \<open>64 word\<close>
    and assert_fail_acode array_remove_acode free_acode :: ACode
  assumes fetch:
    "fetch 0xbc10 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xbc12 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xbc13 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xbc14 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32844))))), 6)"
    "fetch 0xbc1a \<equiv> (Unary (IS_8088 Jae) (Immediate SixtyFour (ImmVal 48382)), 6)"
    "fetch 0xbc20 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0xbc22 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32848))))), 7)"
    "fetch 0xbc29 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0xbc2c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0xbc2e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32832))))), 7)"
    "fetch 0xbc35 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xbc38 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 12))))), 3)"
    "fetch 0xbc3b \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xbc3d \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 48368)), 6)"
    "fetch 0xbc43 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32832)))), 7)"
    "fetch 0xbc4a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0xbc4c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''array_remove'')), 5)"
    "fetch 0xbc51 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32844))))), 6)"
    "fetch 0xbc57 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xbc59 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 48285)), 2)"
    "fetch 0xbc5b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xbc5d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0xbc60 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xbc62 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32848))))), 7)"
    "fetch 0xbc69 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32832))))), 7)"
    "fetch 0xbc70 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 12))))), 3)"
    "fetch 0xbc73 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0xbc75 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 48253)), 2)"
    "fetch 0xbc77 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0xbc7a \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 12)))) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0xbc7d \<equiv> (Binary (IS_8088 Test) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 32)))) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0xbc81 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 48272)), 2)"
    "fetch 0xbc83 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 16))))), 3)"
    "fetch 0xbc86 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0xbc88 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 48272)), 2)"
    "fetch 0xbc8a \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0xbc8d \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 16)))) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0xbc90 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32844))))), 6)"
    "fetch 0xbc96 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0xbc99 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xbc9b \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 48224)), 2)"
    "fetch 0xbc9d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32896))))), 7)"
    "fetch 0xbca4 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xbca7 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 48351)), 2)"
    "fetch 0xbca9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32832))))), 7)"
    "fetch 0xbcb0 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xbcb3 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 48351)), 2)"
    "fetch 0xbcb5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 14757395258967641293)), 10)"
    "fetch 0xbcbf \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xbcc2 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0xbcc6 \<equiv> (Binary (IS_8088 Imul) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rsi))), 4)"
    "fetch 0xbcca \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xbccc \<equiv> (Unary (IS_8088 Jae) (Immediate SixtyFour (ImmVal 48382)), 2)"
    "fetch 0xbcce \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32848))))), 7)"
    "fetch 0xbcd5 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0xbcd8 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32896)))) (Storage (Reg (General SixtyFour rdx))), 7)"
    "fetch 0xbcdf \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xbce0 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xbce2 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xbce3 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xbce5 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xbce6 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0xbcf0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 24))))), 4)"
    "fetch 0xbcf4 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''free'')), 5)"
    "fetch 0xbcf9 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 48195)), 5)"
    "fetch 0xbcfe \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 87915)))), 7)"
    "fetch 0xbd05 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 96)), 5)"
    "fetch 0xbd0a \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 85461)))), 7)"
    "fetch 0xbd11 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 85507)))), 7)"
    "fetch 0xbd18 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and assert_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__assert_fail'') = assert_fail_addr\<close>
    and array_remove\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''array_remove'') = array_remove_addr\<close>
    and free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''free'') = free_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>array_remove_0xbc4c_retval \<equiv> array_remove_0xbc4c_retval\<^sub>v\<close>
definition \<open>free_0xbcf4_retval \<equiv> free_0xbcf4_retval\<^sub>v\<close>
definition \<open>assert_fail_0xbd18_retval \<equiv> assert_fail_0xbd18_retval\<^sub>v\<close>

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

locale "remove_mapping" = "qemu_img_xen" +
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

definition P_0xbc10_0 :: state_pred where
  \<open>P_0xbc10_0 \<sigma> \<equiv> RIP \<sigma> = 0xbc10 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0xbc10_0_def[Ps]

definition P_0xbc10_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc10_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xbc10_0_regions :: state_pred where
  \<open>P_0xbc10_0_regions \<sigma> \<equiv> \<exists>regions. P_0xbc10_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc1a_0 :: state_pred where
  \<open>Q_0xbc1a_0 \<sigma> \<equiv> RIP \<sigma> = 0xbc1a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbc1a_0_def[Qs]

schematic_goal remove_mapping_0_4_0xbc10_0xbc14_0[blocks]:
  assumes \<open>(P_0xbc10_0 && P_0xbc10_0_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0xbc14 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc1a_0 ?\<sigma> \<and> block_usage P_0xbc10_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc10_0_def P_0xbc10_0_regions_def post: Q_0xbc1a_0_def regionset: P_0xbc10_0_regions_set_def)

definition P_0xbc1a_true_1 :: state_pred where
  \<open>P_0xbc1a_true_1 \<sigma> \<equiv> RIP \<sigma> = 0xbc1a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbc1a_true_1_def[Ps]

definition P_0xbc1a_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc1a_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xbc1a_true_1_regions :: state_pred where
  \<open>P_0xbc1a_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0xbc1a_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbd18_1 :: state_pred where
  \<open>Q_0xbd18_1 \<sigma> \<equiv> RIP \<sigma> = 0xbd18 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x21470 \<and> RDX \<sigma> = 0x60 \<and> RDI \<sigma> = 0x20b1b \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbd18_1_def[Qs]

schematic_goal remove_mapping_0_5_0xbc1a_0xbd11_1[blocks]:
  assumes \<open>(P_0xbc1a_true_1 && P_0xbc1a_true_1_regions && !CF) \<sigma>\<close>
  shows \<open>exec_block 5 0xbd11 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbd18_1 ?\<sigma> \<and> block_usage P_0xbc1a_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc1a_true_1_def P_0xbc1a_true_1_regions_def post: Q_0xbd18_1_def regionset: P_0xbc1a_true_1_regions_set_def)

definition P_0xbd18_2 :: state_pred where
  \<open>P_0xbd18_2 \<sigma> \<equiv> RIP \<sigma> = 0xbd18 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x21470 \<and> RDX \<sigma> = 0x60 \<and> RDI \<sigma> = 0x20b1b \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbd18_2_def[Ps]

definition P_0xbd18_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbd18_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbd18_2_regions :: state_pred where
  \<open>P_0xbd18_2_regions \<sigma> \<equiv> \<exists>regions. P_0xbd18_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xbd18_2 :: state_pred where
  \<open>Q_assert_fail_addr_0xbd18_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = assert_fail_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_assert_fail_addr_0xbd18_2_def[Qs]

schematic_goal remove_mapping_0_1_0xbd18_0xbd18_2[blocks]:
  assumes \<open>(P_0xbd18_2 && P_0xbd18_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbd18 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xbd18_2 ?\<sigma> \<and> block_usage P_0xbd18_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbd18_2_def P_0xbd18_2_regions_def post: Q_assert_fail_addr_0xbd18_2_def regionset: P_0xbd18_2_regions_set_def)

definition P_0xbc1a_false_3 :: state_pred where
  \<open>P_0xbc1a_false_3 \<sigma> \<equiv> RIP \<sigma> = 0xbc1a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbc1a_false_3_def[Ps]

definition P_0xbc1a_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc1a_false_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xbc1a_false_3_regions :: state_pred where
  \<open>P_0xbc1a_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0xbc1a_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc3d_3 :: state_pred where
  \<open>Q_0xbc3d_3 \<sigma> \<equiv> RIP \<sigma> = 0xbc3d \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbc3d_3_def[Qs]

schematic_goal remove_mapping_0_9_0xbc1a_0xbc3b_3[blocks]:
  assumes \<open>(P_0xbc1a_false_3 && P_0xbc1a_false_3_regions && ! !CF) \<sigma>\<close>
  shows \<open>exec_block 9 0xbc3b 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc3d_3 ?\<sigma> \<and> block_usage P_0xbc1a_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc1a_false_3_def P_0xbc1a_false_3_regions_def post: Q_0xbc3d_3_def regionset: P_0xbc1a_false_3_regions_set_def)

definition P_0xbc3d_true_4 :: state_pred where
  \<open>P_0xbc3d_true_4 \<sigma> \<equiv> RIP \<sigma> = 0xbc3d \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbc3d_true_4_def[Ps]

definition P_0xbc3d_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc3d_true_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xbc3d_true_4_regions :: state_pred where
  \<open>P_0xbc3d_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0xbc3d_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbcf4_4 :: state_pred where
  \<open>Q_0xbcf4_4 \<sigma> \<equiv> RIP \<sigma> = 0xbcf4 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbcf4_4_def[Qs]

schematic_goal remove_mapping_0_2_0xbc3d_0xbcf0_4[blocks]:
  assumes \<open>(P_0xbc3d_true_4 && P_0xbc3d_true_4_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 2 0xbcf0 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbcf4_4 ?\<sigma> \<and> block_usage P_0xbc3d_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc3d_true_4_def P_0xbc3d_true_4_regions_def post: Q_0xbcf4_4_def regionset: P_0xbc3d_true_4_regions_set_def)

definition P_0xbcf4_5 :: state_pred where
  \<open>P_0xbcf4_5 \<sigma> \<equiv> RIP \<sigma> = 0xbcf4 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbcf4_5_def[Ps]

definition P_0xbcf4_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbcf4_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbcf4_5_regions :: state_pred where
  \<open>P_0xbcf4_5_regions \<sigma> \<equiv> \<exists>regions. P_0xbcf4_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_free_addr_0xbcf4_5 :: state_pred where
  \<open>Q_free_addr_0xbcf4_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = free_addr \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbcf9\<close>
declare Q_free_addr_0xbcf4_5_def[Qs]

schematic_goal remove_mapping_0_1_0xbcf4_0xbcf4_5[blocks]:
  assumes \<open>(P_0xbcf4_5 && P_0xbcf4_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbcf4 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_free_addr_0xbcf4_5 ?\<sigma> \<and> block_usage P_0xbcf4_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbcf4_5_def P_0xbcf4_5_regions_def post: Q_free_addr_0xbcf4_5_def regionset: P_0xbcf4_5_regions_set_def)

definition P_0xbcf9_6 :: state_pred where
  \<open>P_0xbcf9_6 \<sigma> \<equiv> RIP \<sigma> = 0xbcf9 \<and> RAX \<sigma> = free_0xbcf4_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbcf9\<close>
declare P_0xbcf9_6_def[Ps]

definition P_0xbcf9_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbcf9_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbcf9_6_regions :: state_pred where
  \<open>P_0xbcf9_6_regions \<sigma> \<equiv> \<exists>regions. P_0xbcf9_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc43_6 :: state_pred where
  \<open>Q_0xbc43_6 \<sigma> \<equiv> RIP \<sigma> = 0xbc43 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbc43_6_def[Qs]

schematic_goal remove_mapping_0_1_0xbcf9_0xbcf9_6[blocks]:
  assumes \<open>(P_0xbcf9_6 && P_0xbcf9_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbcf9 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc43_6 ?\<sigma> \<and> block_usage P_0xbcf9_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbcf9_6_def P_0xbcf9_6_regions_def post: Q_0xbc43_6_def regionset: P_0xbcf9_6_regions_set_def)

definition P_0xbc3d_false_7 :: state_pred where
  \<open>P_0xbc3d_false_7 \<sigma> \<equiv> RIP \<sigma> = 0xbc3d \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbc3d_false_7_def[Ps]

definition P_0xbc3d_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc3d_false_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xbc3d_false_7_regions :: state_pred where
  \<open>P_0xbc3d_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0xbc3d_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc43_7 :: state_pred where
  \<open>Q_0xbc43_7 \<sigma> \<equiv> RIP \<sigma> = 0xbc43 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbc43_7_def[Qs]

schematic_goal remove_mapping_0_1_0xbc3d_0xbc3d_7[blocks]:
  assumes \<open>(P_0xbc3d_false_7 && P_0xbc3d_false_7_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbc3d 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc43_7 ?\<sigma> \<and> block_usage P_0xbc3d_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc3d_false_7_def P_0xbc3d_false_7_regions_def post: Q_0xbc43_7_def regionset: P_0xbc3d_false_7_regions_set_def)

definition P_0xbc43_8 :: state_pred where
  \<open>P_0xbc43_8 \<sigma> \<equiv> RIP \<sigma> = 0xbc43 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbc43_8_def[Ps]

definition P_0xbc43_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc43_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xbc43_8_regions :: state_pred where
  \<open>P_0xbc43_8_regions \<sigma> \<equiv> \<exists>regions. P_0xbc43_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc4c_8 :: state_pred where
  \<open>Q_0xbc4c_8 \<sigma> \<equiv> RIP \<sigma> = 0xbc4c \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbc4c_8_def[Qs]

schematic_goal remove_mapping_0_2_0xbc43_0xbc4a_8[blocks]:
  assumes \<open>(P_0xbc43_8 && P_0xbc43_8_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xbc4a 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc4c_8 ?\<sigma> \<and> block_usage P_0xbc43_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc43_8_def P_0xbc43_8_regions_def post: Q_0xbc4c_8_def regionset: P_0xbc43_8_regions_set_def)

definition P_0xbc4c_9 :: state_pred where
  \<open>P_0xbc4c_9 \<sigma> \<equiv> RIP \<sigma> = 0xbc4c \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbc4c_9_def[Ps]

definition P_0xbc4c_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc4c_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc4c_9_regions :: state_pred where
  \<open>P_0xbc4c_9_regions \<sigma> \<equiv> \<exists>regions. P_0xbc4c_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_array_remove_addr_0xbc4c_9 :: state_pred where
  \<open>Q_array_remove_addr_0xbc4c_9 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = array_remove_addr \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_array_remove_addr_0xbc4c_9_def[Qs]

schematic_goal remove_mapping_0_1_0xbc4c_0xbc4c_9[blocks]:
  assumes \<open>(P_0xbc4c_9 && P_0xbc4c_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbc4c 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_array_remove_addr_0xbc4c_9 ?\<sigma> \<and> block_usage P_0xbc4c_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc4c_9_def P_0xbc4c_9_regions_def post: Q_array_remove_addr_0xbc4c_9_def regionset: P_0xbc4c_9_regions_set_def)

definition P_0xbc51_10 :: state_pred where
  \<open>P_0xbc51_10 \<sigma> \<equiv> RIP \<sigma> = 0xbc51 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc51_10_def[Ps]

definition P_0xbc51_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc51_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc51_10_regions :: state_pred where
  \<open>P_0xbc51_10_regions \<sigma> \<equiv> \<exists>regions. P_0xbc51_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc59_10 :: state_pred where
  \<open>Q_0xbc59_10 \<sigma> \<equiv> RIP \<sigma> = 0xbc59 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc59_10_def[Qs]

schematic_goal remove_mapping_0_2_0xbc51_0xbc57_10[blocks]:
  assumes \<open>(P_0xbc51_10 && P_0xbc51_10_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xbc57 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc59_10 ?\<sigma> \<and> block_usage P_0xbc51_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc51_10_def P_0xbc51_10_regions_def post: Q_0xbc59_10_def regionset: P_0xbc51_10_regions_set_def)

definition P_0xbc59_true_11 :: state_pred where
  \<open>P_0xbc59_true_11 \<sigma> \<equiv> RIP \<sigma> = 0xbc59 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc59_true_11_def[Ps]

definition P_0xbc59_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc59_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc59_true_11_regions :: state_pred where
  \<open>P_0xbc59_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0xbc59_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc9d_11 :: state_pred where
  \<open>Q_0xbc9d_11 \<sigma> \<equiv> RIP \<sigma> = 0xbc9d \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc9d_11_def[Qs]

schematic_goal remove_mapping_0_1_0xbc59_0xbc59_11[blocks]:
  assumes \<open>(P_0xbc59_true_11 && P_0xbc59_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbc59 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc9d_11 ?\<sigma> \<and> block_usage P_0xbc59_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc59_true_11_def P_0xbc59_true_11_regions_def post: Q_0xbc9d_11_def regionset: P_0xbc59_true_11_regions_set_def)

definition P_0xbc59_false_12 :: state_pred where
  \<open>P_0xbc59_false_12 \<sigma> \<equiv> RIP \<sigma> = 0xbc59 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc59_false_12_def[Ps]

definition P_0xbc59_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc59_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc59_false_12_regions :: state_pred where
  \<open>P_0xbc59_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0xbc59_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc60_12 :: state_pred where
  \<open>Q_0xbc60_12 \<sigma> \<equiv> RIP \<sigma> = 0xbc60 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc60_12_def[Qs]

schematic_goal remove_mapping_0_3_0xbc59_0xbc5d_12[blocks]:
  assumes \<open>(P_0xbc59_false_12 && P_0xbc59_false_12_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xbc5d 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc60_12 ?\<sigma> \<and> block_usage P_0xbc59_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc59_false_12_def P_0xbc59_false_12_regions_def post: Q_0xbc60_12_def regionset: P_0xbc59_false_12_regions_set_def)

definition P_0xbc60_13 :: state_pred where
  \<open>P_0xbc60_13 \<sigma> \<equiv> RIP \<sigma> = 0xbc60 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc60_13_def[Ps]

definition P_0xbc60_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc60_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc60_13_regions :: state_pred where
  \<open>P_0xbc60_13_regions \<sigma> \<equiv> \<exists>regions. P_0xbc60_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc75_13 :: state_pred where
  \<open>Q_0xbc75_13 \<sigma> \<equiv> RIP \<sigma> = 0xbc75 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc75_13_def[Qs]

schematic_goal remove_mapping_0_5_0xbc60_0xbc73_13[blocks]:
  assumes \<open>(P_0xbc60_13 && P_0xbc60_13_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xbc73 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc75_13 ?\<sigma> \<and> block_usage P_0xbc60_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc60_13_def P_0xbc60_13_regions_def post: Q_0xbc75_13_def regionset: P_0xbc60_13_regions_set_def)

definition P_0xbc75_true_14 :: state_pred where
  \<open>P_0xbc75_true_14 \<sigma> \<equiv> RIP \<sigma> = 0xbc75 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc75_true_14_def[Ps]

definition P_0xbc75_true_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc75_true_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc75_true_14_regions :: state_pred where
  \<open>P_0xbc75_true_14_regions \<sigma> \<equiv> \<exists>regions. P_0xbc75_true_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc7d_14 :: state_pred where
  \<open>Q_0xbc7d_14 \<sigma> \<equiv> RIP \<sigma> = 0xbc7d \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc7d_14_def[Qs]

schematic_goal remove_mapping_0_1_0xbc75_0xbc75_14[blocks]:
  assumes \<open>(P_0xbc75_true_14 && P_0xbc75_true_14_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbc75 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc7d_14 ?\<sigma> \<and> block_usage P_0xbc75_true_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc75_true_14_def P_0xbc75_true_14_regions_def post: Q_0xbc7d_14_def regionset: P_0xbc75_true_14_regions_set_def)

definition P_0xbc75_false_15 :: state_pred where
  \<open>P_0xbc75_false_15 \<sigma> \<equiv> RIP \<sigma> = 0xbc75 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc75_false_15_def[Ps]

definition P_0xbc75_false_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc75_false_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc75_false_15_regions :: state_pred where
  \<open>P_0xbc75_false_15_regions \<sigma> \<equiv> \<exists>regions. P_0xbc75_false_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc7d_15 :: state_pred where
  \<open>Q_0xbc7d_15 \<sigma> \<equiv> RIP \<sigma> = 0xbc7d \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc7d_15_def[Qs]

schematic_goal remove_mapping_0_3_0xbc75_0xbc7a_15[blocks]:
  assumes \<open>(P_0xbc75_false_15 && P_0xbc75_false_15_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 3 0xbc7a 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc7d_15 ?\<sigma> \<and> block_usage P_0xbc75_false_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc75_false_15_def P_0xbc75_false_15_regions_def post: Q_0xbc7d_15_def regionset: P_0xbc75_false_15_regions_set_def)

definition P_0xbc7d_16 :: state_pred where
  \<open>P_0xbc7d_16 \<sigma> \<equiv> RIP \<sigma> = 0xbc7d \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc7d_16_def[Ps]

definition P_0xbc7d_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc7d_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc7d_16_regions :: state_pred where
  \<open>P_0xbc7d_16_regions \<sigma> \<equiv> \<exists>regions. P_0xbc7d_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc81_16 :: state_pred where
  \<open>Q_0xbc81_16 \<sigma> \<equiv> RIP \<sigma> = 0xbc81 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc81_16_def[Qs]

schematic_goal remove_mapping_0_1_0xbc7d_0xbc7d_16[blocks]:
  assumes \<open>(P_0xbc7d_16 && P_0xbc7d_16_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbc7d 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc81_16 ?\<sigma> \<and> block_usage P_0xbc7d_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc7d_16_def P_0xbc7d_16_regions_def post: Q_0xbc81_16_def regionset: P_0xbc7d_16_regions_set_def)

definition P_0xbc81_true_17 :: state_pred where
  \<open>P_0xbc81_true_17 \<sigma> \<equiv> RIP \<sigma> = 0xbc81 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc81_true_17_def[Ps]

definition P_0xbc81_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc81_true_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc81_true_17_regions :: state_pred where
  \<open>P_0xbc81_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0xbc81_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc90_17 :: state_pred where
  \<open>Q_0xbc90_17 \<sigma> \<equiv> RIP \<sigma> = 0xbc90 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc90_17_def[Qs]

schematic_goal remove_mapping_0_1_0xbc81_0xbc81_17[blocks]:
  assumes \<open>(P_0xbc81_true_17 && P_0xbc81_true_17_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbc81 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc90_17 ?\<sigma> \<and> block_usage P_0xbc81_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc81_true_17_def P_0xbc81_true_17_regions_def post: Q_0xbc90_17_def regionset: P_0xbc81_true_17_regions_set_def)

definition P_0xbc81_false_18 :: state_pred where
  \<open>P_0xbc81_false_18 \<sigma> \<equiv> RIP \<sigma> = 0xbc81 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc81_false_18_def[Ps]

definition P_0xbc81_false_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc81_false_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0),
    (6, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc81_false_18_regions :: state_pred where
  \<open>P_0xbc81_false_18_regions \<sigma> \<equiv> \<exists>regions. P_0xbc81_false_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc88_18 :: state_pred where
  \<open>Q_0xbc88_18 \<sigma> \<equiv> RIP \<sigma> = 0xbc88 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc88_18_def[Qs]

schematic_goal remove_mapping_0_3_0xbc81_0xbc86_18[blocks]:
  assumes \<open>(P_0xbc81_false_18 && P_0xbc81_false_18_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xbc86 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc88_18 ?\<sigma> \<and> block_usage P_0xbc81_false_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc81_false_18_def P_0xbc81_false_18_regions_def post: Q_0xbc88_18_def regionset: P_0xbc81_false_18_regions_set_def)

definition P_0xbc88_true_19 :: state_pred where
  \<open>P_0xbc88_true_19 \<sigma> \<equiv> RIP \<sigma> = 0xbc88 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc88_true_19_def[Ps]

definition P_0xbc88_true_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc88_true_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0),
    (6, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc88_true_19_regions :: state_pred where
  \<open>P_0xbc88_true_19_regions \<sigma> \<equiv> \<exists>regions. P_0xbc88_true_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc90_19 :: state_pred where
  \<open>Q_0xbc90_19 \<sigma> \<equiv> RIP \<sigma> = 0xbc90 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc90_19_def[Qs]

schematic_goal remove_mapping_0_1_0xbc88_0xbc88_19[blocks]:
  assumes \<open>(P_0xbc88_true_19 && P_0xbc88_true_19_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbc88 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc90_19 ?\<sigma> \<and> block_usage P_0xbc88_true_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc88_true_19_def P_0xbc88_true_19_regions_def post: Q_0xbc90_19_def regionset: P_0xbc88_true_19_regions_set_def)

definition P_0xbc88_false_20 :: state_pred where
  \<open>P_0xbc88_false_20 \<sigma> \<equiv> RIP \<sigma> = 0xbc88 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc88_false_20_def[Ps]

definition P_0xbc88_false_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc88_false_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x10), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0),
    (6, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc88_false_20_regions :: state_pred where
  \<open>P_0xbc88_false_20_regions \<sigma> \<equiv> \<exists>regions. P_0xbc88_false_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc90_20 :: state_pred where
  \<open>Q_0xbc90_20 \<sigma> \<equiv> RIP \<sigma> = 0xbc90 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc90_20_def[Qs]

schematic_goal remove_mapping_0_3_0xbc88_0xbc8d_20[blocks]:
  assumes \<open>(P_0xbc88_false_20 && P_0xbc88_false_20_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 3 0xbc8d 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc90_20 ?\<sigma> \<and> block_usage P_0xbc88_false_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc88_false_20_def P_0xbc88_false_20_regions_def post: Q_0xbc90_20_def regionset: P_0xbc88_false_20_regions_set_def)

definition P_0xbc90_21 :: state_pred where
  \<open>P_0xbc90_21 \<sigma> \<equiv> RIP \<sigma> = 0xbc90 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc90_21_def[Ps]

definition P_0xbc90_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc90_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RDX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc90_21_regions :: state_pred where
  \<open>P_0xbc90_21_regions \<sigma> \<equiv> \<exists>regions. P_0xbc90_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc9b_21 :: state_pred where
  \<open>Q_0xbc9b_21 \<sigma> \<equiv> RIP \<sigma> = 0xbc9b \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc9b_21_def[Qs]

schematic_goal remove_mapping_0_3_0xbc90_0xbc99_21[blocks]:
  assumes \<open>(P_0xbc90_21 && P_0xbc90_21_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0xbc99 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc9b_21 ?\<sigma> \<and> block_usage P_0xbc90_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc90_21_def P_0xbc90_21_regions_def post: Q_0xbc9b_21_def regionset: P_0xbc90_21_regions_set_def)

definition P_0xbc9b_true_22 :: state_pred where
  \<open>P_0xbc9b_true_22 \<sigma> \<equiv> RIP \<sigma> = 0xbc9b \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc9b_true_22_def[Ps]

definition P_0xbc9b_true_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc9b_true_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc9b_true_22_regions :: state_pred where
  \<open>P_0xbc9b_true_22_regions \<sigma> \<equiv> \<exists>regions. P_0xbc9b_true_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc60_22 :: state_pred where
  \<open>Q_0xbc60_22 \<sigma> \<equiv> RIP \<sigma> = 0xbc60 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc60_22_def[Qs]

schematic_goal remove_mapping_0_1_0xbc9b_0xbc9b_22[blocks]:
  assumes \<open>(P_0xbc9b_true_22 && P_0xbc9b_true_22_regions && ja) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbc9b 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc60_22 ?\<sigma> \<and> block_usage P_0xbc9b_true_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc9b_true_22_def P_0xbc9b_true_22_regions_def post: Q_0xbc60_22_def regionset: P_0xbc9b_true_22_regions_set_def)

definition P_0xbc9b_false_23 :: state_pred where
  \<open>P_0xbc9b_false_23 \<sigma> \<equiv> RIP \<sigma> = 0xbc9b \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc9b_false_23_def[Ps]

definition P_0xbc9b_false_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc9b_false_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc9b_false_23_regions :: state_pred where
  \<open>P_0xbc9b_false_23_regions \<sigma> \<equiv> \<exists>regions. P_0xbc9b_false_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc9d_23 :: state_pred where
  \<open>Q_0xbc9d_23 \<sigma> \<equiv> RIP \<sigma> = 0xbc9d \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbc9d_23_def[Qs]

schematic_goal remove_mapping_0_1_0xbc9b_0xbc9b_23[blocks]:
  assumes \<open>(P_0xbc9b_false_23 && P_0xbc9b_false_23_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbc9b 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc9d_23 ?\<sigma> \<and> block_usage P_0xbc9b_false_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc9b_false_23_def P_0xbc9b_false_23_regions_def post: Q_0xbc9d_23_def regionset: P_0xbc9b_false_23_regions_set_def)

definition P_0xbc9d_24 :: state_pred where
  \<open>P_0xbc9d_24 \<sigma> \<equiv> RIP \<sigma> = 0xbc9d \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbc9d_24_def[Ps]

definition P_0xbc9d_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc9d_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8080), 8),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbc9d_24_regions :: state_pred where
  \<open>P_0xbc9d_24_regions \<sigma> \<equiv> \<exists>regions. P_0xbc9d_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbca7_24 :: state_pred where
  \<open>Q_0xbca7_24 \<sigma> \<equiv> RIP \<sigma> = 0xbca7 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbca7_24_def[Qs]

schematic_goal remove_mapping_0_2_0xbc9d_0xbca4_24[blocks]:
  assumes \<open>(P_0xbc9d_24 && P_0xbc9d_24_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xbca4 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbca7_24 ?\<sigma> \<and> block_usage P_0xbc9d_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc9d_24_def P_0xbc9d_24_regions_def post: Q_0xbca7_24_def regionset: P_0xbc9d_24_regions_set_def)

definition P_0xbca7_true_25 :: state_pred where
  \<open>P_0xbca7_true_25 \<sigma> \<equiv> RIP \<sigma> = 0xbca7 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbca7_true_25_def[Ps]

definition P_0xbca7_true_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbca7_true_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8080), 8),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbca7_true_25_regions :: state_pred where
  \<open>P_0xbca7_true_25_regions \<sigma> \<equiv> \<exists>regions. P_0xbca7_true_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_25 :: state_pred where
  \<open>Q_ret_address_25 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_25_def[Qs]

schematic_goal remove_mapping_0_6_0xbca7_0xbce5_25[blocks]:
  assumes \<open>(P_0xbca7_true_25 && P_0xbca7_true_25_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0xbce5 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_25 ?\<sigma> \<and> block_usage P_0xbca7_true_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbca7_true_25_def P_0xbca7_true_25_regions_def post: Q_ret_address_25_def regionset: P_0xbca7_true_25_regions_set_def)

definition P_0xbca7_false_26 :: state_pred where
  \<open>P_0xbca7_false_26 \<sigma> \<equiv> RIP \<sigma> = 0xbca7 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbca7_false_26_def[Ps]

definition P_0xbca7_false_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbca7_false_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8080), 8),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbca7_false_26_regions :: state_pred where
  \<open>P_0xbca7_false_26_regions \<sigma> \<equiv> \<exists>regions. P_0xbca7_false_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbcb3_26 :: state_pred where
  \<open>Q_0xbcb3_26 \<sigma> \<equiv> RIP \<sigma> = 0xbcb3 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbcb3_26_def[Qs]

schematic_goal remove_mapping_0_3_0xbca7_0xbcb0_26[blocks]:
  assumes \<open>(P_0xbca7_false_26 && P_0xbca7_false_26_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xbcb0 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbcb3_26 ?\<sigma> \<and> block_usage P_0xbca7_false_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbca7_false_26_def P_0xbca7_false_26_regions_def post: Q_0xbcb3_26_def regionset: P_0xbca7_false_26_regions_set_def)

definition P_0xbcb3_true_27 :: state_pred where
  \<open>P_0xbcb3_true_27 \<sigma> \<equiv> RIP \<sigma> = 0xbcb3 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbcb3_true_27_def[Ps]

definition P_0xbcb3_true_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbcb3_true_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8080), 8),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbcb3_true_27_regions :: state_pred where
  \<open>P_0xbcb3_true_27_regions \<sigma> \<equiv> \<exists>regions. P_0xbcb3_true_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_27 :: state_pred where
  \<open>Q_ret_address_27 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_27_def[Qs]

schematic_goal remove_mapping_0_6_0xbcb3_0xbce5_27[blocks]:
  assumes \<open>(P_0xbcb3_true_27 && P_0xbcb3_true_27_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0xbce5 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_27 ?\<sigma> \<and> block_usage P_0xbcb3_true_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbcb3_true_27_def P_0xbcb3_true_27_regions_def post: Q_ret_address_27_def regionset: P_0xbcb3_true_27_regions_set_def)

definition P_0xbcb3_false_28 :: state_pred where
  \<open>P_0xbcb3_false_28 \<sigma> \<equiv> RIP \<sigma> = 0xbcb3 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbcb3_false_28_def[Ps]

definition P_0xbcb3_false_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbcb3_false_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8080), 8),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbcb3_false_28_regions :: state_pred where
  \<open>P_0xbcb3_false_28_regions \<sigma> \<equiv> \<exists>regions. P_0xbcb3_false_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbccc_28 :: state_pred where
  \<open>Q_0xbccc_28 \<sigma> \<equiv> RIP \<sigma> = 0xbccc \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> RDX \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word)::64 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)) >>> 3)::64 word) * 0xcccccccccccccccd)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = 0xcccccccccccccccd \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbccc_28_def[Qs]

schematic_goal remove_mapping_0_6_0xbcb3_0xbcca_28[blocks]:
  assumes \<open>(P_0xbcb3_false_28 && P_0xbcb3_false_28_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0xbcca 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbccc_28 ?\<sigma> \<and> block_usage P_0xbcb3_false_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbcb3_false_28_def P_0xbcb3_false_28_regions_def post: Q_0xbccc_28_def regionset: P_0xbcb3_false_28_regions_set_def)

definition P_0xbccc_true_29 :: state_pred where
  \<open>P_0xbccc_true_29 \<sigma> \<equiv> RIP \<sigma> = 0xbccc \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> RDX \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word)::64 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)) >>> 3)::64 word) * 0xcccccccccccccccd)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = 0xcccccccccccccccd \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbccc_true_29_def[Ps]

definition P_0xbccc_true_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbccc_true_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8080), 8),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbccc_true_29_regions :: state_pred where
  \<open>P_0xbccc_true_29_regions \<sigma> \<equiv> \<exists>regions. P_0xbccc_true_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbd18_29 :: state_pred where
  \<open>Q_0xbd18_29 \<sigma> \<equiv> RIP \<sigma> = 0xbd18 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = 0x21470 \<and> RDX \<sigma> = 0x60 \<and> RDI \<sigma> = 0x20b1b \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbd18_29_def[Qs]

schematic_goal remove_mapping_0_5_0xbccc_0xbd11_29[blocks]:
  assumes \<open>(P_0xbccc_true_29 && P_0xbccc_true_29_regions && !CF) \<sigma>\<close>
  shows \<open>exec_block 5 0xbd11 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbd18_29 ?\<sigma> \<and> block_usage P_0xbccc_true_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbccc_true_29_def P_0xbccc_true_29_regions_def post: Q_0xbd18_29_def regionset: P_0xbccc_true_29_regions_set_def)

definition P_0xbd18_30 :: state_pred where
  \<open>P_0xbd18_30 \<sigma> \<equiv> RIP \<sigma> = 0xbd18 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = 0x21470 \<and> RDX \<sigma> = 0x60 \<and> RDI \<sigma> = 0x20b1b \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbd18_30_def[Ps]

definition P_0xbd18_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbd18_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8080), 8),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbd18_30_regions :: state_pred where
  \<open>P_0xbd18_30_regions \<sigma> \<equiv> \<exists>regions. P_0xbd18_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xbd18_30 :: state_pred where
  \<open>Q_assert_fail_addr_0xbd18_30 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = assert_fail_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_assert_fail_addr_0xbd18_30_def[Qs]

schematic_goal remove_mapping_0_1_0xbd18_0xbd18_30[blocks]:
  assumes \<open>(P_0xbd18_30 && P_0xbd18_30_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbd18 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xbd18_30 ?\<sigma> \<and> block_usage P_0xbd18_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbd18_30_def P_0xbd18_30_regions_def post: Q_assert_fail_addr_0xbd18_30_def regionset: P_0xbd18_30_regions_set_def)

definition P_0xbccc_false_31 :: state_pred where
  \<open>P_0xbccc_false_31 \<sigma> \<equiv> RIP \<sigma> = 0xbccc \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> RDX \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word)::64 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)) >>> 3)::64 word) * 0xcccccccccccccccd)) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = 0xcccccccccccccccd \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8080),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbccc_false_31_def[Ps]

definition P_0xbccc_false_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbccc_false_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8080), 8),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbccc_false_31_regions :: state_pred where
  \<open>P_0xbccc_false_31_regions \<sigma> \<equiv> \<exists>regions. P_0xbccc_false_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbcdf_31 :: state_pred where
  \<open>Q_0xbcdf_31 \<sigma> \<equiv> RIP \<sigma> = 0xbcdf \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = 0xcccccccccccccccd \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare Q_0xbcdf_31_def[Qs]

schematic_goal remove_mapping_0_4_0xbccc_0xbcd8_31[blocks]:
  assumes \<open>(P_0xbccc_false_31 && P_0xbccc_false_31_regions && ! !CF) \<sigma>\<close>
  shows \<open>exec_block 4 0xbcd8 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbcdf_31 ?\<sigma> \<and> block_usage P_0xbccc_false_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbccc_false_31_def P_0xbccc_false_31_regions_def post: Q_0xbcdf_31_def regionset: P_0xbccc_false_31_regions_set_def)

definition P_0xbcdf_32 :: state_pred where
  \<open>P_0xbcdf_32 \<sigma> \<equiv> RIP \<sigma> = 0xbcdf \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x8040) \<and> RSI \<sigma> = 0xcccccccccccccccd \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xbc51\<close>
declare P_0xbcdf_32_def[Ps]

definition P_0xbcdf_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbcdf_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0xc), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xbcdf_32_regions :: state_pred where
  \<open>P_0xbcdf_32_regions \<sigma> \<equiv> \<exists>regions. P_0xbcdf_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_32 :: state_pred where
  \<open>Q_ret_address_32 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_32_def[Qs]

schematic_goal remove_mapping_0_5_0xbcdf_0xbce5_32[blocks]:
  assumes \<open>(P_0xbcdf_32 && P_0xbcdf_32_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xbce5 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_32 ?\<sigma> \<and> block_usage P_0xbcdf_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbcdf_32_def P_0xbcdf_32_regions_def post: Q_ret_address_32_def regionset: P_0xbcdf_32_regions_set_def)

definition remove_mapping_acode :: ACode where
  \<open>remove_mapping_acode =
    Block 4 0xbc14 0;
    IF !CF THEN
      Block 5 0xbd11 (Suc 0);
      Block (Suc 0) 0xbd18 2;
      CALL assert_fail_acode
    ELSE
      Block 9 0xbc3b 3;
      IF SF THEN
        Block 2 0xbcf0 4;
        Block (Suc 0) 0xbcf4 5;
        CALL free_acode;
        Block (Suc 0) 0xbcf9 6
      ELSE
        Block (Suc 0) 0xbc3d 7
      FI;
      Block 2 0xbc4a 8;
      Block (Suc 0) 0xbc4c 9;
      CALL array_remove_acode;
      Block 2 0xbc57 10;
      IF ZF THEN
        Block (Suc 0) 0xbc59 11
      ELSE
        Block 3 0xbc5d 12;
        WHILE P_0xbc60_13 DO
          Block 5 0xbc73 13;
          IF jg THEN
            Block (Suc 0) 0xbc75 14
          ELSE
            Block 3 0xbc7a 15
          FI;
          Block (Suc 0) 0xbc7d 16;
          IF ZF THEN
            Block (Suc 0) 0xbc81 17
          ELSE
            Block 3 0xbc86 18;
            IF jg THEN
              Block (Suc 0) 0xbc88 19
            ELSE
              Block 3 0xbc8d 20
            FI
          FI;
          Block 3 0xbc99 21;
          IF ja THEN
            Block (Suc 0) 0xbc9b 22
          ELSE
            Block (Suc 0) 0xbc9b 23
          FI
        OD
      FI;
      Block 2 0xbca4 24;
      IF ZF THEN
        Block 6 0xbce5 25
      ELSE
        Block 3 0xbcb0 26;
        IF ZF THEN
          Block 6 0xbce5 27
        ELSE
          Block 6 0xbcca 28;
          IF !CF THEN
            Block 5 0xbd11 29;
            Block (Suc 0) 0xbd18 30;
            CALL assert_fail_acode
          ELSE
            Block 4 0xbcd8 31;
            Block 5 0xbce5 32
          FI
        FI
      FI
    FI
  \<close>

text \<open>Moved down as otherwise we get a TERM exception for some reason.\<close>
method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while,
  (vcg_step assms: assms)+,
  (simp add: pred_logic Ps Qs)+,
  (vcg_step' assms: assms | vcg_step assms: assms)+,
  ((simp add: assms)+)?

schematic_goal "remove_mapping":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc1a \<longrightarrow> P_0xbc1a_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbd18 \<longrightarrow> P_0xbd18_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc1a \<longrightarrow> P_0xbc1a_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc3d \<longrightarrow> P_0xbc3d_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbcf4 \<longrightarrow> P_0xbcf4_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbcf9 \<longrightarrow> P_0xbcf9_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc3d \<longrightarrow> P_0xbc3d_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc43 \<longrightarrow> P_0xbc43_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc4c \<longrightarrow> P_0xbc4c_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc51 \<longrightarrow> P_0xbc51_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc59 \<longrightarrow> P_0xbc59_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc59 \<longrightarrow> P_0xbc59_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc60 \<longrightarrow> P_0xbc60_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc75 \<longrightarrow> P_0xbc75_true_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc75 \<longrightarrow> P_0xbc75_false_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc7d \<longrightarrow> P_0xbc7d_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc81 \<longrightarrow> P_0xbc81_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc81 \<longrightarrow> P_0xbc81_false_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc88 \<longrightarrow> P_0xbc88_true_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc88 \<longrightarrow> P_0xbc88_false_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc90 \<longrightarrow> P_0xbc90_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc9b \<longrightarrow> P_0xbc9b_true_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc9b \<longrightarrow> P_0xbc9b_false_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc9d \<longrightarrow> P_0xbc9d_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbca7 \<longrightarrow> P_0xbca7_true_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbca7 \<longrightarrow> P_0xbca7_false_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbcb3 \<longrightarrow> P_0xbcb3_true_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbcb3 \<longrightarrow> P_0xbcb3_false_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbccc \<longrightarrow> P_0xbccc_true_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbd18 \<longrightarrow> P_0xbd18_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbccc \<longrightarrow> P_0xbccc_false_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbcdf \<longrightarrow> P_0xbcdf_32_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xbd18_2}} \<box>assert_fail_acode {{Q_fail;M_0xbd18}}\<close>
    and [blocks]: \<open>{{Q_free_addr_0xbcf4_5}} \<box>free_acode {{P_0xbcf9_6;M_0xbcf4}}\<close>
    and [blocks]: \<open>{{Q_array_remove_addr_0xbc4c_9}} \<box>array_remove_acode {{P_0xbc51_10;M_0xbc4c}}\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xbd18_30}} \<box>assert_fail_acode {{Q_fail;M_0xbd18}}\<close>
  shows \<open>{{?P}} remove_mapping_acode {{?Q;?M}}\<close>
  apply (vcg acode: remove_mapping_acode_def assms: assms)
                apply (vcg_while \<open>P_0xbc60_13 || P_0xbc9d_24\<close> assms: assms)
             apply (vcg_step assms: assms)+
  done

end

end
