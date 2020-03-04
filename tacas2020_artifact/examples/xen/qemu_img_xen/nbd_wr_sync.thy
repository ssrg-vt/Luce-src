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
theory nbd_wr_sync
  imports "../../../isabelle/VCG/HTriple"
begin



locale "qemu_img_xen" = execution_context + exec_code +
  fixes recv_0x16d22_retval\<^sub>v errno_location_0x16d2d_retval\<^sub>v send_0x16d50_retval\<^sub>v errno_location_addr recv_addr send_addr :: \<open>64 word\<close>
    and errno_location_acode recv_acode send_acode :: ACode
  assumes fetch:
    "fetch 0x16ce0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x16ce2 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x16ce4 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x16ce6 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x16ce7 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x16ce8 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x16ceb \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 93502)), 2)"
    "fetch 0x16ced \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x16cf0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x16cf3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x16cf6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x16cf9 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x16cfb \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 93453)), 2)"
    "fetch 0x16cfd \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x16d00 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x16d03 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 93504)), 2)"
    "fetch 0x16d05 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x16d08 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x16d0b \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 93504)), 2)"
    "fetch 0x16d0d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x16d10 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rbx))) (A_WordConstant 0))))), 5)"
    "fetch 0x16d15 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x16d17 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x16d1a \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x16d1d \<equiv> (Binary (IS_8088 Test) (Reg (General Eight r12)) (Storage (Reg (General Eight r12))), 3)"
    "fetch 0x16d20 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 93520)), 2)"
    "fetch 0x16d22 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''recv'')), 5)"
    "fetch 0x16d27 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 18446744073709551615)), 4)"
    "fetch 0x16d2b \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 93440)), 2)"
    "fetch 0x16d2d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x16d32 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x16d34 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 11)), 3)"
    "fetch 0x16d37 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 93448)), 2)"
    "fetch 0x16d39 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4)), 3)"
    "fetch 0x16d3c \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 93448)), 2)"
    "fetch 0x16d3e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x16d40 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x16d43 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x16d44 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x16d45 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x16d47 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x16d49 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x16d4b \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x16d4c \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x16d50 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''send'')), 5)"
    "fetch 0x16d55 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 93479)), 2)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and errno_location\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__errno_location'') = errno_location_addr\<close>
    and recv\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''recv'') = recv_addr\<close>
    and send\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''send'') = send_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>recv_0x16d22_retval \<equiv> recv_0x16d22_retval\<^sub>v\<close>
definition \<open>errno_location_0x16d2d_retval \<equiv> errno_location_0x16d2d_retval\<^sub>v\<close>
definition \<open>send_0x16d50_retval \<equiv> send_0x16d50_retval\<^sub>v\<close>

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

locale "nbd_wr_sync" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x16ce0_0 :: state_pred where
  \<open>P_0x16ce0_0 \<sigma> \<equiv> RIP \<sigma> = 0x16ce0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x16ce0_0_def[Ps]

definition P_0x16ce0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16ce0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16ce0_0_regions :: state_pred where
  \<open>P_0x16ce0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x16ce0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16ceb_0 :: state_pred where
  \<open>Q_0x16ceb_0 \<sigma> \<equiv> RIP \<sigma> = 0x16ceb \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16ceb_0_def[Qs]

schematic_goal nbd_wr_sync_0_6_0x16ce0_0x16ce8_0[blocks]:
  assumes \<open>(P_0x16ce0_0 && P_0x16ce0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x16ce8 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16ceb_0 ?\<sigma> \<and> block_usage P_0x16ce0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16ce0_0_def P_0x16ce0_0_regions_def post: Q_0x16ceb_0_def regionset: P_0x16ce0_0_regions_set_def)

definition P_0x16ceb_true_1 :: state_pred where
  \<open>P_0x16ceb_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x16ceb \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16ceb_true_1_def[Ps]

definition P_0x16ceb_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16ceb_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16ceb_true_1_regions :: state_pred where
  \<open>P_0x16ceb_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x16ceb_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d40_1 :: state_pred where
  \<open>Q_0x16d40_1 \<sigma> \<equiv> RIP \<sigma> = 0x16d40 \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d40_1_def[Qs]

