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
theory qemu_iovec__buffer
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes memcpy_0x58b8_retval\<^sub>v memcpy_0x5922_retval\<^sub>v memcpy_addr :: \<open>64 word\<close>
    and memcpy_acode :: ACode
  assumes fetch:
    "fetch 0x5880 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 8))))), 3)"
    "fetch 0x5883 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5885 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 22744)), 2)"
    "fetch 0x5887 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5889 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x588c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x588f \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5890 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5891 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0x5894 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x5896 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x58a0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x58a3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x58a6 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x58aa \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0x58ae \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x58b1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x58b4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8))))), 4)"
    "fetch 0x58b8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0x58bd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x58c0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r12))))), 4)"
    "fetch 0x58c4 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rbp))) (A_WordConstant 8)))))), 5)"
    "fetch 0x58c9 \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo rbx))), 5)"
    "fetch 0x58ce \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 22688)), 2)"
    "fetch 0x58d0 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x58d1 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x58d2 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x58d4 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x58d5 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x58d8 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x58e0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 8))))), 3)"
    "fetch 0x58e3 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x58e5 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 22858)), 2)"
    "fetch 0x58e7 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x58e9 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x58eb \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x58ed \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x58ee \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x58ef \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x58f2 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x58f5 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 22849)), 2)"
    "fetch 0x58f7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x58fa \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x58fd \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x5900 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x5903 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x5906 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x5909 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0x590d \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r14))))), 3)"
    "fetch 0x5910 \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rbx))), 4)"
    "fetch 0x5914 \<equiv> (Binary (IS_PentiumPro Cmovbe) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8))))), 5)"
    "fetch 0x5919 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x591c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x591f \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x5922 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0x5927 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 1)))), 5)"
    "fetch 0x592c \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r14)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0x5930 \<equiv> (Unary (IS_80386 Setg) (Storage (Reg (General Eight rdx))), 3)"
    "fetch 0x5933 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x5936 \<equiv> (Unary (IS_80386 Setne) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x5939 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x593d \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rdx)) (Storage (Reg (General Eight rax))), 2)"
    "fetch 0x593f \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 22784)), 2)"
    "fetch 0x5941 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5942 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5943 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5945 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5947 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x5949 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x594a \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and memcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcpy'') = memcpy_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>memcpy_0x58b8_retval \<equiv> memcpy_0x58b8_retval\<^sub>v\<close>
definition \<open>memcpy_0x5922_retval \<equiv> memcpy_0x5922_retval\<^sub>v\<close>

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

locale "qemu_iovec_to_buffer" = "qemu_img_xen" +
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

definition P_0x5880_0 :: state_pred where
  \<open>P_0x5880_0 \<sigma> \<equiv> RIP \<sigma> = 0x5880 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5880_0_def[Ps]

definition P_0x5880_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5880_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8), 4)
  }\<close>

definition P_0x5880_0_regions :: state_pred where
  \<open>P_0x5880_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5880_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5885_0 :: state_pred where
  \<open>Q_0x5885_0 \<sigma> \<equiv> RIP \<sigma> = 0x5885 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word))\<close>
declare Q_0x5885_0_def[Qs]

schematic_goal qemu_iovec_to_buffer_0_2_0x5880_0x5883_0[blocks]:
  assumes \<open>(P_0x5880_0 && P_0x5880_0_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5883 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5885_0 ?\<sigma> \<and> block_usage P_0x5880_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5880_0_def P_0x5880_0_regions_def post: Q_0x5885_0_def regionset: P_0x5880_0_regions_set_def)

definition P_0x5885_true_1 :: state_pred where
  \<open>P_0x5885_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x5885 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word))\<close>
declare P_0x5885_true_1_def[Ps]

definition P_0x5885_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5885_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8), 4)
  }\<close>

definition P_0x5885_true_1_regions :: state_pred where
  \<open>P_0x5885_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5885_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word))\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal qemu_iovec_to_buffer_0_2_0x5885_0x58d8_1[blocks]:
  assumes \<open>(P_0x5885_true_1 && P_0x5885_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 2 0x58d8 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x5885_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5885_true_1_def P_0x5885_true_1_regions_def post: Q_ret_address_1_def regionset: P_0x5885_true_1_regions_set_def)

definition P_0x5885_false_2 :: state_pred where
  \<open>P_0x5885_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x5885 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word))\<close>
