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
theory find_protocol
  imports "../../../isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes strchr_0x17c86_retval\<^sub>v memcpy_chk_0x17cb4_retval\<^sub>v strcmp_0x17cdf_retval\<^sub>v stack_chk_fail_0x17d34_retval\<^sub>v memcpy_chk_addr stack_chk_fail_addr strchr_addr strcmp_addr :: \<open>64 word\<close>
    and memcpy_chk_acode stack_chk_fail_acode strchr_acode strcmp_acode :: ACode
  assumes fetch:
    "fetch 0x17c60 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x17c62 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 58)), 5)"
    "fetch 0x17c67 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x17c68 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17c69 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x17c6c \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 144)), 7)"
    "fetch 0x17c73 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x17c7c \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 136)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x17c84 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17c86 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strchr'')), 5)"
    "fetch 0x17c8b \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x17c8e \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 97584)), 6)"
    "fetch 0x17c94 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17c97 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 127)), 3)"
    "fetch 0x17c9a \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 97568)), 6)"
    "fetch 0x17ca0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x17ca3 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x17ca6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x17ca9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17cac \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x17cb1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x17cb4 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__memcpy_chk'')), 5)"
    "fetch 0x17cb9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 75456))))), 7)"
    "fetch 0x17cc0 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x17cc3 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_Mult 1 (A_FromReg (General SixtyFour rax)))))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0x17cc7 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17cca \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 97524)), 2)"
    "fetch 0x17ccc \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x17cd0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 136))))), 7)"
    "fetch 0x17cd7 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x17cda \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 97512)), 2)"
    "fetch 0x17cdc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x17cdf \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strcmp'')), 5)"
    "fetch 0x17ce4 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17ce6 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 97531)), 2)"
    "fetch 0x17ce8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 312))))), 7)"
    "fetch 0x17cef \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17cf2 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 97488)), 2)"
    "fetch 0x17cf4 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 74277)))), 7)"
    "fetch 0x17cfb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 136))))), 8)"
    "fetch 0x17d03 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x17d0c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17d0f \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 97588)), 2)"
    "fetch 0x17d11 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 144)), 7)"
    "fetch 0x17d18 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17d19 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x17d1a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x17d1c \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x17d1d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x17d20 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 127)), 5)"
    "fetch 0x17d25 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 127)), 6)"
    "fetch 0x17d2b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 97446)), 5)"
    "fetch 0x17d30 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x17d32 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 97531)), 2)"
    "fetch 0x17d34 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and memcpy_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__memcpy_chk'') = memcpy_chk_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and strchr\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strchr'') = strchr_addr\<close>
    and strcmp\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strcmp'') = strcmp_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>strchr_0x17c86_retval \<equiv> strchr_0x17c86_retval\<^sub>v\<close>
definition \<open>memcpy_chk_0x17cb4_retval \<equiv> memcpy_chk_0x17cb4_retval\<^sub>v\<close>
definition \<open>strcmp_0x17cdf_retval \<equiv> strcmp_0x17cdf_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x17d34_retval \<equiv> stack_chk_fail_0x17d34_retval\<^sub>v\<close>

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

locale "find_protocol" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x17c60_0 :: state_pred where
  \<open>P_0x17c60_0 \<sigma> \<equiv> RIP \<sigma> = 0x17c60 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x17c60_0_def[Ps]

definition P_0x17c60_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17c60_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x17c60_0_regions :: state_pred where
  \<open>P_0x17c60_0_regions \<sigma> \<equiv> \<exists>regions. P_0x17c60_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17c86_0 :: state_pred where
  \<open>Q_0x17c86_0 \<sigma> \<equiv> RIP \<sigma> = 0x17c86 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17c86_0_def[Qs]

schematic_goal find_protocol_0_9_0x17c60_0x17c84_0[blocks]:
  assumes \<open>(P_0x17c60_0 && P_0x17c60_0_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x17c84 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17c86_0 ?\<sigma> \<and> block_usage P_0x17c60_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17c60_0_def P_0x17c60_0_regions_def post: Q_0x17c86_0_def regionset: P_0x17c60_0_regions_set_def)

definition P_0x17c86_1 :: state_pred where
  \<open>P_0x17c86_1 \<sigma> \<equiv> RIP \<sigma> = 0x17c86 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x17c86_1_def[Ps]

definition P_0x17c86_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17c86_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x17c86_1_regions :: state_pred where
  \<open>P_0x17c86_1_regions \<sigma> \<equiv> \<exists>regions. P_0x17c86_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strchr_addr_0x17c86_1 :: state_pred where
  \<open>Q_strchr_addr_0x17c86_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xb0) \<and> RIP \<sigma> = strchr_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare Q_strchr_addr_0x17c86_1_def[Qs]

