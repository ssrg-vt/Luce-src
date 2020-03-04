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
theory count_contiguous_clusters
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  assumes fetch:
    "fetch 0x131b0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdx))))), 3)"
    "fetch 0x131b3 \<equiv> (Unary (IS_8088 Not) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x131b6 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x131b9 \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour r10)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x131bc \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 78384)), 2)"
    "fetch 0x131be \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r9)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x131c1 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x131c4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x131c6 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x131c9 \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 78392)), 2)"
    "fetch 0x131cb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r11)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x131ce \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_Mult 8 (A_FromReg (General SixtyFour r9))))))), 4)"
    "fetch 0x131d2 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo r11)) (Storage (Reg (General ThirtyTwo rcx))), 4)"
    "fetch 0x131d6 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x131d9 \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x131dc \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r11)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x131df \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r11)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x131e2 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r11)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x131e5 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 78392)), 2)"
    "fetch 0x131e7 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 1)))), 3)"
    "fetch 0x131ea \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x131eb \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rbx)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x131ee \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r9)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x131f1 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x131f4 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rsi)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x131f7 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r10)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x131fa \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 78362)), 2)"
    "fetch 0x131fc \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x13200 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_Mult 8 (A_FromReg (General SixtyFour r9))))))), 4)"
    "fetch 0x13204 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r11)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Mult 1 (A_FromReg (General SixtyFour r10)))))), 4)"
    "fetch 0x13208 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r9)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x1320c \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1320f \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x13212 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x13215 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 78370)), 2)"
    "fetch 0x13217 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Reg (General SixtyFour r11))), 3)"
    "fetch 0x1321a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0x1321d \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x13220 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 78336)), 2)"
    "fetch 0x13222 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x13224 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x13225 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x13226 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x13230 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x13232 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x13233 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x13238 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x1323a \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>

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

locale "count_contiguous_clusters" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v R11\<^sub>0\<^sub>v R10\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>R11\<^sub>0 \<equiv> R11\<^sub>0\<^sub>v\<close>
definition \<open>R10\<^sub>0 \<equiv> R10\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x131b0_0 :: state_pred where
  \<open>P_0x131b0_0 \<sigma> \<equiv> RIP \<sigma> = 0x131b0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x131b0_0_def[Ps]

definition P_0x131b0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x131b0_0_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x131b0_0_regions :: state_pred where
  \<open>P_0x131b0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x131b0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x131bc_0 :: state_pred where
  \<open>Q_0x131bc_0 \<sigma> \<equiv> RIP \<sigma> = 0x131bc \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x131bc_0_def[Qs]

schematic_goal count_contiguous_clusters_0_4_0x131b0_0x131b9_0[blocks]:
  assumes \<open>(P_0x131b0_0 && P_0x131b0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x131b9 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x131bc_0 ?\<sigma> \<and> block_usage P_0x131b0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x131b0_0_def P_0x131b0_0_regions_def post: Q_0x131bc_0_def regionset: P_0x131b0_0_regions_set_def)

definition P_0x131bc_true_1 :: state_pred where
  \<open>P_0x131bc_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x131bc \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x131bc_true_1_def[Ps]

definition P_0x131bc_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x131bc_true_1_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x131bc_true_1_regions :: state_pred where
  \<open>P_0x131bc_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x131bc_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal count_contiguous_clusters_0_3_0x131bc_0x13232_1[blocks]:
  assumes \<open>(P_0x131bc_true_1 && P_0x131bc_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x13232 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x131bc_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x131bc_true_1_def P_0x131bc_true_1_regions_def post: Q_ret_address_1_def regionset: P_0x131bc_true_1_regions_set_def)

definition P_0x131bc_false_2 :: state_pred where
  \<open>P_0x131bc_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x131bc \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x131bc_false_2_def[Ps]

definition P_0x131bc_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x131bc_false_2_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x131bc_false_2_regions :: state_pred where
  \<open>P_0x131bc_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x131bc_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x131c9_2 :: state_pred where
  \<open>Q_0x131c9_2 \<sigma> \<equiv> RIP \<sigma> = 0x131c9 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x131c9_2_def[Qs]