declare P_0x5885_false_2_def[Ps]

definition P_0x5885_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5885_false_2_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x5885_false_2_regions :: state_pred where
  \<open>P_0x5885_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5885_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x58a0_2 :: state_pred where
  \<open>Q_0x58a0_2 \<sigma> \<equiv> RIP \<sigma> = 0x58a0 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x58a0_2_def[Qs]

schematic_goal qemu_iovec_to_buffer_0_9_0x5885_0x5896_2[blocks]:
  assumes \<open>(P_0x5885_false_2 && P_0x5885_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 9 0x5896 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x58a0_2 ?\<sigma> \<and> block_usage P_0x5885_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5885_false_2_def P_0x5885_false_2_regions_def post: Q_0x58a0_2_def regionset: P_0x5885_false_2_regions_set_def)

definition P_0x58a0_3 :: state_pred where
  \<open>P_0x58a0_3 \<sigma> \<equiv> RIP \<sigma> = 0x58a0 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x58a0_3_def[Ps]

definition P_0x58a0_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58a0_3_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, (((((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (RBX \<sigma> << 4))::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (RBX \<sigma> << 4)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x58a0_3_regions :: state_pred where
  \<open>P_0x58a0_3_regions \<sigma> \<equiv> \<exists>regions. P_0x58a0_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x58b8_3 :: state_pred where
  \<open>Q_0x58b8_3 \<sigma> \<equiv> RIP \<sigma> = 0x58b8 \<and> RDI \<sigma> = RCX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x58b8_3_def[Qs]

schematic_goal qemu_iovec_to_buffer_0_7_0x58a0_0x58b4_3[blocks]:
  assumes \<open>(P_0x58a0_3 && P_0x58a0_3_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x58b4 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x58b8_3 ?\<sigma> \<and> block_usage P_0x58a0_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58a0_3_def P_0x58a0_3_regions_def post: Q_0x58b8_3_def regionset: P_0x58a0_3_regions_set_def)

definition P_0x58b8_4 :: state_pred where
  \<open>P_0x58b8_4 \<sigma> \<equiv> RIP \<sigma> = 0x58b8 \<and> RDI \<sigma> = RCX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x58b8_4_def[Ps]

definition P_0x58b8_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58b8_4_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x58b8_4_regions :: state_pred where
  \<open>P_0x58b8_4_regions \<sigma> \<equiv> \<exists>regions. P_0x58b8_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x58b8_4 :: state_pred where
  \<open>Q_memcpy_addr_0x58b8_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = memcpy_addr \<and> RDI \<sigma> = RCX \<sigma> \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x58bd\<close>
declare Q_memcpy_addr_0x58b8_4_def[Qs]

schematic_goal qemu_iovec_to_buffer_0_1_0x58b8_0x58b8_4[blocks]:
  assumes \<open>(P_0x58b8_4 && P_0x58b8_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x58b8 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x58b8_4 ?\<sigma> \<and> block_usage P_0x58b8_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58b8_4_def P_0x58b8_4_regions_def post: Q_memcpy_addr_0x58b8_4_def regionset: P_0x58b8_4_regions_set_def)

definition P_0x58bd_5 :: state_pred where
  \<open>P_0x58bd_5 \<sigma> \<equiv> RIP \<sigma> = 0x58bd \<and> RDI \<sigma> = RCX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x58bd\<close>
declare P_0x58bd_5_def[Ps]

definition P_0x58bd_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58bd_5_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x8)), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x58bd_5_regions :: state_pred where
  \<open>P_0x58bd_5_regions \<sigma> \<equiv> \<exists>regions. P_0x58bd_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x58ce_5 :: state_pred where
  \<open>Q_0x58ce_5 \<sigma> \<equiv> RIP \<sigma> = 0x58ce \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x58ce_5_def[Qs]

schematic_goal qemu_iovec_to_buffer_0_4_0x58bd_0x58c9_5[blocks]:
  assumes \<open>(P_0x58bd_5 && P_0x58bd_5_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x58c9 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x58ce_5 ?\<sigma> \<and> block_usage P_0x58bd_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58bd_5_def P_0x58bd_5_regions_def post: Q_0x58ce_5_def regionset: P_0x58bd_5_regions_set_def)

definition P_0x58ce_true_6 :: state_pred where
  \<open>P_0x58ce_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x58ce \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x58ce_true_6_def[Ps]

definition P_0x58ce_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58ce_true_6_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x58ce_true_6_regions :: state_pred where
  \<open>P_0x58ce_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x58ce_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x58a0_6 :: state_pred where
  \<open>Q_0x58a0_6 \<sigma> \<equiv> RIP \<sigma> = 0x58a0 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x58a0_6_def[Qs]

schematic_goal qemu_iovec_to_buffer_0_1_0x58ce_0x58ce_6[blocks]:
  assumes \<open>(P_0x58ce_true_6 && P_0x58ce_true_6_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x58ce 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x58a0_6 ?\<sigma> \<and> block_usage P_0x58ce_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58ce_true_6_def P_0x58ce_true_6_regions_def post: Q_0x58a0_6_def regionset: P_0x58ce_true_6_regions_set_def)

definition P_0x58ce_false_7 :: state_pred where
  \<open>P_0x58ce_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x58ce \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x58ce_false_7_def[Ps]

definition P_0x58ce_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58ce_false_7_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x58ce_false_7_regions :: state_pred where
  \<open>P_0x58ce_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x58ce_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x58d0_7 :: state_pred where
  \<open>Q_0x58d0_7 \<sigma> \<equiv> RIP \<sigma> = 0x58d0 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x58d0_7_def[Qs]

schematic_goal qemu_iovec_to_buffer_0_1_0x58ce_0x58ce_7[blocks]:
  assumes \<open>(P_0x58ce_false_7 && P_0x58ce_false_7_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x58ce 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x58d0_7 ?\<sigma> \<and> block_usage P_0x58ce_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58ce_false_7_def P_0x58ce_false_7_regions_def post: Q_0x58d0_7_def regionset: P_0x58ce_false_7_regions_set_def)

definition P_0x58d0_8 :: state_pred where
  \<open>P_0x58d0_8 \<sigma> \<equiv> RIP \<sigma> = 0x58d0 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x58d0_8_def[Ps]

definition P_0x58d0_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58d0_8_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x58d0_8_regions :: state_pred where
  \<open>P_0x58d0_8_regions \<sigma> \<equiv> \<exists>regions. P_0x58d0_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_8 :: state_pred where
  \<open>Q_ret_address_8 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word))\<close>
