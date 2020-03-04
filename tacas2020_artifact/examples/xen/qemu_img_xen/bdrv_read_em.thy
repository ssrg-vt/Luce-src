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
theory bdrv_read_em
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes bdrv_aio_read_0x1a148_retval\<^sub>v qemu_aio_wait_0x1a160_retval\<^sub>v stack_chk_fail_0x1a18c_retval\<^sub>v stack_chk_fail_addr bdrv_aio_read_addr qemu_aio_wait_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode bdrv_aio_read_acode qemu_aio_wait_acode :: ACode
  assumes fetch:
    "fetch 0x1a120 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1a124 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-9435))))), 7)"
    "fetch 0x1a12b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x1a134 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x1a139 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1a13b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 4)))), 5)"
    "fetch 0x1a140 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 4)))) (Immediate SixtyFour (ImmVal 2147483647)), 8)"
    "fetch 0x1a148 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_aio_read'')), 5)"
    "fetch 0x1a14d \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a150 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 106885)), 2)"
    "fetch 0x1a152 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 4))))), 4)"
    "fetch 0x1a156 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 2147483647)), 5)"
    "fetch 0x1a15b \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 106864)), 2)"
    "fetch 0x1a15d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x1a160 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_aio_wait'')), 5)"
    "fetch 0x1a165 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 4))))), 4)"
    "fetch 0x1a169 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 2147483647)), 5)"
    "fetch 0x1a16e \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 106848)), 2)"
    "fetch 0x1a170 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1a175 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x1a17e \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 106892)), 2)"
    "fetch 0x1a180 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1a184 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1a185 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x1a18a \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 106864)), 2)"
    "fetch 0x1a18c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x1a191 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and bdrv_aio_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_aio_read'') = bdrv_aio_read_addr\<close>
    and qemu_aio_wait\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_aio_wait'') = qemu_aio_wait_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>bdrv_aio_read_0x1a148_retval \<equiv> bdrv_aio_read_0x1a148_retval\<^sub>v\<close>
definition \<open>qemu_aio_wait_0x1a160_retval \<equiv> qemu_aio_wait_0x1a160_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x1a18c_retval \<equiv> stack_chk_fail_0x1a18c_retval\<^sub>v\<close>

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

locale "bdrv_read_em" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1a120_0 :: state_pred where
  \<open>P_0x1a120_0 \<sigma> \<equiv> RIP \<sigma> = 0x1a120 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1a120_0_def[Ps]

definition P_0x1a120_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a120_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4)
  }\<close>

definition P_0x1a120_0_regions :: state_pred where
  \<open>P_0x1a120_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1a120_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a148_0 :: state_pred where
  \<open>Q_0x1a148_0 \<sigma> \<equiv> RIP \<sigma> = 0x1a148 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_0x1a148_0_def[Qs]

schematic_goal bdrv_read_em_0_7_0x1a120_0x1a140_0[blocks]:
  assumes \<open>(P_0x1a120_0 && P_0x1a120_0_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1a140 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a148_0 ?\<sigma> \<and> block_usage P_0x1a120_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a120_0_def P_0x1a120_0_regions_def post: Q_0x1a148_0_def regionset: P_0x1a120_0_regions_set_def)

definition P_0x1a148_1 :: state_pred where
  \<open>P_0x1a148_1 \<sigma> \<equiv> RIP \<sigma> = 0x1a148 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare P_0x1a148_1_def[Ps]

definition P_0x1a148_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a148_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1a148_1_regions :: state_pred where
  \<open>P_0x1a148_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1a148_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_aio_read_addr_0x1a148_1 :: state_pred where
  \<open>Q_bdrv_aio_read_addr_0x1a148_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = bdrv_aio_read_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1a14d\<close>
declare Q_bdrv_aio_read_addr_0x1a148_1_def[Qs]

schematic_goal bdrv_read_em_0_1_0x1a148_0x1a148_1[blocks]:
  assumes \<open>(P_0x1a148_1 && P_0x1a148_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a148 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_aio_read_addr_0x1a148_1 ?\<sigma> \<and> block_usage P_0x1a148_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a148_1_def P_0x1a148_1_regions_def post: Q_bdrv_aio_read_addr_0x1a148_1_def regionset: P_0x1a148_1_regions_set_def)