schematic_goal find_protocol_0_1_0x17c86_0x17c86_1[blocks]:
  assumes \<open>(P_0x17c86_1 && P_0x17c86_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17c86 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_strchr_addr_0x17c86_1 ?\<sigma> \<and> block_usage P_0x17c86_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17c86_1_def P_0x17c86_1_regions_def post: Q_strchr_addr_0x17c86_1_def regionset: P_0x17c86_1_regions_set_def)

definition P_0x17c8b_2 :: state_pred where
  \<open>P_0x17c8b_2 \<sigma> \<equiv> RIP \<sigma> = 0x17c8b \<and> RAX \<sigma> = strchr_0x17c86_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare P_0x17c8b_2_def[Ps]

definition P_0x17c8b_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17c8b_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x17c8b_2_regions :: state_pred where
  \<open>P_0x17c8b_2_regions \<sigma> \<equiv> \<exists>regions. P_0x17c8b_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17c8e_2 :: state_pred where
  \<open>Q_0x17c8e_2 \<sigma> \<equiv> RIP \<sigma> = 0x17c8e \<and> RAX \<sigma> = strchr_0x17c86_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare Q_0x17c8e_2_def[Qs]

schematic_goal find_protocol_0_1_0x17c8b_0x17c8b_2[blocks]:
  assumes \<open>(P_0x17c8b_2 && P_0x17c8b_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17c8b 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17c8e_2 ?\<sigma> \<and> block_usage P_0x17c8b_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17c8b_2_def P_0x17c8b_2_regions_def post: Q_0x17c8e_2_def regionset: P_0x17c8b_2_regions_set_def)

definition P_0x17c8e_true_3 :: state_pred where
  \<open>P_0x17c8e_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x17c8e \<and> RAX \<sigma> = strchr_0x17c86_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare P_0x17c8e_true_3_def[Ps]

definition P_0x17c8e_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17c8e_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x17c8e_true_3_regions :: state_pred where
  \<open>P_0x17c8e_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x17c8e_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cfb_3 :: state_pred where
  \<open>Q_0x17cfb_3 \<sigma> \<equiv> RIP \<sigma> = 0x17cfb \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17cfb_3_def[Qs]

schematic_goal find_protocol_0_3_0x17c8e_0x17d32_3[blocks]:
  assumes \<open>(P_0x17c8e_true_3 && P_0x17c8e_true_3_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x17d32 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cfb_3 ?\<sigma> \<and> block_usage P_0x17c8e_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17c8e_true_3_def P_0x17c8e_true_3_regions_def post: Q_0x17cfb_3_def regionset: P_0x17c8e_true_3_regions_set_def)

definition P_0x17c8e_false_4 :: state_pred where
  \<open>P_0x17c8e_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x17c8e \<and> RAX \<sigma> = strchr_0x17c86_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare P_0x17c8e_false_4_def[Ps]

definition P_0x17c8e_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17c8e_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x17c8e_false_4_regions :: state_pred where
  \<open>P_0x17c8e_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x17c8e_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17c9a_4 :: state_pred where
  \<open>Q_0x17c9a_4 \<sigma> \<equiv> RIP \<sigma> = 0x17c9a \<and> RAX \<sigma> = ((strchr_0x17c86_retval::64 word) - RDI\<^sub>0) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare Q_0x17c9a_4_def[Qs]

schematic_goal find_protocol_0_3_0x17c8e_0x17c97_4[blocks]:
  assumes \<open>(P_0x17c8e_false_4 && P_0x17c8e_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x17c97 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17c9a_4 ?\<sigma> \<and> block_usage P_0x17c8e_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17c8e_false_4_def P_0x17c8e_false_4_regions_def post: Q_0x17c9a_4_def regionset: P_0x17c8e_false_4_regions_set_def)

definition P_0x17c9a_true_5 :: state_pred where
  \<open>P_0x17c9a_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x17c9a \<and> RAX \<sigma> = ((strchr_0x17c86_retval::64 word) - RDI\<^sub>0) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare P_0x17c9a_true_5_def[Ps]

definition P_0x17c9a_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17c9a_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x17c9a_true_5_regions :: state_pred where
  \<open>P_0x17c9a_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x17c9a_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17ca6_5 :: state_pred where
  \<open>Q_0x17ca6_5 \<sigma> \<equiv> RIP \<sigma> = 0x17ca6 \<and> RAX \<sigma> = ((strchr_0x17c86_retval::64 word) - RDI\<^sub>0) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare Q_0x17ca6_5_def[Qs]

schematic_goal find_protocol_0_4_0x17c9a_0x17d2b_5[blocks]:
  assumes \<open>(P_0x17c9a_true_5 && P_0x17c9a_true_5_regions && ja) \<sigma>\<close>
  shows \<open>exec_block 4 0x17d2b 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17ca6_5 ?\<sigma> \<and> block_usage P_0x17c9a_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17c9a_true_5_def P_0x17c9a_true_5_regions_def post: Q_0x17ca6_5_def regionset: P_0x17c9a_true_5_regions_set_def)