declare Q_ret_address_8_def[Qs]

schematic_goal qemu_iovec_to_buffer_0_4_0x58d0_0x58d4_8[blocks]:
  assumes \<open>(P_0x58d0_8 && P_0x58d0_8_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x58d4 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_8 ?\<sigma> \<and> block_usage P_0x58d0_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58d0_8_def P_0x58d0_8_regions_def post: Q_ret_address_8_def regionset: P_0x58d0_8_regions_set_def)

definition qemu_iovec_to_buffer_acode :: ACode where
  \<open>qemu_iovec_to_buffer_acode =
    Block 2 0x5883 0;
    IF jle THEN
      Block 2 0x58d8 (Suc 0)
    ELSE
      Block 9 0x5896 2;
      WHILE P_0x58a0_3 DO
        Block 7 0x58b4 3;
        Block (Suc 0) 0x58b8 4;
        CALL memcpy_acode;
        Block 4 0x58c9 5;
        IF jg THEN
          Block (Suc 0) 0x58ce 6
        ELSE
          Block (Suc 0) 0x58ce 7
        FI
      OD;
      Block 4 0x58d4 8
    FI
  \<close>

schematic_goal "qemu_iovec_to_buffer":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5885 \<longrightarrow> P_0x5885_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5885 \<longrightarrow> P_0x5885_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x58a0 \<longrightarrow> P_0x58a0_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x58b8 \<longrightarrow> P_0x58b8_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x58bd \<longrightarrow> P_0x58bd_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x58ce \<longrightarrow> P_0x58ce_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x58ce \<longrightarrow> P_0x58ce_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x58d0 \<longrightarrow> P_0x58d0_8_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x58b8_4}} \<box>memcpy_acode {{P_0x58bd_5;M_0x58b8}}\<close>
  shows \<open>{{?P}} qemu_iovec_to_buffer_acode {{?Q;?M}}\<close>
  apply (vcg acode: qemu_iovec_to_buffer_acode_def assms: assms)
      apply (vcg_while \<open>P_0x58a0_3 || P_0x58d0_8\<close> assms: assms)
         apply (vcg_step assms: assms)+
        apply (simp add: pred_logic Ps Qs assms)
       apply (simp add: pred_logic Ps Qs assms)
       apply (vcg_step assms: assms)+
        apply (simp add: assms)+
  done