schematic_goal nbd_wr_sync_0_2_0x16ceb_0x16d3e_1[blocks]:
  assumes \<open>(P_0x16ceb_true_1 && P_0x16ceb_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x16d3e (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d40_1 ?\<sigma> \<and> block_usage P_0x16ceb_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16ceb_true_1_def P_0x16ceb_true_1_regions_def post: Q_0x16d40_1_def regionset: P_0x16ceb_true_1_regions_set_def)

definition P_0x16ceb_false_2 :: state_pred where
  \<open>P_0x16ceb_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x16ceb \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16ceb_false_2_def[Ps]

definition P_0x16ceb_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16ceb_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16ceb_false_2_regions :: state_pred where
  \<open>P_0x16ceb_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x16ceb_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d0d_2 :: state_pred where
  \<open>Q_0x16d0d_2 \<sigma> \<equiv> RIP \<sigma> = 0x16d0d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d0d_2_def[Qs]

schematic_goal nbd_wr_sync_0_7_0x16ceb_0x16cfb_2[blocks]:
  assumes \<open>(P_0x16ceb_false_2 && P_0x16ceb_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x16cfb 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d0d_2 ?\<sigma> \<and> block_usage P_0x16ceb_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16ceb_false_2_def P_0x16ceb_false_2_regions_def post: Q_0x16d0d_2_def regionset: P_0x16ceb_false_2_regions_set_def)

definition P_0x16d0d_3 :: state_pred where
  \<open>P_0x16d0d_3 \<sigma> \<equiv> RIP \<sigma> = 0x16d0d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d0d_3_def[Ps]

definition P_0x16d0d_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d0d_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d0d_3_regions :: state_pred where
  \<open>P_0x16d0d_3_regions \<sigma> \<equiv> \<exists>regions. P_0x16d0d_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d20_3 :: state_pred where
  \<open>Q_0x16d20_3 \<sigma> \<equiv> RIP \<sigma> = 0x16d20 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d20_3_def[Qs]

schematic_goal nbd_wr_sync_0_6_0x16d0d_0x16d1d_3[blocks]:
  assumes \<open>(P_0x16d0d_3 && P_0x16d0d_3_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x16d1d 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d20_3 ?\<sigma> \<and> block_usage P_0x16d0d_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d0d_3_def P_0x16d0d_3_regions_def post: Q_0x16d20_3_def regionset: P_0x16d0d_3_regions_set_def)

definition P_0x16d20_true_4 :: state_pred where
  \<open>P_0x16d20_true_4 \<sigma> \<equiv> RIP \<sigma> = 0x16d20 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d20_true_4_def[Ps]

definition P_0x16d20_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d20_true_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d20_true_4_regions :: state_pred where
  \<open>P_0x16d20_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0x16d20_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d50_4 :: state_pred where
  \<open>Q_0x16d50_4 \<sigma> \<equiv> RIP \<sigma> = 0x16d50 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d50_4_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d20_0x16d20_4[blocks]:
  assumes \<open>(P_0x16d20_true_4 && P_0x16d20_true_4_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d20 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d50_4 ?\<sigma> \<and> block_usage P_0x16d20_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d20_true_4_def P_0x16d20_true_4_regions_def post: Q_0x16d50_4_def regionset: P_0x16d20_true_4_regions_set_def)

definition P_0x16d50_5 :: state_pred where
  \<open>P_0x16d50_5 \<sigma> \<equiv> RIP \<sigma> = 0x16d50 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d50_5_def[Ps]

definition P_0x16d50_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d50_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x16d50_5_regions :: state_pred where
  \<open>P_0x16d50_5_regions \<sigma> \<equiv> \<exists>regions. P_0x16d50_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_send_addr_0x16d50_5 :: state_pred where
  \<open>Q_send_addr_0x16d50_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = send_addr \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x16d55\<close>
declare Q_send_addr_0x16d50_5_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d50_0x16d50_5[blocks]:
  assumes \<open>(P_0x16d50_5 && P_0x16d50_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d50 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_send_addr_0x16d50_5 ?\<sigma> \<and> block_usage P_0x16d50_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d50_5_def P_0x16d50_5_regions_def post: Q_send_addr_0x16d50_5_def regionset: P_0x16d50_5_regions_set_def)

definition P_0x16d55_6 :: state_pred where
  \<open>P_0x16d55_6 \<sigma> \<equiv> RIP \<sigma> = 0x16d55 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x16d55\<close>
declare P_0x16d55_6_def[Ps]

definition P_0x16d55_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d55_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x16d55_6_regions :: state_pred where
  \<open>P_0x16d55_6_regions \<sigma> \<equiv> \<exists>regions. P_0x16d55_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d27_6 :: state_pred where
  \<open>Q_0x16d27_6 \<sigma> \<equiv> RIP \<sigma> = 0x16d27 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d27_6_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d55_0x16d55_6[blocks]:
  assumes \<open>(P_0x16d55_6 && P_0x16d55_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d55 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d27_6 ?\<sigma> \<and> block_usage P_0x16d55_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d55_6_def P_0x16d55_6_regions_def post: Q_0x16d27_6_def regionset: P_0x16d55_6_regions_set_def)

definition P_0x16d20_false_7 :: state_pred where
  \<open>P_0x16d20_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x16d20 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d20_false_7_def[Ps]

definition P_0x16d20_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d20_false_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d20_false_7_regions :: state_pred where
  \<open>P_0x16d20_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x16d20_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d22_7 :: state_pred where
  \<open>Q_0x16d22_7 \<sigma> \<equiv> RIP \<sigma> = 0x16d22 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d22_7_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d20_0x16d20_7[blocks]:
  assumes \<open>(P_0x16d20_false_7 && P_0x16d20_false_7_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d20 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d22_7 ?\<sigma> \<and> block_usage P_0x16d20_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d20_false_7_def P_0x16d20_false_7_regions_def post: Q_0x16d22_7_def regionset: P_0x16d20_false_7_regions_set_def)

definition P_0x16d22_8 :: state_pred where
  \<open>P_0x16d22_8 \<sigma> \<equiv> RIP \<sigma> = 0x16d22 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d22_8_def[Ps]

definition P_0x16d22_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d22_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x16d22_8_regions :: state_pred where
  \<open>P_0x16d22_8_regions \<sigma> \<equiv> \<exists>regions. P_0x16d22_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_recv_addr_0x16d22_8 :: state_pred where
  \<open>Q_recv_addr_0x16d22_8 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = recv_addr \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_recv_addr_0x16d22_8_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d22_0x16d22_8[blocks]:
  assumes \<open>(P_0x16d22_8 && P_0x16d22_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d22 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_recv_addr_0x16d22_8 ?\<sigma> \<and> block_usage P_0x16d22_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d22_8_def P_0x16d22_8_regions_def post: Q_recv_addr_0x16d22_8_def regionset: P_0x16d22_8_regions_set_def)

definition P_0x16d27_9 :: state_pred where
  \<open>P_0x16d27_9 \<sigma> \<equiv> RIP \<sigma> = 0x16d27 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d27_9_def[Ps]

definition P_0x16d27_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d27_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d27_9_regions :: state_pred where
  \<open>P_0x16d27_9_regions \<sigma> \<equiv> \<exists>regions. P_0x16d27_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d2b_9 :: state_pred where
  \<open>Q_0x16d2b_9 \<sigma> \<equiv> RIP \<sigma> = 0x16d2b \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d2b_9_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d27_0x16d27_9[blocks]:
  assumes \<open>(P_0x16d27_9 && P_0x16d27_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d27 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d2b_9 ?\<sigma> \<and> block_usage P_0x16d27_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d27_9_def P_0x16d27_9_regions_def post: Q_0x16d2b_9_def regionset: P_0x16d27_9_regions_set_def)

definition P_0x16d2b_true_10 :: state_pred where
  \<open>P_0x16d2b_true_10 \<sigma> \<equiv> RIP \<sigma> = 0x16d2b \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d2b_true_10_def[Ps]

definition P_0x16d2b_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d2b_true_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d2b_true_10_regions :: state_pred where
  \<open>P_0x16d2b_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0x16d2b_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d03_10 :: state_pred where
  \<open>Q_0x16d03_10 \<sigma> \<equiv> RIP \<sigma> = 0x16d03 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d03_10_def[Qs]

schematic_goal nbd_wr_sync_0_2_0x16d2b_0x16d00_10[blocks]:
  assumes \<open>(P_0x16d2b_true_10 && P_0x16d2b_true_10_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x16d00 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d03_10 ?\<sigma> \<and> block_usage P_0x16d2b_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d2b_true_10_def P_0x16d2b_true_10_regions_def post: Q_0x16d03_10_def regionset: P_0x16d2b_true_10_regions_set_def)

definition P_0x16d03_true_11 :: state_pred where
  \<open>P_0x16d03_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x16d03 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d03_true_11_def[Ps]

definition P_0x16d03_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d03_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d03_true_11_regions :: state_pred where
  \<open>P_0x16d03_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x16d03_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d40_11 :: state_pred where
  \<open>Q_0x16d40_11 \<sigma> \<equiv> RIP \<sigma> = 0x16d40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d40_11_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d03_0x16d03_11[blocks]:
  assumes \<open>(P_0x16d03_true_11 && P_0x16d03_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d03 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d40_11 ?\<sigma> \<and> block_usage P_0x16d03_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d03_true_11_def P_0x16d03_true_11_regions_def post: Q_0x16d40_11_def regionset: P_0x16d03_true_11_regions_set_def)

definition P_0x16d03_false_12 :: state_pred where
  \<open>P_0x16d03_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x16d03 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d03_false_12_def[Ps]

definition P_0x16d03_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d03_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d03_false_12_regions :: state_pred where
  \<open>P_0x16d03_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x16d03_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d08_12 :: state_pred where
  \<open>Q_0x16d08_12 \<sigma> \<equiv> RIP \<sigma> = 0x16d08 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d08_12_def[Qs]

schematic_goal nbd_wr_sync_0_2_0x16d03_0x16d05_12[blocks]:
  assumes \<open>(P_0x16d03_false_12 && P_0x16d03_false_12_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x16d05 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d08_12 ?\<sigma> \<and> block_usage P_0x16d03_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d03_false_12_def P_0x16d03_false_12_regions_def post: Q_0x16d08_12_def regionset: P_0x16d03_false_12_regions_set_def)

definition P_0x16d08_13 :: state_pred where
  \<open>P_0x16d08_13 \<sigma> \<equiv> RIP \<sigma> = 0x16d08 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d08_13_def[Ps]

definition P_0x16d08_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d08_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d08_13_regions :: state_pred where
  \<open>P_0x16d08_13_regions \<sigma> \<equiv> \<exists>regions. P_0x16d08_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d0b_13 :: state_pred where
  \<open>Q_0x16d0b_13 \<sigma> \<equiv> RIP \<sigma> = 0x16d0b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d0b_13_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d08_0x16d08_13[blocks]:
  assumes \<open>(P_0x16d08_13 && P_0x16d08_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d08 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d0b_13 ?\<sigma> \<and> block_usage P_0x16d08_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d08_13_def P_0x16d08_13_regions_def post: Q_0x16d0b_13_def regionset: P_0x16d08_13_regions_set_def)

definition P_0x16d0b_true_14 :: state_pred where
  \<open>P_0x16d0b_true_14 \<sigma> \<equiv> RIP \<sigma> = 0x16d0b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d0b_true_14_def[Ps]

definition P_0x16d0b_true_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d0b_true_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d0b_true_14_regions :: state_pred where
  \<open>P_0x16d0b_true_14_regions \<sigma> \<equiv> \<exists>regions. P_0x16d0b_true_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d40_14 :: state_pred where
  \<open>Q_0x16d40_14 \<sigma> \<equiv> RIP \<sigma> = 0x16d40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d40_14_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d0b_0x16d0b_14[blocks]:
  assumes \<open>(P_0x16d0b_true_14 && P_0x16d0b_true_14_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d0b 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d40_14 ?\<sigma> \<and> block_usage P_0x16d0b_true_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d0b_true_14_def P_0x16d0b_true_14_regions_def post: Q_0x16d40_14_def regionset: P_0x16d0b_true_14_regions_set_def)

definition P_0x16d0b_false_15 :: state_pred where
  \<open>P_0x16d0b_false_15 \<sigma> \<equiv> RIP \<sigma> = 0x16d0b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d0b_false_15_def[Ps]

definition P_0x16d0b_false_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d0b_false_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d0b_false_15_regions :: state_pred where
  \<open>P_0x16d0b_false_15_regions \<sigma> \<equiv> \<exists>regions. P_0x16d0b_false_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d0d_15 :: state_pred where
  \<open>Q_0x16d0d_15 \<sigma> \<equiv> RIP \<sigma> = 0x16d0d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d0d_15_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d0b_0x16d0b_15[blocks]:
  assumes \<open>(P_0x16d0b_false_15 && P_0x16d0b_false_15_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d0b 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d0d_15 ?\<sigma> \<and> block_usage P_0x16d0b_false_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d0b_false_15_def P_0x16d0b_false_15_regions_def post: Q_0x16d0d_15_def regionset: P_0x16d0b_false_15_regions_set_def)

definition P_0x16d2b_false_16 :: state_pred where
  \<open>P_0x16d2b_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x16d2b \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d2b_false_16_def[Ps]

definition P_0x16d2b_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d2b_false_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d2b_false_16_regions :: state_pred where
  \<open>P_0x16d2b_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x16d2b_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d2d_16 :: state_pred where
  \<open>Q_0x16d2d_16 \<sigma> \<equiv> RIP \<sigma> = 0x16d2d \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d2d_16_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d2b_0x16d2b_16[blocks]:
  assumes \<open>(P_0x16d2b_false_16 && P_0x16d2b_false_16_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d2b 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d2d_16 ?\<sigma> \<and> block_usage P_0x16d2b_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d2b_false_16_def P_0x16d2b_false_16_regions_def post: Q_0x16d2d_16_def regionset: P_0x16d2b_false_16_regions_set_def)

definition P_0x16d2d_17 :: state_pred where
  \<open>P_0x16d2d_17 \<sigma> \<equiv> RIP \<sigma> = 0x16d2d \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d2d_17_def[Ps]

definition P_0x16d2d_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d2d_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x16d2d_17_regions :: state_pred where
  \<open>P_0x16d2d_17_regions \<sigma> \<equiv> \<exists>regions. P_0x16d2d_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x16d2d_17 :: state_pred where
  \<open>Q_errno_location_addr_0x16d2d_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = errno_location_addr \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x16d32\<close>
declare Q_errno_location_addr_0x16d2d_17_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d2d_0x16d2d_17[blocks]:
  assumes \<open>(P_0x16d2d_17 && P_0x16d2d_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d2d 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x16d2d_17 ?\<sigma> \<and> block_usage P_0x16d2d_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d2d_17_def P_0x16d2d_17_regions_def post: Q_errno_location_addr_0x16d2d_17_def regionset: P_0x16d2d_17_regions_set_def)

definition P_0x16d32_18 :: state_pred where
  \<open>P_0x16d32_18 \<sigma> \<equiv> RIP \<sigma> = 0x16d32 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x16d32\<close>
declare P_0x16d32_18_def[Ps]

definition P_0x16d32_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d32_18_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x16d32_18_regions :: state_pred where
  \<open>P_0x16d32_18_regions \<sigma> \<equiv> \<exists>regions. P_0x16d32_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d37_18 :: state_pred where
  \<open>Q_0x16d37_18 \<sigma> \<equiv> RIP \<sigma> = 0x16d37 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x16d32\<close>
declare Q_0x16d37_18_def[Qs]

schematic_goal nbd_wr_sync_0_2_0x16d32_0x16d34_18[blocks]:
  assumes \<open>(P_0x16d32_18 && P_0x16d32_18_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x16d34 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d37_18 ?\<sigma> \<and> block_usage P_0x16d32_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d32_18_def P_0x16d32_18_regions_def post: Q_0x16d37_18_def regionset: P_0x16d32_18_regions_set_def)

definition P_0x16d37_true_19 :: state_pred where
  \<open>P_0x16d37_true_19 \<sigma> \<equiv> RIP \<sigma> = 0x16d37 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x16d32\<close>
declare P_0x16d37_true_19_def[Ps]

definition P_0x16d37_true_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d37_true_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x16d37_true_19_regions :: state_pred where
  \<open>P_0x16d37_true_19_regions \<sigma> \<equiv> \<exists>regions. P_0x16d37_true_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d0b_19 :: state_pred where
  \<open>Q_0x16d0b_19 \<sigma> \<equiv> RIP \<sigma> = 0x16d0b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d0b_19_def[Qs]

schematic_goal nbd_wr_sync_0_2_0x16d37_0x16d08_19[blocks]:
  assumes \<open>(P_0x16d37_true_19 && P_0x16d37_true_19_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x16d08 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d0b_19 ?\<sigma> \<and> block_usage P_0x16d37_true_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d37_true_19_def P_0x16d37_true_19_regions_def post: Q_0x16d0b_19_def regionset: P_0x16d37_true_19_regions_set_def)

definition P_0x16d0b_true_20 :: state_pred where
  \<open>P_0x16d0b_true_20 \<sigma> \<equiv> RIP \<sigma> = 0x16d0b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d0b_true_20_def[Ps]

definition P_0x16d0b_true_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d0b_true_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d0b_true_20_regions :: state_pred where
  \<open>P_0x16d0b_true_20_regions \<sigma> \<equiv> \<exists>regions. P_0x16d0b_true_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d40_20 :: state_pred where
  \<open>Q_0x16d40_20 \<sigma> \<equiv> RIP \<sigma> = 0x16d40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d40_20_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d0b_0x16d0b_20[blocks]:
  assumes \<open>(P_0x16d0b_true_20 && P_0x16d0b_true_20_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d0b 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d40_20 ?\<sigma> \<and> block_usage P_0x16d0b_true_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d0b_true_20_def P_0x16d0b_true_20_regions_def post: Q_0x16d40_20_def regionset: P_0x16d0b_true_20_regions_set_def)

definition P_0x16d0b_false_21 :: state_pred where
  \<open>P_0x16d0b_false_21 \<sigma> \<equiv> RIP \<sigma> = 0x16d0b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d0b_false_21_def[Ps]

definition P_0x16d0b_false_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d0b_false_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d0b_false_21_regions :: state_pred where
  \<open>P_0x16d0b_false_21_regions \<sigma> \<equiv> \<exists>regions. P_0x16d0b_false_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d0d_21 :: state_pred where
  \<open>Q_0x16d0d_21 \<sigma> \<equiv> RIP \<sigma> = 0x16d0d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d0d_21_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d0b_0x16d0b_21[blocks]:
  assumes \<open>(P_0x16d0b_false_21 && P_0x16d0b_false_21_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d0b 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d0d_21 ?\<sigma> \<and> block_usage P_0x16d0b_false_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d0b_false_21_def P_0x16d0b_false_21_regions_def post: Q_0x16d0d_21_def regionset: P_0x16d0b_false_21_regions_set_def)

definition P_0x16d37_false_22 :: state_pred where
  \<open>P_0x16d37_false_22 \<sigma> \<equiv> RIP \<sigma> = 0x16d37 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x16d32\<close>
declare P_0x16d37_false_22_def[Ps]

definition P_0x16d37_false_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d37_false_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x16d37_false_22_regions :: state_pred where
  \<open>P_0x16d37_false_22_regions \<sigma> \<equiv> \<exists>regions. P_0x16d37_false_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d3c_22 :: state_pred where
  \<open>Q_0x16d3c_22 \<sigma> \<equiv> RIP \<sigma> = 0x16d3c \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x16d32\<close>
declare Q_0x16d3c_22_def[Qs]

schematic_goal nbd_wr_sync_0_2_0x16d37_0x16d39_22[blocks]:
  assumes \<open>(P_0x16d37_false_22 && P_0x16d37_false_22_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x16d39 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d3c_22 ?\<sigma> \<and> block_usage P_0x16d37_false_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d37_false_22_def P_0x16d37_false_22_regions_def post: Q_0x16d3c_22_def regionset: P_0x16d37_false_22_regions_set_def)

definition P_0x16d3c_true_23 :: state_pred where
  \<open>P_0x16d3c_true_23 \<sigma> \<equiv> RIP \<sigma> = 0x16d3c \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x16d32\<close>
declare P_0x16d3c_true_23_def[Ps]

definition P_0x16d3c_true_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d3c_true_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x16d3c_true_23_regions :: state_pred where
  \<open>P_0x16d3c_true_23_regions \<sigma> \<equiv> \<exists>regions. P_0x16d3c_true_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d0b_23 :: state_pred where
  \<open>Q_0x16d0b_23 \<sigma> \<equiv> RIP \<sigma> = 0x16d0b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d0b_23_def[Qs]

schematic_goal nbd_wr_sync_0_2_0x16d3c_0x16d08_23[blocks]:
  assumes \<open>(P_0x16d3c_true_23 && P_0x16d3c_true_23_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x16d08 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d0b_23 ?\<sigma> \<and> block_usage P_0x16d3c_true_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d3c_true_23_def P_0x16d3c_true_23_regions_def post: Q_0x16d0b_23_def regionset: P_0x16d3c_true_23_regions_set_def)

definition P_0x16d0b_true_24 :: state_pred where
  \<open>P_0x16d0b_true_24 \<sigma> \<equiv> RIP \<sigma> = 0x16d0b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d0b_true_24_def[Ps]

definition P_0x16d0b_true_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d0b_true_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d0b_true_24_regions :: state_pred where
  \<open>P_0x16d0b_true_24_regions \<sigma> \<equiv> \<exists>regions. P_0x16d0b_true_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d40_24 :: state_pred where
  \<open>Q_0x16d40_24 \<sigma> \<equiv> RIP \<sigma> = 0x16d40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d40_24_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d0b_0x16d0b_24[blocks]:
  assumes \<open>(P_0x16d0b_true_24 && P_0x16d0b_true_24_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d0b 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d40_24 ?\<sigma> \<and> block_usage P_0x16d0b_true_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d0b_true_24_def P_0x16d0b_true_24_regions_def post: Q_0x16d40_24_def regionset: P_0x16d0b_true_24_regions_set_def)

definition P_0x16d0b_false_25 :: state_pred where
  \<open>P_0x16d0b_false_25 \<sigma> \<equiv> RIP \<sigma> = 0x16d0b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d0b_false_25_def[Ps]

definition P_0x16d0b_false_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d0b_false_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d0b_false_25_regions :: state_pred where
  \<open>P_0x16d0b_false_25_regions \<sigma> \<equiv> \<exists>regions. P_0x16d0b_false_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d0d_25 :: state_pred where
  \<open>Q_0x16d0d_25 \<sigma> \<equiv> RIP \<sigma> = 0x16d0d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d0d_25_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d0b_0x16d0b_25[blocks]:
  assumes \<open>(P_0x16d0b_false_25 && P_0x16d0b_false_25_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d0b 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d0d_25 ?\<sigma> \<and> block_usage P_0x16d0b_false_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d0b_false_25_def P_0x16d0b_false_25_regions_def post: Q_0x16d0d_25_def regionset: P_0x16d0b_false_25_regions_set_def)

definition P_0x16d3c_false_26 :: state_pred where
  \<open>P_0x16d3c_false_26 \<sigma> \<equiv> RIP \<sigma> = 0x16d3c \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) - RBX \<sigma>) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x16d32\<close>