schematic_goal count_contiguous_clusters_0_5_0x131bc_0x131c6_2[blocks]:
  assumes \<open>(P_0x131bc_false_2 && P_0x131bc_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x131c6 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x131c9_2 ?\<sigma> \<and> block_usage P_0x131bc_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x131bc_false_2_def P_0x131bc_false_2_regions_def post: Q_0x131c9_2_def regionset: P_0x131bc_false_2_regions_set_def)

definition P_0x131c9_true_3 :: state_pred where
  \<open>P_0x131c9_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x131c9 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x131c9_true_3_def[Ps]

definition P_0x131c9_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x131c9_true_3_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x131c9_true_3_regions :: state_pred where
  \<open>P_0x131c9_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x131c9_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_3 :: state_pred where
  \<open>Q_ret_address_3 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_3_def[Qs]

schematic_goal count_contiguous_clusters_0_3_0x131c9_0x1323a_3[blocks]:
  assumes \<open>(P_0x131c9_true_3 && P_0x131c9_true_3_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 3 0x1323a 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_3 ?\<sigma> \<and> block_usage P_0x131c9_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x131c9_true_3_def P_0x131c9_true_3_regions_def post: Q_ret_address_3_def regionset: P_0x131c9_true_3_regions_set_def)

definition P_0x131c9_false_4 :: state_pred where
  \<open>P_0x131c9_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x131c9 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x131c9_false_4_def[Ps]

definition P_0x131c9_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x131c9_false_4_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)), 8)
  }\<close>

definition P_0x131c9_false_4_regions :: state_pred where
  \<open>P_0x131c9_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x131c9_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x131e5_4 :: state_pred where
  \<open>Q_0x131e5_4 \<sigma> \<equiv> RIP \<sigma> = 0x131e5 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))::32 word))) 32 64::64 word)::64 word) + (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0)))) \<and> R10 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R9 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word)\<close>
declare Q_0x131e5_4_def[Qs]

schematic_goal count_contiguous_clusters_0_9_0x131c9_0x131e2_4[blocks]:
  assumes \<open>(P_0x131c9_false_4 && P_0x131c9_false_4_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 9 0x131e2 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x131e5_4 ?\<sigma> \<and> block_usage P_0x131c9_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x131c9_false_4_def P_0x131c9_false_4_regions_def post: Q_0x131e5_4_def regionset: P_0x131c9_false_4_regions_set_def)

definition P_0x131e5_true_5 :: state_pred where
  \<open>P_0x131e5_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x131e5 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))::32 word))) 32 64::64 word)::64 word) + (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0)))) \<and> R10 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R9 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word)\<close>
declare P_0x131e5_true_5_def[Ps]

definition P_0x131e5_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x131e5_true_5_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)), 8)
  }\<close>

definition P_0x131e5_true_5_regions :: state_pred where
  \<open>P_0x131e5_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x131e5_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_5 :: state_pred where
  \<open>Q_ret_address_5 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_5_def[Qs]

schematic_goal count_contiguous_clusters_0_3_0x131e5_0x1323a_5[blocks]:
  assumes \<open>(P_0x131e5_true_5 && P_0x131e5_true_5_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1323a 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_5 ?\<sigma> \<and> block_usage P_0x131e5_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x131e5_true_5_def P_0x131e5_true_5_regions_def post: Q_ret_address_5_def regionset: P_0x131e5_true_5_regions_set_def)

definition P_0x131e5_false_6 :: state_pred where
  \<open>P_0x131e5_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x131e5 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<langle>31,0\<rangle>RCX\<^sub>0::32 word))::32 word))) 32 64::64 word)::64 word) + (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0)))) \<and> R10 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R9 \<sigma> = (((bswap ((ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word)::64 word))::64 word)))::64 word) AND (NOT (R8\<^sub>0))) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word)\<close>
declare P_0x131e5_false_6_def[Ps]

definition P_0x131e5_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x131e5_false_6_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x131e5_false_6_regions :: state_pred where
  \<open>P_0x131e5_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x131e5_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1321a_6 :: state_pred where
  \<open>Q_0x1321a_6 \<sigma> \<equiv> RIP \<sigma> = 0x1321a \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1321a_6_def[Qs]