end

locale "qemu_iovec_from_buffer" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>R14\<^sub>0 \<equiv> R14\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x58e0_0 :: state_pred where
  \<open>P_0x58e0_0 \<sigma> \<equiv> RIP \<sigma> = 0x58e0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x58e0_0_def[Ps]

definition P_0x58e0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58e0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8), 4)
  }\<close>

definition P_0x58e0_0_regions :: state_pred where
  \<open>P_0x58e0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x58e0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x58e5_0 :: state_pred where
  \<open>Q_0x58e5_0 \<sigma> \<equiv> RIP \<sigma> = 0x58e5 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word))\<close>
declare Q_0x58e5_0_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_2_0x58e0_0x58e3_0[blocks]:
  assumes \<open>(P_0x58e0_0 && P_0x58e0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x58e3 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x58e5_0 ?\<sigma> \<and> block_usage P_0x58e0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58e0_0_def P_0x58e0_0_regions_def post: Q_0x58e5_0_def regionset: P_0x58e0_0_regions_set_def)

definition P_0x58e5_true_1 :: state_pred where
  \<open>P_0x58e5_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x58e5 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word))\<close>
declare P_0x58e5_true_1_def[Ps]

definition P_0x58e5_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58e5_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8), 4)
  }\<close>

definition P_0x58e5_true_1_regions :: state_pred where
  \<open>P_0x58e5_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x58e5_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word))\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_2_0x58e5_0x594a_1[blocks]:
  assumes \<open>(P_0x58e5_true_1 && P_0x58e5_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 2 0x594a (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x58e5_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58e5_true_1_def P_0x58e5_true_1_regions_def post: Q_ret_address_1_def regionset: P_0x58e5_true_1_regions_set_def)

definition P_0x58e5_false_2 :: state_pred where
  \<open>P_0x58e5_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x58e5 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word))\<close>
declare P_0x58e5_false_2_def[Ps]

definition P_0x58e5_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58e5_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x58e5_false_2_regions :: state_pred where
  \<open>P_0x58e5_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x58e5_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x58f5_2 :: state_pred where
  \<open>Q_0x58f5_2 \<sigma> \<equiv> RIP \<sigma> = 0x58f5 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x58f5_2_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_8_0x58e5_0x58f2_2[blocks]:
  assumes \<open>(P_0x58e5_false_2 && P_0x58e5_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 8 0x58f2 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x58f5_2 ?\<sigma> \<and> block_usage P_0x58e5_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58e5_false_2_def P_0x58e5_false_2_regions_def post: Q_0x58f5_2_def regionset: P_0x58e5_false_2_regions_set_def)

definition P_0x58f5_true_3 :: state_pred where
  \<open>P_0x58f5_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x58f5 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x58f5_true_3_def[Ps]

definition P_0x58f5_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58f5_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x58f5_true_3_regions :: state_pred where
  \<open>P_0x58f5_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x58f5_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5941_3 :: state_pred where
  \<open>Q_0x5941_3 \<sigma> \<equiv> RIP \<sigma> = 0x5941 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5941_3_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_1_0x58f5_0x58f5_3[blocks]:
  assumes \<open>(P_0x58f5_true_3 && P_0x58f5_true_3_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x58f5 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5941_3 ?\<sigma> \<and> block_usage P_0x58f5_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58f5_true_3_def P_0x58f5_true_3_regions_def post: Q_0x5941_3_def regionset: P_0x58f5_true_3_regions_set_def)

definition P_0x58f5_false_4 :: state_pred where
  \<open>P_0x58f5_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x58f5 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x58f5_false_4_def[Ps]

definition P_0x58f5_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x58f5_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x58f5_false_4_regions :: state_pred where
  \<open>P_0x58f5_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x58f5_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5900_4 :: state_pred where
  \<open>Q_0x5900_4 \<sigma> \<equiv> RIP \<sigma> = 0x5900 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5900_4_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_4_0x58f5_0x58fd_4[blocks]:
  assumes \<open>(P_0x58f5_false_4 && P_0x58f5_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x58fd 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5900_4 ?\<sigma> \<and> block_usage P_0x58f5_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x58f5_false_4_def P_0x58f5_false_4_regions_def post: Q_0x5900_4_def regionset: P_0x58f5_false_4_regions_set_def)