definition P_0x17c9a_false_6 :: state_pred where
  \<open>P_0x17c9a_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x17c9a \<and> RAX \<sigma> = ((strchr_0x17c86_retval::64 word) - RDI\<^sub>0) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare P_0x17c9a_false_6_def[Ps]

definition P_0x17c9a_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17c9a_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x17c9a_false_6_regions :: state_pred where
  \<open>P_0x17c9a_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x17c9a_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17ca6_6 :: state_pred where
  \<open>Q_0x17ca6_6 \<sigma> \<equiv> RIP \<sigma> = 0x17ca6 \<and> RAX \<sigma> = ((strchr_0x17c86_retval::64 word) - RDI\<^sub>0) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare Q_0x17ca6_6_def[Qs]

schematic_goal find_protocol_0_3_0x17c9a_0x17ca3_6[blocks]:
  assumes \<open>(P_0x17c9a_false_6 && P_0x17c9a_false_6_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block 3 0x17ca3 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17ca6_6 ?\<sigma> \<and> block_usage P_0x17c9a_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17c9a_false_6_def P_0x17c9a_false_6_regions_def post: Q_0x17ca6_6_def regionset: P_0x17c9a_false_6_regions_set_def)

definition P_0x17ca6_7 :: state_pred where
  \<open>P_0x17ca6_7 \<sigma> \<equiv> RIP \<sigma> = 0x17ca6 \<and> RAX \<sigma> = ((strchr_0x17c86_retval::64 word) - RDI\<^sub>0) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare P_0x17ca6_7_def[Ps]

definition P_0x17ca6_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ca6_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x17ca6_7_regions :: state_pred where
  \<open>P_0x17ca6_7_regions \<sigma> \<equiv> \<exists>regions. P_0x17ca6_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cb4_7 :: state_pred where
  \<open>Q_0x17cb4_7 \<sigma> \<equiv> RIP \<sigma> = 0x17cb4 \<and> RAX \<sigma> = ((strchr_0x17c86_retval::64 word) - RDI\<^sub>0) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare Q_0x17cb4_7_def[Qs]

schematic_goal find_protocol_0_4_0x17ca6_0x17cb1_7[blocks]:
  assumes \<open>(P_0x17ca6_7 && P_0x17ca6_7_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x17cb1 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cb4_7 ?\<sigma> \<and> block_usage P_0x17ca6_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ca6_7_def P_0x17ca6_7_regions_def post: Q_0x17cb4_7_def regionset: P_0x17ca6_7_regions_set_def)

definition P_0x17cb4_8 :: state_pred where
  \<open>P_0x17cb4_8 \<sigma> \<equiv> RIP \<sigma> = 0x17cb4 \<and> RAX \<sigma> = ((strchr_0x17c86_retval::64 word) - RDI\<^sub>0) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17c8b\<close>
declare P_0x17cb4_8_def[Ps]

definition P_0x17cb4_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cb4_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x17cb4_8_regions :: state_pred where
  \<open>P_0x17cb4_8_regions \<sigma> \<equiv> \<exists>regions. P_0x17cb4_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_chk_addr_0x17cb4_8 :: state_pred where
  \<open>Q_memcpy_chk_addr_0x17cb4_8 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xb0) \<and> RIP \<sigma> = memcpy_chk_addr \<and> RAX \<sigma> = ((strchr_0x17c86_retval::64 word) - RDI\<^sub>0) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17cb9\<close>
declare Q_memcpy_chk_addr_0x17cb4_8_def[Qs]

schematic_goal find_protocol_0_1_0x17cb4_0x17cb4_8[blocks]:
  assumes \<open>(P_0x17cb4_8 && P_0x17cb4_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17cb4 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_chk_addr_0x17cb4_8 ?\<sigma> \<and> block_usage P_0x17cb4_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cb4_8_def P_0x17cb4_8_regions_def post: Q_memcpy_chk_addr_0x17cb4_8_def regionset: P_0x17cb4_8_regions_set_def)

definition P_0x17cb9_9 :: state_pred where
  \<open>P_0x17cb9_9 \<sigma> \<equiv> RIP \<sigma> = 0x17cb9 \<and> RAX \<sigma> = memcpy_chk_0x17cb4_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17cb9\<close>
declare P_0x17cb9_9_def[Ps]