schematic_goal count_contiguous_clusters_0_9_0x131e5_0x131fa_6[blocks]:
  assumes \<open>(P_0x131e5_false_6 && P_0x131e5_false_6_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x131fa 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1321a_6 ?\<sigma> \<and> block_usage P_0x131e5_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x131e5_false_6_def P_0x131e5_false_6_regions_def post: Q_0x1321a_6_def regionset: P_0x131e5_false_6_regions_set_def)

definition P_0x1321a_7 :: state_pred where
  \<open>P_0x1321a_7 \<sigma> \<equiv> RIP \<sigma> = 0x1321a \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1321a_7_def[Ps]

definition P_0x1321a_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1321a_7_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1321a_7_regions :: state_pred where
  \<open>P_0x1321a_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1321a_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13220_7 :: state_pred where
  \<open>Q_0x13220_7 \<sigma> \<equiv> RIP \<sigma> = 0x13220 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R9 \<sigma>::32 word)) \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x13220_7_def[Qs]

schematic_goal count_contiguous_clusters_0_2_0x1321a_0x1321d_7[blocks]:
  assumes \<open>(P_0x1321a_7 && P_0x1321a_7_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1321d 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13220_7 ?\<sigma> \<and> block_usage P_0x1321a_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1321a_7_def P_0x1321a_7_regions_def post: Q_0x13220_7_def regionset: P_0x1321a_7_regions_set_def)

definition P_0x13220_true_8 :: state_pred where
  \<open>P_0x13220_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x13220 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R9 \<sigma>::32 word)) \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x13220_true_8_def[Ps]

definition P_0x13220_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13220_true_8_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R9 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x13220_true_8_regions :: state_pred where
  \<open>P_0x13220_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x13220_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13215_8 :: state_pred where
  \<open>Q_0x13215_8 \<sigma> \<equiv> RIP \<sigma> = 0x13215 \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + (\<langle>63,0\<rangle>((R10 \<sigma>::64 word) * 0x1)::64 word)) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x13215_8_def[Qs]

schematic_goal count_contiguous_clusters_0_7_0x13220_0x13212_8[blocks]:
  assumes \<open>(P_0x13220_true_8 && P_0x13220_true_8_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x13212 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13215_8 ?\<sigma> \<and> block_usage P_0x13220_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13220_true_8_def P_0x13220_true_8_regions_def post: Q_0x13215_8_def regionset: P_0x13220_true_8_regions_set_def)

definition P_0x13215_true_9 :: state_pred where
  \<open>P_0x13215_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x13215 \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + (\<langle>63,0\<rangle>((R10 \<sigma>::64 word) * 0x1)::64 word)) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x13215_true_9_def[Ps]

definition P_0x13215_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13215_true_9_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x13215_true_9_regions :: state_pred where
  \<open>P_0x13215_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x13215_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13222_9 :: state_pred where
  \<open>Q_0x13222_9 \<sigma> \<equiv> RIP \<sigma> = 0x13222 \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x13222_9_def[Qs]

schematic_goal count_contiguous_clusters_0_1_0x13215_0x13215_9[blocks]:
  assumes \<open>(P_0x13215_true_9 && P_0x13215_true_9_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x13215 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13222_9 ?\<sigma> \<and> block_usage P_0x13215_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13215_true_9_def P_0x13215_true_9_regions_def post: Q_0x13222_9_def regionset: P_0x13215_true_9_regions_set_def)

definition P_0x13215_false_10 :: state_pred where
  \<open>P_0x13215_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x13215 \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R11 \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + (\<langle>63,0\<rangle>((R10 \<sigma>::64 word) * 0x1)::64 word)) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x13215_false_10_def[Ps]

definition P_0x13215_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13215_false_10_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x13215_false_10_regions :: state_pred where
  \<open>P_0x13215_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x13215_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1321a_10 :: state_pred where
  \<open>Q_0x1321a_10 \<sigma> \<equiv> RIP \<sigma> = 0x1321a \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1321a_10_def[Qs]