declare P_0x16d3c_false_26_def[Ps]

definition P_0x16d3c_false_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d3c_false_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x16d3c_false_26_regions :: state_pred where
  \<open>P_0x16d3c_false_26_regions \<sigma> \<equiv> \<exists>regions. P_0x16d3c_false_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d3e_26 :: state_pred where
  \<open>Q_0x16d3e_26 \<sigma> \<equiv> RIP \<sigma> = 0x16d3e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d3e_26_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d3c_0x16d3c_26[blocks]:
  assumes \<open>(P_0x16d3c_false_26 && P_0x16d3c_false_26_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d3c 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d3e_26 ?\<sigma> \<and> block_usage P_0x16d3c_false_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d3c_false_26_def P_0x16d3c_false_26_regions_def post: Q_0x16d3e_26_def regionset: P_0x16d3c_false_26_regions_set_def)

definition P_0x16d3e_27 :: state_pred where
  \<open>P_0x16d3e_27 \<sigma> \<equiv> RIP \<sigma> = 0x16d3e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d3e_27_def[Ps]

definition P_0x16d3e_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d3e_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d3e_27_regions :: state_pred where
  \<open>P_0x16d3e_27_regions \<sigma> \<equiv> \<exists>regions. P_0x16d3e_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16d40_27 :: state_pred where
  \<open>Q_0x16d40_27 \<sigma> \<equiv> RIP \<sigma> = 0x16d40 \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x16d40_27_def[Qs]