definition P_0x17cb9_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cb9_9_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (8, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cb9_9_regions :: state_pred where
  \<open>P_0x17cb9_9_regions \<sigma> \<equiv> \<exists>regions. P_0x17cb9_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cca_9 :: state_pred where
  \<open>Q_0x17cca_9 \<sigma> \<equiv> RIP \<sigma> = 0x17cca \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17cb9 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cca_9_def[Qs]

schematic_goal find_protocol_0_4_0x17cb9_0x17cc7_9[blocks]:
  assumes \<open>(P_0x17cb9_9 && P_0x17cb9_9_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x17cc7 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cca_9 ?\<sigma> \<and> block_usage P_0x17cb9_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cb9_9_def P_0x17cb9_9_regions_def post: Q_0x17cca_9_def regionset: P_0x17cb9_9_regions_set_def)

definition P_0x17cca_true_10 :: state_pred where
  \<open>P_0x17cca_true_10 \<sigma> \<equiv> RIP \<sigma> = 0x17cca \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17cb9 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cca_true_10_def[Ps]

definition P_0x17cca_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cca_true_10_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (8, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cca_true_10_regions :: state_pred where
  \<open>P_0x17cca_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0x17cca_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cfb_10 :: state_pred where
  \<open>Q_0x17cfb_10 \<sigma> \<equiv> RIP \<sigma> = 0x17cfb \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17cfb_10_def[Qs]

schematic_goal find_protocol_0_2_0x17cca_0x17cf4_10[blocks]:
  assumes \<open>(P_0x17cca_true_10 && P_0x17cca_true_10_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x17cf4 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cfb_10 ?\<sigma> \<and> block_usage P_0x17cca_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cca_true_10_def P_0x17cca_true_10_regions_def post: Q_0x17cfb_10_def regionset: P_0x17cca_true_10_regions_set_def)

definition P_0x17cca_false_11 :: state_pred where
  \<open>P_0x17cca_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x17cca \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17cb9 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cca_false_11_def[Ps]

definition P_0x17cca_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cca_false_11_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (8, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cca_false_11_regions :: state_pred where
  \<open>P_0x17cca_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x17cca_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cd0_11 :: state_pred where
  \<open>Q_0x17cd0_11 \<sigma> \<equiv> RIP \<sigma> = 0x17cd0 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cd0_11_def[Qs]

schematic_goal find_protocol_0_2_0x17cca_0x17ccc_11[blocks]:
  assumes \<open>(P_0x17cca_false_11 && P_0x17cca_false_11_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x17ccc 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cd0_11 ?\<sigma> \<and> block_usage P_0x17cca_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cca_false_11_def P_0x17cca_false_11_regions_def post: Q_0x17cd0_11_def regionset: P_0x17cca_false_11_regions_set_def)

definition P_0x17cd0_12 :: state_pred where
  \<open>P_0x17cd0_12 \<sigma> \<equiv> RIP \<sigma> = 0x17cd0 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cd0_12_def[Ps]

definition P_0x17cd0_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cd0_12_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x88), 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cd0_12_regions :: state_pred where
  \<open>P_0x17cd0_12_regions \<sigma> \<equiv> \<exists>regions. P_0x17cd0_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cda_12 :: state_pred where
  \<open>Q_0x17cda_12 \<sigma> \<equiv> RIP \<sigma> = 0x17cda \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cda_12_def[Qs]

schematic_goal find_protocol_0_2_0x17cd0_0x17cd7_12[blocks]:
  assumes \<open>(P_0x17cd0_12 && P_0x17cd0_12_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x17cd7 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cda_12 ?\<sigma> \<and> block_usage P_0x17cd0_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cd0_12_def P_0x17cd0_12_regions_def post: Q_0x17cda_12_def regionset: P_0x17cd0_12_regions_set_def)

definition P_0x17cda_true_13 :: state_pred where
  \<open>P_0x17cda_true_13 \<sigma> \<equiv> RIP \<sigma> = 0x17cda \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cda_true_13_def[Ps]

definition P_0x17cda_true_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cda_true_13_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x88), 8),
    (3, ((RBX \<sigma>::64 word) + 0x138), 8),
    (4, ((FS\<^sub>0::64 word) + 0x28), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cda_true_13_regions :: state_pred where
  \<open>P_0x17cda_true_13_regions \<sigma> \<equiv> \<exists>regions. P_0x17cda_true_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cf2_13 :: state_pred where
  \<open>Q_0x17cf2_13 \<sigma> \<equiv> RIP \<sigma> = 0x17cf2 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cf2_13_def[Qs]

schematic_goal find_protocol_0_3_0x17cda_0x17cef_13[blocks]:
  assumes \<open>(P_0x17cda_true_13 && P_0x17cda_true_13_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x17cef 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cf2_13 ?\<sigma> \<and> block_usage P_0x17cda_true_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cda_true_13_def P_0x17cda_true_13_regions_def post: Q_0x17cf2_13_def regionset: P_0x17cda_true_13_regions_set_def)

definition P_0x17cf2_true_14 :: state_pred where
  \<open>P_0x17cf2_true_14 \<sigma> \<equiv> RIP \<sigma> = 0x17cf2 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cf2_true_14_def[Ps]

definition P_0x17cf2_true_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cf2_true_14_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cf2_true_14_regions :: state_pred where
  \<open>P_0x17cf2_true_14_regions \<sigma> \<equiv> \<exists>regions. P_0x17cf2_true_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cd0_14 :: state_pred where
  \<open>Q_0x17cd0_14 \<sigma> \<equiv> RIP \<sigma> = 0x17cd0 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cd0_14_def[Qs]

schematic_goal find_protocol_0_1_0x17cf2_0x17cf2_14[blocks]:
  assumes \<open>(P_0x17cf2_true_14 && P_0x17cf2_true_14_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17cf2 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cd0_14 ?\<sigma> \<and> block_usage P_0x17cf2_true_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cf2_true_14_def P_0x17cf2_true_14_regions_def post: Q_0x17cd0_14_def regionset: P_0x17cf2_true_14_regions_set_def)

definition P_0x17cf2_false_15 :: state_pred where
  \<open>P_0x17cf2_false_15 \<sigma> \<equiv> RIP \<sigma> = 0x17cf2 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cf2_false_15_def[Ps]

definition P_0x17cf2_false_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cf2_false_15_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cf2_false_15_regions :: state_pred where
  \<open>P_0x17cf2_false_15_regions \<sigma> \<equiv> \<exists>regions. P_0x17cf2_false_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cf4_15 :: state_pred where
  \<open>Q_0x17cf4_15 \<sigma> \<equiv> RIP \<sigma> = 0x17cf4 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cf4_15_def[Qs]

schematic_goal find_protocol_0_1_0x17cf2_0x17cf2_15[blocks]:
  assumes \<open>(P_0x17cf2_false_15 && P_0x17cf2_false_15_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17cf2 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cf4_15 ?\<sigma> \<and> block_usage P_0x17cf2_false_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cf2_false_15_def P_0x17cf2_false_15_regions_def post: Q_0x17cf4_15_def regionset: P_0x17cf2_false_15_regions_set_def)

definition P_0x17cda_false_16 :: state_pred where
  \<open>P_0x17cda_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x17cda \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cda_false_16_def[Ps]

definition P_0x17cda_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cda_false_16_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x88), 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cda_false_16_regions :: state_pred where
  \<open>P_0x17cda_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x17cda_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cdf_16 :: state_pred where
  \<open>Q_0x17cdf_16 \<sigma> \<equiv> RIP \<sigma> = 0x17cdf \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cdf_16_def[Qs]