definition P_0x1a14d_2 :: state_pred where
  \<open>P_0x1a14d_2 \<sigma> \<equiv> RIP \<sigma> = 0x1a14d \<and> RAX \<sigma> = bdrv_aio_read_0x1a148_retval \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1a14d\<close>
declare P_0x1a14d_2_def[Ps]

definition P_0x1a14d_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a14d_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1a14d_2_regions :: state_pred where
  \<open>P_0x1a14d_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1a14d_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a150_2 :: state_pred where
  \<open>Q_0x1a150_2 \<sigma> \<equiv> RIP \<sigma> = 0x1a150 \<and> RAX \<sigma> = bdrv_aio_read_0x1a148_retval \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1a14d\<close>
declare Q_0x1a150_2_def[Qs]

schematic_goal bdrv_read_em_0_1_0x1a14d_0x1a14d_2[blocks]:
  assumes \<open>(P_0x1a14d_2 && P_0x1a14d_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a14d 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a150_2 ?\<sigma> \<and> block_usage P_0x1a14d_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a14d_2_def P_0x1a14d_2_regions_def post: Q_0x1a150_2_def regionset: P_0x1a14d_2_regions_set_def)

definition P_0x1a150_true_3 :: state_pred where
  \<open>P_0x1a150_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x1a150 \<and> RAX \<sigma> = bdrv_aio_read_0x1a148_retval \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1a14d\<close>
declare P_0x1a150_true_3_def[Ps]

definition P_0x1a150_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a150_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1a150_true_3_regions :: state_pred where
  \<open>P_0x1a150_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1a150_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a170_3 :: state_pred where
  \<open>Q_0x1a170_3 \<sigma> \<equiv> RIP \<sigma> = 0x1a170 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_0x1a170_3_def[Qs]

schematic_goal bdrv_read_em_0_3_0x1a150_0x1a18a_3[blocks]:
  assumes \<open>(P_0x1a150_true_3 && P_0x1a150_true_3_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1a18a 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a170_3 ?\<sigma> \<and> block_usage P_0x1a150_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a150_true_3_def P_0x1a150_true_3_regions_def post: Q_0x1a170_3_def regionset: P_0x1a150_true_3_regions_set_def)

definition P_0x1a150_false_4 :: state_pred where
  \<open>P_0x1a150_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x1a150 \<and> RAX \<sigma> = bdrv_aio_read_0x1a148_retval \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1a14d\<close>
declare P_0x1a150_false_4_def[Ps]

definition P_0x1a150_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a150_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1a150_false_4_regions :: state_pred where
  \<open>P_0x1a150_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1a150_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a15b_4 :: state_pred where
  \<open>Q_0x1a15b_4 \<sigma> \<equiv> RIP \<sigma> = 0x1a15b \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1a14d\<close>
declare Q_0x1a15b_4_def[Qs]

schematic_goal bdrv_read_em_0_3_0x1a150_0x1a156_4[blocks]:
  assumes \<open>(P_0x1a150_false_4 && P_0x1a150_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1a156 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a15b_4 ?\<sigma> \<and> block_usage P_0x1a150_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a150_false_4_def P_0x1a150_false_4_regions_def post: Q_0x1a15b_4_def regionset: P_0x1a150_false_4_regions_set_def)

definition P_0x1a15b_true_5 :: state_pred where
  \<open>P_0x1a15b_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x1a15b \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1a14d\<close>
declare P_0x1a15b_true_5_def[Ps]

definition P_0x1a15b_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a15b_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1a15b_true_5_regions :: state_pred where
  \<open>P_0x1a15b_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1a15b_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a170_5 :: state_pred where
  \<open>Q_0x1a170_5 \<sigma> \<equiv> RIP \<sigma> = 0x1a170 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_0x1a170_5_def[Qs]

schematic_goal bdrv_read_em_0_1_0x1a15b_0x1a15b_5[blocks]:
  assumes \<open>(P_0x1a15b_true_5 && P_0x1a15b_true_5_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a15b 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a170_5 ?\<sigma> \<and> block_usage P_0x1a15b_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a15b_true_5_def P_0x1a15b_true_5_regions_def post: Q_0x1a170_5_def regionset: P_0x1a15b_true_5_regions_set_def)