schematic_goal nbd_wr_sync_0_1_0x16d3e_0x16d3e_27[blocks]:
  assumes \<open>(P_0x16d3e_27 && P_0x16d3e_27_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16d3e 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16d40_27 ?\<sigma> \<and> block_usage P_0x16d3e_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d3e_27_def P_0x16d3e_27_regions_def post: Q_0x16d40_27_def regionset: P_0x16d3e_27_regions_set_def)

definition P_0x16d40_28 :: state_pred where
  \<open>P_0x16d40_28 \<sigma> \<equiv> RIP \<sigma> = 0x16d40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x16d40_28_def[Ps]

definition P_0x16d40_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16d40_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x16d40_28_regions :: state_pred where
  \<open>P_0x16d40_28_regions \<sigma> \<equiv> \<exists>regions. P_0x16d40_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_28 :: state_pred where
  \<open>Q_ret_address_28 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_28_def[Qs]

schematic_goal nbd_wr_sync_0_7_0x16d40_0x16d4b_28[blocks]:
  assumes \<open>(P_0x16d40_28 && P_0x16d40_28_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x16d4b 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_28 ?\<sigma> \<and> block_usage P_0x16d40_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16d40_28_def P_0x16d40_28_regions_def post: Q_ret_address_28_def regionset: P_0x16d40_28_regions_set_def)

