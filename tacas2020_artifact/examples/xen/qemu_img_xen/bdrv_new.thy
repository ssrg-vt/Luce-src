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
theory bdrv_new
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes qemu_mallocz_0x17ffe_retval\<^sub>v pstrcpy_0x18015_retval\<^sub>v pstrcpy_addr qemu_mallocz_addr :: \<open>64 word\<close>
    and pstrcpy_acode qemu_mallocz_acode :: ACode
  assumes fetch:
    "fetch 0x17ff0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x17ff1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x17ff4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 2248)), 5)"
    "fetch 0x17ff9 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17ffa \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x17ffe \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_mallocz'')), 5)"
    "fetch 0x18003 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x18006 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 32)), 5)"
    "fetch 0x1800b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 2200)))), 7)"
    "fetch 0x18012 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x18015 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''pstrcpy'')), 5)"
    "fetch 0x1801a \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0x1801e \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 98385)), 2)"
    "fetch 0x18020 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 74865))))), 7)"
    "fetch 0x18027 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x1802a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 98363)), 2)"
    "fetch 0x1802c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 74853)))), 7)"
    "fetch 0x18033 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 98382)), 2)"
    "fetch 0x18035 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x18038 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1803b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 2232))))), 7)"
    "fetch 0x18042 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x18045 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 98360)), 2)"
    "fetch 0x18047 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 2232)), 7)"
    "fetch 0x1804e \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rcx)))) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x18051 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x18055 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x18058 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x18059 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1805a \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and pstrcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''pstrcpy'') = pstrcpy_addr\<close>
    and qemu_mallocz\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_mallocz'') = qemu_mallocz_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>qemu_mallocz_0x17ffe_retval \<equiv> qemu_mallocz_0x17ffe_retval\<^sub>v\<close>
definition \<open>pstrcpy_0x18015_retval \<equiv> pstrcpy_0x18015_retval\<^sub>v\<close>

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

locale "bdrv_new" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x17ff0_0 :: state_pred where
  \<open>P_0x17ff0_0 \<sigma> \<equiv> RIP \<sigma> = 0x17ff0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x17ff0_0_def[Ps]

definition P_0x17ff0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ff0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x17ff0_0_regions :: state_pred where
  \<open>P_0x17ff0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x17ff0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17ffe_0 :: state_pred where
  \<open>Q_0x17ffe_0 \<sigma> \<equiv> RIP \<sigma> = 0x17ffe \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x8c8 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x17ffe_0_def[Qs]

schematic_goal bdrv_new_0_5_0x17ff0_0x17ffa_0[blocks]:
  assumes \<open>(P_0x17ff0_0 && P_0x17ff0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x17ffa 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17ffe_0 ?\<sigma> \<and> block_usage P_0x17ff0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ff0_0_def P_0x17ff0_0_regions_def post: Q_0x17ffe_0_def regionset: P_0x17ff0_0_regions_set_def)

definition P_0x17ffe_1 :: state_pred where
  \<open>P_0x17ffe_1 \<sigma> \<equiv> RIP \<sigma> = 0x17ffe \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x8c8 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x17ffe_1_def[Ps]

definition P_0x17ffe_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ffe_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x17ffe_1_regions :: state_pred where
  \<open>P_0x17ffe_1_regions \<sigma> \<equiv> \<exists>regions. P_0x17ffe_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_mallocz_addr_0x17ffe_1 :: state_pred where
  \<open>Q_qemu_mallocz_addr_0x17ffe_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = qemu_mallocz_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x8c8 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x18003\<close>
declare Q_qemu_mallocz_addr_0x17ffe_1_def[Qs]