definition P_0x1a15b_false_6 :: state_pred where
  \<open>P_0x1a15b_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x1a15b \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1a14d\<close>
declare P_0x1a15b_false_6_def[Ps]

definition P_0x1a15b_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a15b_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1a15b_false_6_regions :: state_pred where
  \<open>P_0x1a15b_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1a15b_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a160_6 :: state_pred where
  \<open>Q_0x1a160_6 \<sigma> \<equiv> RIP \<sigma> = 0x1a160 \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_0x1a160_6_def[Qs]

schematic_goal bdrv_read_em_0_2_0x1a15b_0x1a15d_6[blocks]:
  assumes \<open>(P_0x1a15b_false_6 && P_0x1a15b_false_6_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1a15d 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a160_6 ?\<sigma> \<and> block_usage P_0x1a15b_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a15b_false_6_def P_0x1a15b_false_6_regions_def post: Q_0x1a160_6_def regionset: P_0x1a15b_false_6_regions_set_def)

definition P_0x1a160_7 :: state_pred where
  \<open>P_0x1a160_7 \<sigma> \<equiv> RIP \<sigma> = 0x1a160 \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare P_0x1a160_7_def[Ps]

definition P_0x1a160_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a160_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1a160_7_regions :: state_pred where
  \<open>P_0x1a160_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1a160_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_aio_wait_addr_0x1a160_7 :: state_pred where
  \<open>Q_qemu_aio_wait_addr_0x1a160_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = qemu_aio_wait_addr \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1a165\<close>
declare Q_qemu_aio_wait_addr_0x1a160_7_def[Qs]

schematic_goal bdrv_read_em_0_1_0x1a160_0x1a160_7[blocks]:
  assumes \<open>(P_0x1a160_7 && P_0x1a160_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a160 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_aio_wait_addr_0x1a160_7 ?\<sigma> \<and> block_usage P_0x1a160_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a160_7_def P_0x1a160_7_regions_def post: Q_qemu_aio_wait_addr_0x1a160_7_def regionset: P_0x1a160_7_regions_set_def)

definition P_0x1a165_8 :: state_pred where
  \<open>P_0x1a165_8 \<sigma> \<equiv> RIP \<sigma> = 0x1a165 \<and> RAX \<sigma> = qemu_aio_wait_0x1a160_retval \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1a165\<close>
declare P_0x1a165_8_def[Ps]

definition P_0x1a165_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a165_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1a165_8_regions :: state_pred where
  \<open>P_0x1a165_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1a165_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a16e_8 :: state_pred where
  \<open>Q_0x1a16e_8 \<sigma> \<equiv> RIP \<sigma> = 0x1a16e \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_0x1a16e_8_def[Qs]

schematic_goal bdrv_read_em_0_2_0x1a165_0x1a169_8[blocks]:
  assumes \<open>(P_0x1a165_8 && P_0x1a165_8_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1a169 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a16e_8 ?\<sigma> \<and> block_usage P_0x1a165_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a165_8_def P_0x1a165_8_regions_def post: Q_0x1a16e_8_def regionset: P_0x1a165_8_regions_set_def)

definition P_0x1a16e_true_9 :: state_pred where
  \<open>P_0x1a16e_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x1a16e \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare P_0x1a16e_true_9_def[Ps]

definition P_0x1a16e_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a16e_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4)
  }\<close>

definition P_0x1a16e_true_9_regions :: state_pred where
  \<open>P_0x1a16e_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1a16e_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a160_9 :: state_pred where
  \<open>Q_0x1a160_9 \<sigma> \<equiv> RIP \<sigma> = 0x1a160 \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_0x1a160_9_def[Qs]

schematic_goal bdrv_read_em_0_1_0x1a16e_0x1a16e_9[blocks]:
  assumes \<open>(P_0x1a16e_true_9 && P_0x1a16e_true_9_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a16e 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a160_9 ?\<sigma> \<and> block_usage P_0x1a16e_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a16e_true_9_def P_0x1a16e_true_9_regions_def post: Q_0x1a160_9_def regionset: P_0x1a16e_true_9_regions_set_def)