definition nbd_wr_sync_acode :: ACode where
  \<open>nbd_wr_sync_acode =
    Block 6 0x16ce8 0;
    IF ZF THEN
      Block 2 0x16d3e (Suc 0)
    ELSE
      Block 7 0x16cfb 2;
      WHILE P_0x16d0d_3 DO
        Block 6 0x16d1d 3;
        IF ZF THEN
          Block (Suc 0) 0x16d20 4;
          Block (Suc 0) 0x16d50 5;
          CALL send_acode;
          Block (Suc 0) 0x16d55 6
        ELSE
          Block (Suc 0) 0x16d20 7;
          Block (Suc 0) 0x16d22 8;
          CALL recv_acode
        FI;
        Block (Suc 0) 0x16d27 9;
        IF !ZF THEN
          Block 2 0x16d00 10;
          IF ZF THEN
            Block (Suc 0) 0x16d03 11
          ELSE
            Block 2 0x16d05 12;
            Block (Suc 0) 0x16d08 13;
            IF jbe THEN
              Block (Suc 0) 0x16d0b 14
            ELSE
              Block (Suc 0) 0x16d0b 15
            FI
          FI
        ELSE
          Block (Suc 0) 0x16d2b 16;
          Block (Suc 0) 0x16d2d 17;
          CALL errno_location_acode;
          Block 2 0x16d34 18;
          IF ZF THEN
            Block 2 0x16d08 19;
            IF jbe THEN
              Block (Suc 0) 0x16d0b 20
            ELSE
              Block (Suc 0) 0x16d0b 21
            FI
          ELSE
            Block 2 0x16d39 22;
            IF ZF THEN
              Block 2 0x16d08 23;
              IF jbe THEN
                Block (Suc 0) 0x16d0b 24
              ELSE
                Block (Suc 0) 0x16d0b 25
              FI
            ELSE
              Block (Suc 0) 0x16d3c 26
            FI
          FI
        FI
      OD;
      CASES [
        (P_0x16d3e_27,
          Block (Suc 0) 0x16d3e 27
        )
      ]
    FI;
    Block 7 0x16d4b 28
  \<close>