schematic_goal find_protocol_0_2_0x17cda_0x17cdc_16[blocks]:
  assumes \<open>(P_0x17cda_false_16 && P_0x17cda_false_16_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x17cdc 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cdf_16 ?\<sigma> \<and> block_usage P_0x17cda_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cda_false_16_def P_0x17cda_false_16_regions_def post: Q_0x17cdf_16_def regionset: P_0x17cda_false_16_regions_set_def)

definition P_0x17cdf_17 :: state_pred where
  \<open>P_0x17cdf_17 \<sigma> \<equiv> RIP \<sigma> = 0x17cdf \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cdf_17_def[Ps]

definition P_0x17cdf_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cdf_17_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x88), 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cdf_17_regions :: state_pred where
  \<open>P_0x17cdf_17_regions \<sigma> \<equiv> \<exists>regions. P_0x17cdf_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strcmp_addr_0x17cdf_17 :: state_pred where
  \<open>Q_strcmp_addr_0x17cdf_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xb0) \<and> RIP \<sigma> = strcmp_addr \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17ce4 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_strcmp_addr_0x17cdf_17_def[Qs]

schematic_goal find_protocol_0_1_0x17cdf_0x17cdf_17[blocks]:
  assumes \<open>(P_0x17cdf_17 && P_0x17cdf_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17cdf 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strcmp_addr_0x17cdf_17 ?\<sigma> \<and> block_usage P_0x17cdf_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cdf_17_def P_0x17cdf_17_regions_def post: Q_strcmp_addr_0x17cdf_17_def regionset: P_0x17cdf_17_regions_set_def)

definition P_0x17ce4_18 :: state_pred where
  \<open>P_0x17ce4_18 \<sigma> \<equiv> RIP \<sigma> = 0x17ce4 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17ce4 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17ce4_18_def[Ps]

definition P_0x17ce4_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ce4_18_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x88), 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17ce4_18_regions :: state_pred where
  \<open>P_0x17ce4_18_regions \<sigma> \<equiv> \<exists>regions. P_0x17ce4_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17ce6_18 :: state_pred where
  \<open>Q_0x17ce6_18 \<sigma> \<equiv> RIP \<sigma> = 0x17ce6 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17ce4 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17ce6_18_def[Qs]

schematic_goal find_protocol_0_1_0x17ce4_0x17ce4_18[blocks]:
  assumes \<open>(P_0x17ce4_18 && P_0x17ce4_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17ce4 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17ce6_18 ?\<sigma> \<and> block_usage P_0x17ce4_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ce4_18_def P_0x17ce4_18_regions_def post: Q_0x17ce6_18_def regionset: P_0x17ce4_18_regions_set_def)

definition P_0x17ce6_true_19 :: state_pred where
  \<open>P_0x17ce6_true_19 \<sigma> \<equiv> RIP \<sigma> = 0x17ce6 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17ce4 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17ce6_true_19_def[Ps]