definition P_0x1a16e_false_10 :: state_pred where
  \<open>P_0x1a16e_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x1a16e \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare P_0x1a16e_false_10_def[Ps]

definition P_0x1a16e_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a16e_false_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4)
  }\<close>

definition P_0x1a16e_false_10_regions :: state_pred where
  \<open>P_0x1a16e_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1a16e_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a170_10 :: state_pred where
  \<open>Q_0x1a170_10 \<sigma> \<equiv> RIP \<sigma> = 0x1a170 \<and> RAX \<sigma> = 0x7fffffff \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_0x1a170_10_def[Qs]

schematic_goal bdrv_read_em_0_1_0x1a16e_0x1a16e_10[blocks]:
  assumes \<open>(P_0x1a16e_false_10 && P_0x1a16e_false_10_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a16e 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a170_10 ?\<sigma> \<and> block_usage P_0x1a16e_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a16e_false_10_def P_0x1a16e_false_10_regions_def post: Q_0x1a170_10_def regionset: P_0x1a16e_false_10_regions_set_def)

definition P_0x1a170_11 :: state_pred where
  \<open>P_0x1a170_11 \<sigma> \<equiv> RIP \<sigma> = 0x1a170 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare P_0x1a170_11_def[Ps]

definition P_0x1a170_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a170_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4)
  }\<close>

definition P_0x1a170_11_regions :: state_pred where
  \<open>P_0x1a170_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1a170_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a17e_11 :: state_pred where
  \<open>Q_0x1a17e_11 \<sigma> \<equiv> RIP \<sigma> = 0x1a17e \<and> RDX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_0x1a17e_11_def[Qs]

schematic_goal bdrv_read_em_0_2_0x1a170_0x1a175_11[blocks]:
  assumes \<open>(P_0x1a170_11 && P_0x1a170_11_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1a175 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a17e_11 ?\<sigma> \<and> block_usage P_0x1a170_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a170_11_def P_0x1a170_11_regions_def post: Q_0x1a17e_11_def regionset: P_0x1a170_11_regions_set_def)

definition P_0x1a17e_true_12 :: state_pred where
  \<open>P_0x1a17e_true_12 \<sigma> \<equiv> RIP \<sigma> = 0x1a17e \<and> RDX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare P_0x1a17e_true_12_def[Ps]

definition P_0x1a17e_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a17e_true_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4)
  }\<close>

definition P_0x1a17e_true_12_regions :: state_pred where
  \<open>P_0x1a17e_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0x1a17e_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a18c_12 :: state_pred where
  \<open>Q_0x1a18c_12 \<sigma> \<equiv> RIP \<sigma> = 0x1a18c \<and> RDX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_0x1a18c_12_def[Qs]

schematic_goal bdrv_read_em_0_1_0x1a17e_0x1a17e_12[blocks]:
  assumes \<open>(P_0x1a17e_true_12 && P_0x1a17e_true_12_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a17e 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a18c_12 ?\<sigma> \<and> block_usage P_0x1a17e_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a17e_true_12_def P_0x1a17e_true_12_regions_def post: Q_0x1a18c_12_def regionset: P_0x1a17e_true_12_regions_set_def)

definition P_0x1a18c_13 :: state_pred where
  \<open>P_0x1a18c_13 \<sigma> \<equiv> RIP \<sigma> = 0x1a18c \<and> RDX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare P_0x1a18c_13_def[Ps]

definition P_0x1a18c_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a18c_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1a18c_13_regions :: state_pred where
  \<open>P_0x1a18c_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1a18c_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x1a18c_13 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x1a18c_13 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RDX \<sigma> = 0x0 \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_stack_chk_fail_addr_0x1a18c_13_def[Qs]

schematic_goal bdrv_read_em_0_1_0x1a18c_0x1a18c_13[blocks]:
  assumes \<open>(P_0x1a18c_13 && P_0x1a18c_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a18c 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x1a18c_13 ?\<sigma> \<and> block_usage P_0x1a18c_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a18c_13_def P_0x1a18c_13_regions_def post: Q_stack_chk_fail_addr_0x1a18c_13_def regionset: P_0x1a18c_13_regions_set_def)