definition P_0x5900_5 :: state_pred where
  \<open>P_0x5900_5 \<sigma> \<equiv> RIP \<sigma> = 0x5900 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5900_5_def[Ps]

definition P_0x5900_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5900_5_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, (((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8), 8),
    (4, (((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x5900_5_regions :: state_pred where
  \<open>P_0x5900_5_regions \<sigma> \<equiv> \<exists>regions. P_0x5900_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5922_5 :: state_pred where
  \<open>Q_0x5922_5 \<sigma> \<equiv> RIP \<sigma> = 0x5922 \<and> RAX \<sigma> = (((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)) \<and> RDX \<sigma> = (if' ((\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word)::64 word) \<le> RBX \<sigma> then (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) else (RBX \<sigma>::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (if' ((\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word)::64 word) \<le> RBX \<sigma> then (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) else (RBX \<sigma>::64 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5922_5_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_10_0x5900_0x591f_5[blocks]:
  assumes \<open>(P_0x5900_5 && P_0x5900_5_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x591f 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5922_5 ?\<sigma> \<and> block_usage P_0x5900_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5900_5_def P_0x5900_5_regions_def post: Q_0x5922_5_def regionset: P_0x5900_5_regions_set_def)

definition P_0x5922_6 :: state_pred where
  \<open>P_0x5922_6 \<sigma> \<equiv> RIP \<sigma> = 0x5922 \<and> RAX \<sigma> = (((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)) \<and> RDX \<sigma> = (if' ((\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word)::64 word) \<le> RBX \<sigma> then (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) else (RBX \<sigma>::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (if' ((\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word)::64 word) \<le> RBX \<sigma> then (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) else (RBX \<sigma>::64 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5922_6_def[Ps]

definition P_0x5922_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5922_6_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, (((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8), 8),
    (4, (((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5922_6_regions :: state_pred where
  \<open>P_0x5922_6_regions \<sigma> \<equiv> \<exists>regions. P_0x5922_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x5922_6 :: state_pred where
  \<open>Q_memcpy_addr_0x5922_6 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = (((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)) \<and> RDX \<sigma> = (if' ((\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word)::64 word) \<le> RBX \<sigma> then (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) else (RBX \<sigma>::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) \<and> RBP \<sigma> = (if' ((\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word)::64 word) \<le> RBX \<sigma> then (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) else (RBX \<sigma>::64 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5927\<close>
declare Q_memcpy_addr_0x5922_6_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_1_0x5922_0x5922_6[blocks]:
  assumes \<open>(P_0x5922_6 && P_0x5922_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5922 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x5922_6 ?\<sigma> \<and> block_usage P_0x5922_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5922_6_def P_0x5922_6_regions_def post: Q_memcpy_addr_0x5922_6_def regionset: P_0x5922_6_regions_set_def)

definition P_0x5927_7 :: state_pred where
  \<open>P_0x5927_7 \<sigma> \<equiv> RIP \<sigma> = 0x5927 \<and> RAX \<sigma> = memcpy_0x5922_retval \<and> RDX \<sigma> = (if' ((\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word)::64 word) \<le> RBX \<sigma> then (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) else (RBX \<sigma>::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (if' ((\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word)::64 word) \<le> RBX \<sigma> then (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) else (RBX \<sigma>::64 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5927\<close>
declare P_0x5927_7_def[Ps]

definition P_0x5927_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5927_7_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, (((((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word) + 0x8), 8),
    (4, (((R12 \<sigma> << 4)::64 word) + (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5927_7_regions :: state_pred where
  \<open>P_0x5927_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5927_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x593f_7 :: state_pred where
  \<open>Q_0x593f_7 \<sigma> \<equiv> RIP \<sigma> = 0x593f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x593f_7_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_7_0x5927_0x593d_7[blocks]:
  assumes \<open>(P_0x5927_7 && P_0x5927_7_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x593d 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x593f_7 ?\<sigma> \<and> block_usage P_0x5927_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5927_7_def P_0x5927_7_regions_def post: Q_0x593f_7_def regionset: P_0x5927_7_regions_set_def)

definition P_0x593f_true_8 :: state_pred where
  \<open>P_0x593f_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x593f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x593f_true_8_def[Ps]

definition P_0x593f_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x593f_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x593f_true_8_regions :: state_pred where
  \<open>P_0x593f_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x593f_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5900_8 :: state_pred where
  \<open>Q_0x5900_8 \<sigma> \<equiv> RIP \<sigma> = 0x5900 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5900_8_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_1_0x593f_0x593f_8[blocks]:
  assumes \<open>(P_0x593f_true_8 && P_0x593f_true_8_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x593f 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5900_8 ?\<sigma> \<and> block_usage P_0x593f_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x593f_true_8_def P_0x593f_true_8_regions_def post: Q_0x5900_8_def regionset: P_0x593f_true_8_regions_set_def)

definition P_0x593f_false_9 :: state_pred where
  \<open>P_0x593f_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x593f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x593f_false_9_def[Ps]

definition P_0x593f_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x593f_false_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x593f_false_9_regions :: state_pred where
  \<open>P_0x593f_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x593f_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5941_9 :: state_pred where
  \<open>Q_0x5941_9 \<sigma> \<equiv> RIP \<sigma> = 0x5941 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5941_9_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_1_0x593f_0x593f_9[blocks]:
  assumes \<open>(P_0x593f_false_9 && P_0x593f_false_9_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x593f 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5941_9 ?\<sigma> \<and> block_usage P_0x593f_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x593f_false_9_def P_0x593f_false_9_regions_def post: Q_0x5941_9_def regionset: P_0x593f_false_9_regions_set_def)

definition P_0x5941_10 :: state_pred where
  \<open>P_0x5941_10 \<sigma> \<equiv> RIP \<sigma> = 0x5941 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5941_10_def[Ps]

definition P_0x5941_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5941_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x5941_10_regions :: state_pred where
  \<open>P_0x5941_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5941_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_10 :: state_pred where
  \<open>Q_ret_address_10 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word))\<close>
declare Q_ret_address_10_def[Qs]

schematic_goal qemu_iovec_from_buffer_0_6_0x5941_0x5949_10[blocks]:
  assumes \<open>(P_0x5941_10 && P_0x5941_10_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x5949 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_10 ?\<sigma> \<and> block_usage P_0x5941_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5941_10_def P_0x5941_10_regions_def post: Q_ret_address_10_def regionset: P_0x5941_10_regions_set_def)

definition qemu_iovec_from_buffer_acode :: ACode where
  \<open>qemu_iovec_from_buffer_acode =
    Block 2 0x58e3 0;
    IF jle THEN
      Block 2 0x594a (Suc 0)
    ELSE
      Block 8 0x58f2 2;
      IF ZF THEN
        Block (Suc 0) 0x58f5 3
      ELSE
        Block 4 0x58fd 4;
        WHILE P_0x5900_5 DO
          Block 10 0x591f 5;
          Block (Suc 0) 0x5922 6;
          CALL memcpy_acode;
          Block 7 0x593d 7;
          IF !ZF THEN
            Block (Suc 0) 0x593f 8
          ELSE
            Block (Suc 0) 0x593f 9
          FI
        OD
      FI;
      Block 6 0x5949 10
    FI
  \<close>

schematic_goal "qemu_iovec_from_buffer":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x58e5 \<longrightarrow> P_0x58e5_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x58e5 \<longrightarrow> P_0x58e5_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x58f5 \<longrightarrow> P_0x58f5_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x58f5 \<longrightarrow> P_0x58f5_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5900 \<longrightarrow> P_0x5900_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5922 \<longrightarrow> P_0x5922_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5927 \<longrightarrow> P_0x5927_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x593f \<longrightarrow> P_0x593f_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x593f \<longrightarrow> P_0x593f_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5941 \<longrightarrow> P_0x5941_10_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x5922_6}} \<box>memcpy_acode {{P_0x5927_7;M_0x5922}}\<close>
  shows \<open>{{?P}} qemu_iovec_from_buffer_acode {{?Q;?M}}\<close>
  apply (vcg acode: qemu_iovec_from_buffer_acode_def assms: assms)
           apply (vcg_while \<open>P_0x5900_5 || P_0x5941_10\<close> assms: assms)
            apply (vcg_step assms: assms)+
           apply (simp add: pred_logic Ps Qs assms)+
       apply (vcg_step assms: assms)+
          apply (simp add: assms)+
  done

end

end