definition P_0x17ce6_true_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ce6_true_19_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x88), 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17ce6_true_19_regions :: state_pred where
  \<open>P_0x17ce6_true_19_regions \<sigma> \<equiv> \<exists>regions. P_0x17ce6_true_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cfb_19 :: state_pred where
  \<open>Q_0x17cfb_19 \<sigma> \<equiv> RIP \<sigma> = 0x17cfb \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cfb_19_def[Qs]

schematic_goal find_protocol_0_1_0x17ce6_0x17ce6_19[blocks]:
  assumes \<open>(P_0x17ce6_true_19 && P_0x17ce6_true_19_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17ce6 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cfb_19 ?\<sigma> \<and> block_usage P_0x17ce6_true_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ce6_true_19_def P_0x17ce6_true_19_regions_def post: Q_0x17cfb_19_def regionset: P_0x17ce6_true_19_regions_set_def)

definition P_0x17ce6_false_20 :: state_pred where
  \<open>P_0x17ce6_false_20 \<sigma> \<equiv> RIP \<sigma> = 0x17ce6 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x88),8]::64 word) \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x17ce4 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17ce6_false_20_def[Ps]

definition P_0x17ce6_false_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ce6_false_20_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x88), 8),
    (3, ((RBX \<sigma>::64 word) + 0x138), 8),
    (4, ((FS\<^sub>0::64 word) + 0x28), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (10, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17ce6_false_20_regions :: state_pred where
  \<open>P_0x17ce6_false_20_regions \<sigma> \<equiv> \<exists>regions. P_0x17ce6_false_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cf2_20 :: state_pred where
  \<open>Q_0x17cf2_20 \<sigma> \<equiv> RIP \<sigma> = 0x17cf2 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cf2_20_def[Qs]

schematic_goal find_protocol_0_3_0x17ce6_0x17cef_20[blocks]:
  assumes \<open>(P_0x17ce6_false_20 && P_0x17ce6_false_20_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x17cef 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cf2_20 ?\<sigma> \<and> block_usage P_0x17ce6_false_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ce6_false_20_def P_0x17ce6_false_20_regions_def post: Q_0x17cf2_20_def regionset: P_0x17ce6_false_20_regions_set_def)

definition P_0x17cf2_true_21 :: state_pred where
  \<open>P_0x17cf2_true_21 \<sigma> \<equiv> RIP \<sigma> = 0x17cf2 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cf2_true_21_def[Ps]

definition P_0x17cf2_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cf2_true_21_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cf2_true_21_regions :: state_pred where
  \<open>P_0x17cf2_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0x17cf2_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cd0_21 :: state_pred where
  \<open>Q_0x17cd0_21 \<sigma> \<equiv> RIP \<sigma> = 0x17cd0 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cd0_21_def[Qs]

schematic_goal find_protocol_0_1_0x17cf2_0x17cf2_21[blocks]:
  assumes \<open>(P_0x17cf2_true_21 && P_0x17cf2_true_21_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17cf2 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cd0_21 ?\<sigma> \<and> block_usage P_0x17cf2_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cf2_true_21_def P_0x17cf2_true_21_regions_def post: Q_0x17cd0_21_def regionset: P_0x17cf2_true_21_regions_set_def)

definition P_0x17cf2_false_22 :: state_pred where
  \<open>P_0x17cf2_false_22 \<sigma> \<equiv> RIP \<sigma> = 0x17cf2 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cf2_false_22_def[Ps]

definition P_0x17cf2_false_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cf2_false_22_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cf2_false_22_regions :: state_pred where
  \<open>P_0x17cf2_false_22_regions \<sigma> \<equiv> \<exists>regions. P_0x17cf2_false_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cf4_22 :: state_pred where
  \<open>Q_0x17cf4_22 \<sigma> \<equiv> RIP \<sigma> = 0x17cf4 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare Q_0x17cf4_22_def[Qs]

schematic_goal find_protocol_0_1_0x17cf2_0x17cf2_22[blocks]:
  assumes \<open>(P_0x17cf2_false_22 && P_0x17cf2_false_22_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17cf2 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cf4_22 ?\<sigma> \<and> block_usage P_0x17cf2_false_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cf2_false_22_def P_0x17cf2_false_22_regions_def post: Q_0x17cf4_22_def regionset: P_0x17cf2_false_22_regions_set_def)

definition P_0x17cf4_23 :: state_pred where
  \<open>P_0x17cf4_23 \<sigma> \<equiv> RIP \<sigma> = 0x17cf4 \<and> RCX \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a380,8]::64 word) = (\<sigma> \<turnstile> *[0x2a380,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8),1]::8 word) = 0x0\<close>
declare P_0x17cf4_23_def[Ps]

definition P_0x17cf4_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cf4_23_regions_set \<sigma> \<equiv> {
    (0, 0x2a380, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) - 0xa8), Suc 0)
  }\<close>