schematic_goal count_contiguous_clusters_0_2_0x13215_0x13217_10[blocks]:
  assumes \<open>(P_0x13215_false_10 && P_0x13215_false_10_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x13217 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1321a_10 ?\<sigma> \<and> block_usage P_0x13215_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13215_false_10_def P_0x13215_false_10_regions_def post: Q_0x1321a_10_def regionset: P_0x13215_false_10_regions_set_def)

definition P_0x13220_false_11 :: state_pred where
  \<open>P_0x13220_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x13220 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R9 \<sigma>::32 word)) \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x13220_false_11_def[Ps]

definition P_0x13220_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13220_false_11_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x13220_false_11_regions :: state_pred where
  \<open>P_0x13220_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x13220_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13222_11 :: state_pred where
  \<open>Q_0x13222_11 \<sigma> \<equiv> RIP \<sigma> = 0x13222 \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x13222_11_def[Qs]

schematic_goal count_contiguous_clusters_0_1_0x13220_0x13220_11[blocks]:
  assumes \<open>(P_0x13220_false_11 && P_0x13220_false_11_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x13220 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13222_11 ?\<sigma> \<and> block_usage P_0x13220_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13220_false_11_def P_0x13220_false_11_regions_def post: Q_0x13222_11_def regionset: P_0x13220_false_11_regions_set_def)

definition P_0x13222_12 :: state_pred where
  \<open>P_0x13222_12 \<sigma> \<equiv> RIP \<sigma> = 0x13222 \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + RCX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x13222_12_def[Ps]

definition P_0x13222_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13222_12_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x13222_12_regions :: state_pred where
  \<open>P_0x13222_12_regions \<sigma> \<equiv> \<exists>regions. P_0x13222_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_12 :: state_pred where
  \<open>Q_ret_address_12 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> R8 \<sigma> = (NOT (R8\<^sub>0)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_12_def[Qs]

schematic_goal count_contiguous_clusters_0_3_0x13222_0x13225_12[blocks]:
  assumes \<open>(P_0x13222_12 && P_0x13222_12_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x13225 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_12 ?\<sigma> \<and> block_usage P_0x13222_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13222_12_def P_0x13222_12_regions_def post: Q_ret_address_12_def regionset: P_0x13222_12_regions_set_def)

definition count_contiguous_clusters_acode :: ACode where
  \<open>count_contiguous_clusters_acode =
    Block 4 0x131b9 0;
    IF ZF THEN
      Block 3 0x13232 (Suc 0)
    ELSE
      Block 5 0x131c6 2;
      IF jbe THEN
        Block 3 0x1323a 3
      ELSE
        Block 9 0x131e2 4;
        IF !ZF THEN
          Block 3 0x1323a 5
        ELSE
          Block 9 0x131fa 6;
          WHILE P_0x1321a_7 DO
            Block 2 0x1321d 7;
            IF !ZF THEN
              Block 7 0x13212 8;
              IF !ZF THEN
                Block (Suc 0) 0x13215 9
              ELSE
                Block 2 0x13217 10
              FI
            ELSE
              Block (Suc 0) 0x13220 11
            FI
          OD;
          Block 3 0x13225 12
        FI
      FI
    FI
  \<close>

schematic_goal "count_contiguous_clusters":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x131bc \<longrightarrow> P_0x131bc_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x131bc \<longrightarrow> P_0x131bc_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x131c9 \<longrightarrow> P_0x131c9_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x131c9 \<longrightarrow> P_0x131c9_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x131e5 \<longrightarrow> P_0x131e5_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x131e5 \<longrightarrow> P_0x131e5_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1321a \<longrightarrow> P_0x1321a_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13220 \<longrightarrow> P_0x13220_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13215 \<longrightarrow> P_0x13215_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13215 \<longrightarrow> P_0x13215_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13220 \<longrightarrow> P_0x13220_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13222 \<longrightarrow> P_0x13222_12_regions \<sigma>\<close>
  shows \<open>{{?P}} count_contiguous_clusters_acode {{?Q;?M}}\<close>
  apply (vcg acode: count_contiguous_clusters_acode_def assms: assms)
            apply (vcg_while \<open>P_0x1321a_7 || P_0x13222_12\<close> assms: assms)
  done

end

end