method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while,
  (vcg_step assms: assms)+,
  (
    (vcg_step' assms: assms | vcg_step assms: assms)+,
    ((simp add: assms)+)?
  )?



schematic_goal "nbd_wr_sync":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16ceb \<longrightarrow> P_0x16ceb_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16ceb \<longrightarrow> P_0x16ceb_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d0d \<longrightarrow> P_0x16d0d_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d20 \<longrightarrow> P_0x16d20_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d50 \<longrightarrow> P_0x16d50_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d55 \<longrightarrow> P_0x16d55_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d20 \<longrightarrow> P_0x16d20_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d22 \<longrightarrow> P_0x16d22_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d27 \<longrightarrow> P_0x16d27_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d2b \<longrightarrow> P_0x16d2b_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d03 \<longrightarrow> P_0x16d03_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d03 \<longrightarrow> P_0x16d03_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d08 \<longrightarrow> P_0x16d08_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d0b \<longrightarrow> P_0x16d0b_true_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d0b \<longrightarrow> P_0x16d0b_false_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d2b \<longrightarrow> P_0x16d2b_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d2d \<longrightarrow> P_0x16d2d_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d32 \<longrightarrow> P_0x16d32_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d37 \<longrightarrow> P_0x16d37_true_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d0b \<longrightarrow> P_0x16d0b_true_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d0b \<longrightarrow> P_0x16d0b_false_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d37 \<longrightarrow> P_0x16d37_false_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d3c \<longrightarrow> P_0x16d3c_true_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d0b \<longrightarrow> P_0x16d0b_true_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d0b \<longrightarrow> P_0x16d0b_false_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d3c \<longrightarrow> P_0x16d3c_false_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d3e \<longrightarrow> P_0x16d3e_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16d40 \<longrightarrow> P_0x16d40_28_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_send_addr_0x16d50_5}} \<box>send_acode {{P_0x16d55_6;M_0x16d50}}\<close>
    and [blocks]: \<open>{{Q_recv_addr_0x16d22_8}} \<box>recv_acode {{P_0x16d27_9;M_0x16d22}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x16d2d_17}} \<box>errno_location_acode {{P_0x16d32_18;M_0x16d2d}}\<close>
  shows \<open>{{?P}} nbd_wr_sync_acode {{?Q;?M}}\<close>
  apply (vcg acode: nbd_wr_sync_acode_def assms: assms)
  apply (vcg_while "P_0x16d0d_3 || P_0x16d3e_27 || P_0x16d40_28")
  apply (simp add: assms)
  apply simp
  apply (vcg_step assms: assms)+
  apply (auto simp add: Ps Qs pred_logic assms)[1]
  apply (rule htriples)+
  apply simp
  apply (vcg_step assms: assms)+
  done

end