definition P_0x17cf4_23_regions :: state_pred where
  \<open>P_0x17cf4_23_regions \<sigma> \<equiv> \<exists>regions. P_0x17cf4_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17cfb_23 :: state_pred where
  \<open>Q_0x17cfb_23 \<sigma> \<equiv> RIP \<sigma> = 0x17cfb \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17cfb_23_def[Qs]

schematic_goal find_protocol_0_1_0x17cf4_0x17cf4_23[blocks]:
  assumes \<open>(P_0x17cf4_23 && P_0x17cf4_23_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17cf4 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17cfb_23 ?\<sigma> \<and> block_usage P_0x17cf4_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cf4_23_def P_0x17cf4_23_regions_def post: Q_0x17cfb_23_def regionset: P_0x17cf4_23_regions_set_def)

definition P_0x17cfb_24 :: state_pred where
  \<open>P_0x17cfb_24 \<sigma> \<equiv> RIP \<sigma> = 0x17cfb \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x17cfb_24_def[Ps]

definition P_0x17cfb_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17cfb_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x17cfb_24_regions :: state_pred where
  \<open>P_0x17cfb_24_regions \<sigma> \<equiv> \<exists>regions. P_0x17cfb_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17d0f_24 :: state_pred where
  \<open>Q_0x17d0f_24 \<sigma> \<equiv> RIP \<sigma> = 0x17d0f \<and> RAX \<sigma> = RBX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17d0f_24_def[Qs]

schematic_goal find_protocol_0_3_0x17cfb_0x17d0c_24[blocks]:
  assumes \<open>(P_0x17cfb_24 && P_0x17cfb_24_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x17d0c 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17d0f_24 ?\<sigma> \<and> block_usage P_0x17cfb_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17cfb_24_def P_0x17cfb_24_regions_def post: Q_0x17d0f_24_def regionset: P_0x17cfb_24_regions_set_def)

definition P_0x17d0f_true_25 :: state_pred where
  \<open>P_0x17d0f_true_25 \<sigma> \<equiv> RIP \<sigma> = 0x17d0f \<and> RAX \<sigma> = RBX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x17d0f_true_25_def[Ps]

definition P_0x17d0f_true_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17d0f_true_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x17d0f_true_25_regions :: state_pred where
  \<open>P_0x17d0f_true_25_regions \<sigma> \<equiv> \<exists>regions. P_0x17d0f_true_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17d34_25 :: state_pred where
  \<open>Q_0x17d34_25 \<sigma> \<equiv> RIP \<sigma> = 0x17d34 \<and> RAX \<sigma> = RBX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17d34_25_def[Qs]

schematic_goal find_protocol_0_1_0x17d0f_0x17d0f_25[blocks]:
  assumes \<open>(P_0x17d0f_true_25 && P_0x17d0f_true_25_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17d0f 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17d34_25 ?\<sigma> \<and> block_usage P_0x17d0f_true_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17d0f_true_25_def P_0x17d0f_true_25_regions_def post: Q_0x17d34_25_def regionset: P_0x17d0f_true_25_regions_set_def)

definition P_0x17d34_26 :: state_pred where
  \<open>P_0x17d34_26 \<sigma> \<equiv> RIP \<sigma> = 0x17d34 \<and> RAX \<sigma> = RBX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x17d34_26_def[Ps]

definition P_0x17d34_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17d34_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x17d34_26_regions :: state_pred where
  \<open>P_0x17d34_26_regions \<sigma> \<equiv> \<exists>regions. P_0x17d34_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x17d34_26 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x17d34_26 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xb0) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = RBX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x17d34_26_def[Qs]

schematic_goal find_protocol_0_1_0x17d34_0x17d34_26[blocks]:
  assumes \<open>(P_0x17d34_26 && P_0x17d34_26_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17d34 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x17d34_26 ?\<sigma> \<and> block_usage P_0x17d34_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17d34_26_def P_0x17d34_26_regions_def post: Q_stack_chk_fail_addr_0x17d34_26_def regionset: P_0x17d34_26_regions_set_def)

definition P_0x17d0f_false_27 :: state_pred where
  \<open>P_0x17d0f_false_27 \<sigma> \<equiv> RIP \<sigma> = 0x17d0f \<and> RAX \<sigma> = RBX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x17d0f_false_27_def[Ps]

definition P_0x17d0f_false_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17d0f_false_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x17d0f_false_27_regions :: state_pred where
  \<open>P_0x17d0f_false_27_regions \<sigma> \<equiv> \<exists>regions. P_0x17d0f_false_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_27 :: state_pred where
  \<open>Q_ret_address_27 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RCX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_27_def[Qs]

schematic_goal find_protocol_0_6_0x17d0f_0x17d1c_27[blocks]:
  assumes \<open>(P_0x17d0f_false_27 && P_0x17d0f_false_27_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x17d1c 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_27 ?\<sigma> \<and> block_usage P_0x17d0f_false_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17d0f_false_27_def P_0x17d0f_false_27_regions_def post: Q_ret_address_27_def regionset: P_0x17d0f_false_27_regions_set_def)