definition P_0x1a17e_false_14 :: state_pred where
  \<open>P_0x1a17e_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x1a17e \<and> RDX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare P_0x1a17e_false_14_def[Ps]

definition P_0x1a17e_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a17e_false_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x14), 4)
  }\<close>

definition P_0x1a17e_false_14_regions :: state_pred where
  \<open>P_0x1a17e_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x1a17e_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_14 :: state_pred where
  \<open>Q_ret_address_14 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDX \<sigma> = 0x0 \<and> R9 \<sigma> = ((RSP\<^sub>0::64 word) - 0x14) \<and> R8 \<sigma> = 0x17c50 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x14),4]::32 word) = 0x7fffffff\<close>
declare Q_ret_address_14_def[Qs]

schematic_goal bdrv_read_em_0_3_0x1a17e_0x1a184_14[blocks]:
  assumes \<open>(P_0x1a17e_false_14 && P_0x1a17e_false_14_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1a184 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_14 ?\<sigma> \<and> block_usage P_0x1a17e_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a17e_false_14_def P_0x1a17e_false_14_regions_def post: Q_ret_address_14_def regionset: P_0x1a17e_false_14_regions_set_def)

definition bdrv_read_em_acode :: ACode where
  \<open>bdrv_read_em_acode =
    Block 7 0x1a140 0;
    Block (Suc 0) 0x1a148 (Suc 0);
    CALL bdrv_aio_read_acode;
    Block (Suc 0) 0x1a14d 2;
    IF ZF THEN
      Block 3 0x1a18a 3
    ELSE
      Block 3 0x1a156 4;
      IF !ZF THEN
        Block (Suc 0) 0x1a15b 5
      ELSE
        Block 2 0x1a15d 6;
        WHILE P_0x1a160_7 DO
          Block (Suc 0) 0x1a160 7;
          CALL qemu_aio_wait_acode;
          Block 2 0x1a169 8;
          IF ZF THEN
            Block (Suc 0) 0x1a16e 9
          ELSE
            Block (Suc 0) 0x1a16e 10
          FI
        OD
      FI
    FI;
    Block 2 0x1a175 11;
    IF !ZF THEN
      Block (Suc 0) 0x1a17e 12;
      Block (Suc 0) 0x1a18c 13;
      CALL stack_chk_fail_acode
    ELSE
      Block 3 0x1a184 14
    FI
  \<close>

schematic_goal "bdrv_read_em":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a148 \<longrightarrow> P_0x1a148_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a14d \<longrightarrow> P_0x1a14d_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a150 \<longrightarrow> P_0x1a150_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a150 \<longrightarrow> P_0x1a150_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a15b \<longrightarrow> P_0x1a15b_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a15b \<longrightarrow> P_0x1a15b_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a160 \<longrightarrow> P_0x1a160_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a165 \<longrightarrow> P_0x1a165_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a16e \<longrightarrow> P_0x1a16e_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a16e \<longrightarrow> P_0x1a16e_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a170 \<longrightarrow> P_0x1a170_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a17e \<longrightarrow> P_0x1a17e_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a18c \<longrightarrow> P_0x1a18c_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a17e \<longrightarrow> P_0x1a17e_false_14_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_aio_read_addr_0x1a148_1}} \<box>bdrv_aio_read_acode {{P_0x1a14d_2;M_0x1a148}}\<close>
    and [blocks]: \<open>{{Q_qemu_aio_wait_addr_0x1a160_7}} \<box>qemu_aio_wait_acode {{P_0x1a165_8;M_0x1a160}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x1a18c_13}} \<box>stack_chk_fail_acode {{Q_fail;M_0x1a18c}}\<close>
  shows \<open>{{?P}} bdrv_read_em_acode {{?Q;?M}}\<close>
  apply (vcg acode: bdrv_read_em_acode_def assms: assms)
              apply (vcg_while \<open>P_0x1a160_7 || P_0x1a170_11\<close> assms: assms)
        apply (vcg_step assms: assms)+
  done

end

end