schematic_goal bdrv_new_0_1_0x17ffe_0x17ffe_1[blocks]:
  assumes \<open>(P_0x17ffe_1 && P_0x17ffe_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17ffe (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_mallocz_addr_0x17ffe_1 ?\<sigma> \<and> block_usage P_0x17ffe_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ffe_1_def P_0x17ffe_1_regions_def post: Q_qemu_mallocz_addr_0x17ffe_1_def regionset: P_0x17ffe_1_regions_set_def)

definition P_0x18003_2 :: state_pred where
  \<open>P_0x18003_2 \<sigma> \<equiv> RIP \<sigma> = 0x18003 \<and> RAX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x8c8 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x18003\<close>
declare P_0x18003_2_def[Ps]

definition P_0x18003_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18003_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18003_2_regions :: state_pred where
  \<open>P_0x18003_2_regions \<sigma> \<equiv> \<exists>regions. P_0x18003_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18015_2 :: state_pred where
  \<open>Q_0x18015_2 \<sigma> \<equiv> RIP \<sigma> = 0x18015 \<and> RAX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x18003\<close>
declare Q_0x18015_2_def[Qs]

schematic_goal bdrv_new_0_4_0x18003_0x18012_2[blocks]:
  assumes \<open>(P_0x18003_2 && P_0x18003_2_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x18012 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18015_2 ?\<sigma> \<and> block_usage P_0x18003_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18003_2_def P_0x18003_2_regions_def post: Q_0x18015_2_def regionset: P_0x18003_2_regions_set_def)

definition P_0x18015_3 :: state_pred where
  \<open>P_0x18015_3 \<sigma> \<equiv> RIP \<sigma> = 0x18015 \<and> RAX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x18003\<close>
declare P_0x18015_3_def[Ps]

definition P_0x18015_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18015_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18015_3_regions :: state_pred where
  \<open>P_0x18015_3_regions \<sigma> \<equiv> \<exists>regions. P_0x18015_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_pstrcpy_addr_0x18015_3 :: state_pred where
  \<open>Q_pstrcpy_addr_0x18015_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = pstrcpy_addr \<and> RAX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_pstrcpy_addr_0x18015_3_def[Qs]

schematic_goal bdrv_new_0_1_0x18015_0x18015_3[blocks]:
  assumes \<open>(P_0x18015_3 && P_0x18015_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18015 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_pstrcpy_addr_0x18015_3 ?\<sigma> \<and> block_usage P_0x18015_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18015_3_def P_0x18015_3_regions_def post: Q_pstrcpy_addr_0x18015_3_def regionset: P_0x18015_3_regions_set_def)

definition P_0x1801a_4 :: state_pred where
  \<open>P_0x1801a_4 \<sigma> \<equiv> RIP \<sigma> = 0x1801a \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x1801a_4_def[Ps]

definition P_0x1801a_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1801a_4_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1801a_4_regions :: state_pred where
  \<open>P_0x1801a_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1801a_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1801e_4 :: state_pred where
  \<open>Q_0x1801e_4 \<sigma> \<equiv> RIP \<sigma> = 0x1801e \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_0x1801e_4_def[Qs]

schematic_goal bdrv_new_0_1_0x1801a_0x1801a_4[blocks]:
  assumes \<open>(P_0x1801a_4 && P_0x1801a_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1801a 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1801e_4 ?\<sigma> \<and> block_usage P_0x1801a_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1801a_4_def P_0x1801a_4_regions_def post: Q_0x1801e_4_def regionset: P_0x1801a_4_regions_set_def)

definition P_0x1801e_true_5 :: state_pred where
  \<open>P_0x1801e_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x1801e \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x1801e_true_5_def[Ps]

definition P_0x1801e_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1801e_true_5_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1801e_true_5_regions :: state_pred where
  \<open>P_0x1801e_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1801e_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18051_5 :: state_pred where
  \<open>Q_0x18051_5 \<sigma> \<equiv> RIP \<sigma> = 0x18051 \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_0x18051_5_def[Qs]

schematic_goal bdrv_new_0_1_0x1801e_0x1801e_5[blocks]:
  assumes \<open>(P_0x1801e_true_5 && P_0x1801e_true_5_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1801e 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18051_5 ?\<sigma> \<and> block_usage P_0x1801e_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1801e_true_5_def P_0x1801e_true_5_regions_def post: Q_0x18051_5_def regionset: P_0x1801e_true_5_regions_set_def)

definition P_0x1801e_false_6 :: state_pred where
  \<open>P_0x1801e_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x1801e \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x1801e_false_6_def[Ps]

definition P_0x1801e_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1801e_false_6_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RDI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1801e_false_6_regions :: state_pred where
  \<open>P_0x1801e_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1801e_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1802a_6 :: state_pred where
  \<open>Q_0x1802a_6 \<sigma> \<equiv> RIP \<sigma> = 0x1802a \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_0x1802a_6_def[Qs]

schematic_goal bdrv_new_0_3_0x1801e_0x18027_6[blocks]:
  assumes \<open>(P_0x1801e_false_6 && P_0x1801e_false_6_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x18027 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1802a_6 ?\<sigma> \<and> block_usage P_0x1801e_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1801e_false_6_def P_0x1801e_false_6_regions_def post: Q_0x1802a_6_def regionset: P_0x1801e_false_6_regions_set_def)

definition P_0x1802a_true_7 :: state_pred where
  \<open>P_0x1802a_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x1802a \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x1802a_true_7_def[Ps]

definition P_0x1802a_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1802a_true_7_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RDI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1802a_true_7_regions :: state_pred where
  \<open>P_0x1802a_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1802a_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1803b_7 :: state_pred where
  \<open>Q_0x1803b_7 \<sigma> \<equiv> RIP \<sigma> = 0x1803b \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_0x1803b_7_def[Qs]

schematic_goal bdrv_new_0_1_0x1802a_0x1802a_7[blocks]:
  assumes \<open>(P_0x1802a_true_7 && P_0x1802a_true_7_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1802a 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1803b_7 ?\<sigma> \<and> block_usage P_0x1802a_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1802a_true_7_def P_0x1802a_true_7_regions_def post: Q_0x1803b_7_def regionset: P_0x1802a_true_7_regions_set_def)

definition P_0x1803b_8 :: state_pred where
  \<open>P_0x1803b_8 \<sigma> \<equiv> RIP \<sigma> = 0x1803b \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x1803b_8_def[Ps]

definition P_0x1803b_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1803b_8_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RDI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RCX \<sigma>::64 word) + 0x8b8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1803b_8_regions :: state_pred where
  \<open>P_0x1803b_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1803b_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18045_8 :: state_pred where
  \<open>Q_0x18045_8 \<sigma> \<equiv> RIP \<sigma> = 0x18045 \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RCX \<sigma>::64 word) + 0x8b8),8]::64 word) \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RCX \<sigma>::64 word) + 0x8b8),8]::64 word) = (\<sigma> \<turnstile> *[((RCX \<sigma>::64 word) + 0x8b8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_0x18045_8_def[Qs]

schematic_goal bdrv_new_0_2_0x1803b_0x18042_8[blocks]:
  assumes \<open>(P_0x1803b_8 && P_0x1803b_8_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x18042 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18045_8 ?\<sigma> \<and> block_usage P_0x1803b_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1803b_8_def P_0x1803b_8_regions_def post: Q_0x18045_8_def regionset: P_0x1803b_8_regions_set_def)

definition P_0x18045_true_9 :: state_pred where
  \<open>P_0x18045_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x18045 \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RCX \<sigma>::64 word) + 0x8b8),8]::64 word) \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RCX \<sigma>::64 word) + 0x8b8),8]::64 word) = (\<sigma> \<turnstile> *[((RCX \<sigma>::64 word) + 0x8b8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x18045_true_9_def[Ps]

definition P_0x18045_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18045_true_9_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RDI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RCX \<sigma>::64 word) + 0x8b8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18045_true_9_regions :: state_pred where
  \<open>P_0x18045_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x18045_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1803b_9 :: state_pred where
  \<open>Q_0x1803b_9 \<sigma> \<equiv> RIP \<sigma> = 0x1803b \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_0x1803b_9_def[Qs]

schematic_goal bdrv_new_0_2_0x18045_0x18038_9[blocks]:
  assumes \<open>(P_0x18045_true_9 && P_0x18045_true_9_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x18038 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1803b_9 ?\<sigma> \<and> block_usage P_0x18045_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18045_true_9_def P_0x18045_true_9_regions_def post: Q_0x1803b_9_def regionset: P_0x18045_true_9_regions_set_def)

definition P_0x18045_false_10 :: state_pred where
  \<open>P_0x18045_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x18045 \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RCX \<sigma>::64 word) + 0x8b8),8]::64 word) \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RCX \<sigma>::64 word) + 0x8b8),8]::64 word) = (\<sigma> \<turnstile> *[((RCX \<sigma>::64 word) + 0x8b8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x18045_false_10_def[Ps]

definition P_0x18045_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18045_false_10_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RDI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RCX \<sigma>::64 word) + 0x8b8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18045_false_10_regions :: state_pred where
  \<open>P_0x18045_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x18045_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18047_10 :: state_pred where
  \<open>Q_0x18047_10 \<sigma> \<equiv> RIP \<sigma> = 0x18047 \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_0x18047_10_def[Qs]

schematic_goal bdrv_new_0_1_0x18045_0x18045_10[blocks]:
  assumes \<open>(P_0x18045_false_10 && P_0x18045_false_10_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18045 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18047_10 ?\<sigma> \<and> block_usage P_0x18045_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18045_false_10_def P_0x18045_false_10_regions_def post: Q_0x18047_10_def regionset: P_0x18045_false_10_regions_set_def)

definition P_0x18047_11 :: state_pred where
  \<open>P_0x18047_11 \<sigma> \<equiv> RIP \<sigma> = 0x18047 \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x18047_11_def[Ps]

definition P_0x18047_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18047_11_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RDI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18047_11_regions :: state_pred where
  \<open>P_0x18047_11_regions \<sigma> \<equiv> \<exists>regions. P_0x18047_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1804e_11 :: state_pred where
  \<open>Q_0x1804e_11 \<sigma> \<equiv> RIP \<sigma> = 0x1804e \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_0x1804e_11_def[Qs]

schematic_goal bdrv_new_0_1_0x18047_0x18047_11[blocks]:
  assumes \<open>(P_0x18047_11 && P_0x18047_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18047 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1804e_11 ?\<sigma> \<and> block_usage P_0x18047_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18047_11_def P_0x18047_11_regions_def post: Q_0x1804e_11_def regionset: P_0x18047_11_regions_set_def)

definition P_0x1802a_false_12 :: state_pred where
  \<open>P_0x1802a_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x1802a \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x1802a_false_12_def[Ps]

definition P_0x1802a_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1802a_false_12_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RDI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1802a_false_12_regions :: state_pred where
  \<open>P_0x1802a_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x1802a_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1804e_12 :: state_pred where
  \<open>Q_0x1804e_12 \<sigma> \<equiv> RIP \<sigma> = 0x1804e \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_0x1804e_12_def[Qs]

schematic_goal bdrv_new_0_3_0x1802a_0x18033_12[blocks]:
  assumes \<open>(P_0x1802a_false_12 && P_0x1802a_false_12_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x18033 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1804e_12 ?\<sigma> \<and> block_usage P_0x1802a_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1802a_false_12_def P_0x1802a_false_12_regions_def post: Q_0x1804e_12_def regionset: P_0x1802a_false_12_regions_set_def)

definition P_0x1804e_13 :: state_pred where
  \<open>P_0x1804e_13 \<sigma> \<equiv> RIP \<sigma> = 0x1804e \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x1804e_13_def[Ps]

definition P_0x1804e_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1804e_13_regions_set \<sigma> \<equiv> {
    (0, RCX \<sigma>, 8),
    (1, 0x2a498, 8),
    (2, RDI\<^sub>0, Suc 0),
    (3, RSP\<^sub>0, 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1804e_13_regions :: state_pred where
  \<open>P_0x1804e_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1804e_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18051_13 :: state_pred where
  \<open>Q_0x18051_13 \<sigma> \<equiv> RIP \<sigma> = 0x18051 \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_0x18051_13_def[Qs]

schematic_goal bdrv_new_0_1_0x1804e_0x1804e_13[blocks]:
  assumes \<open>(P_0x1804e_13 && P_0x1804e_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1804e 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18051_13 ?\<sigma> \<and> block_usage P_0x1804e_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1804e_13_def P_0x1804e_13_regions_def post: Q_0x18051_13_def regionset: P_0x1804e_13_regions_set_def)

definition P_0x18051_14 :: state_pred where
  \<open>P_0x18051_14 \<sigma> \<equiv> RIP \<sigma> = 0x18051 \<and> RAX \<sigma> = pstrcpy_0x18015_retval \<and> RBX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare P_0x18051_14_def[Ps]

definition P_0x18051_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18051_14_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18051_14_regions :: state_pred where
  \<open>P_0x18051_14_regions \<sigma> \<equiv> \<exists>regions. P_0x18051_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_14 :: state_pred where
  \<open>Q_ret_address_14 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = qemu_mallocz_0x17ffe_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = ((qemu_mallocz_0x17ffe_retval::64 word) + 0x898) \<and> RSI \<sigma> = 0x20 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1801a\<close>
declare Q_ret_address_14_def[Qs]

schematic_goal bdrv_new_0_5_0x18051_0x1805a_14[blocks]:
  assumes \<open>(P_0x18051_14 && P_0x18051_14_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1805a 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_14 ?\<sigma> \<and> block_usage P_0x18051_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18051_14_def P_0x18051_14_regions_def post: Q_ret_address_14_def regionset: P_0x18051_14_regions_set_def)

definition bdrv_new_acode :: ACode where
  \<open>bdrv_new_acode =
    Block 5 0x17ffa 0;
    Block (Suc 0) 0x17ffe (Suc 0);
    CALL qemu_mallocz_acode;
    Block 4 0x18012 2;
    Block (Suc 0) 0x18015 3;
    CALL pstrcpy_acode;
    Block (Suc 0) 0x1801a 4;
    IF ZF THEN
      Block (Suc 0) 0x1801e 5
    ELSE
      Block 3 0x18027 6;
      IF !ZF THEN
        Block (Suc 0) 0x1802a 7;
        WHILE P_0x1803b_8 DO
          Block 2 0x18042 8;
          IF !ZF THEN
            Block 2 0x18038 9
          ELSE
            Block (Suc 0) 0x18045 10
          FI
        OD;
        Block (Suc 0) 0x18047 11
      ELSE
        Block 3 0x18033 12
      FI;
      Block (Suc 0) 0x1804e 13
    FI;
    Block 5 0x1805a 14
  \<close>

schematic_goal "bdrv_new":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ffe \<longrightarrow> P_0x17ffe_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18003 \<longrightarrow> P_0x18003_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18015 \<longrightarrow> P_0x18015_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1801a \<longrightarrow> P_0x1801a_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1801e \<longrightarrow> P_0x1801e_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1801e \<longrightarrow> P_0x1801e_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1802a \<longrightarrow> P_0x1802a_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1803b \<longrightarrow> P_0x1803b_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18045 \<longrightarrow> P_0x18045_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18045 \<longrightarrow> P_0x18045_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18047 \<longrightarrow> P_0x18047_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1802a \<longrightarrow> P_0x1802a_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1804e \<longrightarrow> P_0x1804e_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18051 \<longrightarrow> P_0x18051_14_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_qemu_mallocz_addr_0x17ffe_1}} \<box>qemu_mallocz_acode {{P_0x18003_2;M_0x17ffe}}\<close>
    and [blocks]: \<open>{{Q_pstrcpy_addr_0x18015_3}} \<box>pstrcpy_acode {{P_0x1801a_4;M_0x18015}}\<close>
  shows \<open>{{?P}} bdrv_new_acode {{?Q;?M}}\<close>
  apply (vcg acode: bdrv_new_acode_def assms: assms)
                    apply (vcg_while \<open>P_0x1803b_8 || P_0x18047_11\<close> assms: assms)
                  apply (vcg_step assms: assms)+
  done

end

end