definition find_protocol_acode :: ACode where
  \<open>find_protocol_acode =
    Block 9 0x17c84 0;
    Block (Suc 0) 0x17c86 (Suc 0);
    CALL strchr_acode;
    Block (Suc 0) 0x17c8b 2;
    IF ZF THEN
      Block 3 0x17d32 3
    ELSE
      Block 3 0x17c97 4;
      IF ja THEN
        Block 4 0x17d2b 5
      ELSE
        Block 3 0x17ca3 6
      FI;
      Block 4 0x17cb1 7;
      Block (Suc 0) 0x17cb4 8;
      CALL memcpy_chk_acode;
      Block 4 0x17cc7 9;
      IF ZF THEN
        Block 2 0x17cf4 10
      ELSE
        Block 2 0x17ccc 11;
        WHILE P_0x17cd0_12 DO
          Block 2 0x17cd7 12;
          IF ZF THEN
            Block 3 0x17cef 13;
            IF !ZF THEN
              Block (Suc 0) 0x17cf2 14
            ELSE
              Block (Suc 0) 0x17cf2 15
            FI
          ELSE
            Block 2 0x17cdc 16;
            Block (Suc 0) 0x17cdf 17;
            CALL strcmp_acode;
            Block (Suc 0) 0x17ce4 18;
            IF ZF THEN
              Block (Suc 0) 0x17ce6 19
            ELSE
              Block 3 0x17cef 20;
              IF !ZF THEN
                Block (Suc 0) 0x17cf2 21
              ELSE
                Block (Suc 0) 0x17cf2 22
              FI
            FI
          FI
        OD;
        CASES [
          (P_0x17cf4_23,
            Block (Suc 0) 0x17cf4 23
          )
        ]
      FI
    FI;
    Block 3 0x17d0c 24;
    IF !ZF THEN
      Block (Suc 0) 0x17d0f 25;
      Block (Suc 0) 0x17d34 26;
      CALL stack_chk_fail_acode
    ELSE
      Block 6 0x17d1c 27
    FI
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


schematic_goal "find_protocol":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17c86 \<longrightarrow> P_0x17c86_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17c8b \<longrightarrow> P_0x17c8b_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17c8e \<longrightarrow> P_0x17c8e_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17c8e \<longrightarrow> P_0x17c8e_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17c9a \<longrightarrow> P_0x17c9a_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17c9a \<longrightarrow> P_0x17c9a_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ca6 \<longrightarrow> P_0x17ca6_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cb4 \<longrightarrow> P_0x17cb4_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cb9 \<longrightarrow> P_0x17cb9_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cca \<longrightarrow> P_0x17cca_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cca \<longrightarrow> P_0x17cca_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cd0 \<longrightarrow> P_0x17cd0_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cda \<longrightarrow> P_0x17cda_true_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cf2 \<longrightarrow> P_0x17cf2_true_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cf2 \<longrightarrow> P_0x17cf2_false_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cda \<longrightarrow> P_0x17cda_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cdf \<longrightarrow> P_0x17cdf_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ce4 \<longrightarrow> P_0x17ce4_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ce6 \<longrightarrow> P_0x17ce6_true_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ce6 \<longrightarrow> P_0x17ce6_false_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cf2 \<longrightarrow> P_0x17cf2_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cf2 \<longrightarrow> P_0x17cf2_false_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cf4 \<longrightarrow> P_0x17cf4_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17cfb \<longrightarrow> P_0x17cfb_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17d0f \<longrightarrow> P_0x17d0f_true_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17d34 \<longrightarrow> P_0x17d34_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17d0f \<longrightarrow> P_0x17d0f_false_27_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_strchr_addr_0x17c86_1}} \<box>strchr_acode {{P_0x17c8b_2;M_0x17c86}}\<close>
    and [blocks]: \<open>{{Q_memcpy_chk_addr_0x17cb4_8}} \<box>memcpy_chk_acode {{P_0x17cb9_9;M_0x17cb4}}\<close>
    and [blocks]: \<open>{{Q_strcmp_addr_0x17cdf_17}} \<box>strcmp_acode {{P_0x17ce4_18;M_0x17cdf}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x17d34_26}} \<box>stack_chk_fail_acode {{Q_fail;M_0x17d34}}\<close>
  shows \<open>{{?P}} find_protocol_acode {{?Q;?M}}\<close>
  apply (vcg acode: find_protocol_acode_def assms: assms)
  apply (vcg_while "P_0x17cd0_12 || P_0x17cf4_23 || P_0x17cfb_24")
  apply (simp add: assms)
  apply simp
  apply (vcg_step assms: assms)+
  apply (auto simp add: Ps Qs pred_logic assms)[1]
  apply (rule htriples)+
  apply simp
  apply (vcg_step assms: assms)+
  done


end
