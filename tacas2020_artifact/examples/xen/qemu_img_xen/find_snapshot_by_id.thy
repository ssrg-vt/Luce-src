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
theory find_snapshot_by_id
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes strcmp_0x12d63_retval\<^sub>v find_snapshot_by_id_isra_8_0x12db0_retval\<^sub>v strcmp_0x12df3_retval\<^sub>v strcmp_addr :: \<open>64 word\<close>
    and strcmp_acode :: ACode
  assumes fetch:
    "fetch 0x12d20 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x12d22 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12d24 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12d25 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12d26 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x12d2b \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x12d2f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 860))))), 7)"
    "fetch 0x12d36 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x12d39 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 77164)), 2)"
    "fetch 0x12d3b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 864))))), 7)"
    "fetch 0x12d42 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x12d45 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x12d47 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x12d4b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 77148)), 2)"
    "fetch 0x12d4d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x12d50 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x12d53 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 56)), 4)"
    "fetch 0x12d57 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x12d5a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 77184)), 2)"
    "fetch 0x12d5c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0))))), 4)"
    "fetch 0x12d60 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x12d63 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strcmp'')), 5)"
    "fetch 0x12d68 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12d6a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 77136)), 2)"
    "fetch 0x12d6c \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x12d70 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x12d72 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12d73 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12d74 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12d76 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x12d78 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x12d79 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x12d80 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x12d84 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x12d89 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x12d8b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12d8c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12d8d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12d8f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x12d91 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x12d92 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x12da0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x12da2 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12da4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x12da7 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12da8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x12dab \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12dac \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x12db0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''find_snapshot_by_id.isra.8'')), 5)"
    "fetch 0x12db5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12db7 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12db9 \<equiv> (Unary (IS_8088 Jns) (Immediate SixtyFour (ImmVal 77308)), 2)"
    "fetch 0x12dbb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 860))))), 7)"
    "fetch 0x12dc2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x12dc7 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x12dca \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 77308)), 2)"
    "fetch 0x12dcc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 864))))), 7)"
    "fetch 0x12dd3 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x12dd5 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x12dd9 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 77292)), 2)"
    "fetch 0x12ddb \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x12de0 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x12de3 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 56)), 4)"
    "fetch 0x12de7 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x12dea \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 77328)), 2)"
    "fetch 0x12dec \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0))))), 4)"
    "fetch 0x12df0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x12df3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strcmp'')), 5)"
    "fetch 0x12df8 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12dfa \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 77280)), 2)"
    "fetch 0x12dfc \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x12e00 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x12e02 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12e03 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12e04 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12e06 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x12e08 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x12e09 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x12e10 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x12e14 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x12e19 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x12e1b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12e1c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12e1d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12e1f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x12e21 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x12e22 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and find_snapshot_by_id_isra_8\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''find_snapshot_by_id.isra.8'') = 0x12d20\<close>
    and strcmp\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strcmp'') = strcmp_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>strcmp_0x12d63_retval \<equiv> strcmp_0x12d63_retval\<^sub>v\<close>
definition \<open>find_snapshot_by_id_isra_8_0x12db0_retval \<equiv> find_snapshot_by_id_isra_8_0x12db0_retval\<^sub>v\<close>
definition \<open>strcmp_0x12df3_retval \<equiv> strcmp_0x12df3_retval\<^sub>v\<close>

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

locale "find_snapshot_by_id_isra_8" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x12d20_0 :: state_pred where
  \<open>P_0x12d20_0 \<sigma> \<equiv> RIP \<sigma> = 0x12d20 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x12d20_0_def[Ps]

definition P_0x12d20_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d20_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12d20_0_regions :: state_pred where
  \<open>P_0x12d20_0_regions \<sigma> \<equiv> \<exists>regions. P_0x12d20_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12d39_0 :: state_pred where
  \<open>Q_0x12d39_0 \<sigma> \<equiv> RIP \<sigma> = 0x12d39 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = 0xffffffff \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12d39_0_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_8_0x12d20_0x12d36_0[blocks]:
  assumes \<open>(P_0x12d20_0 && P_0x12d20_0_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x12d36 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12d39_0 ?\<sigma> \<and> block_usage P_0x12d20_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d20_0_def P_0x12d20_0_regions_def post: Q_0x12d39_0_def regionset: P_0x12d20_0_regions_set_def)

definition P_0x12d39_true_1 :: state_pred where
  \<open>P_0x12d39_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x12d39 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = 0xffffffff \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12d39_true_1_def[Ps]

definition P_0x12d39_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d39_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12d39_true_1_regions :: state_pred where
  \<open>P_0x12d39_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x12d39_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_8_0x12d39_0x12d78_1[blocks]:
  assumes \<open>(P_0x12d39_true_1 && P_0x12d39_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 8 0x12d78 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x12d39_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d39_true_1_def P_0x12d39_true_1_regions_def post: Q_ret_address_1_def regionset: P_0x12d39_true_1_regions_set_def)

definition P_0x12d39_false_2 :: state_pred where
  \<open>P_0x12d39_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x12d39 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = 0xffffffff \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12d39_false_2_def[Ps]

definition P_0x12d39_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d39_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12d39_false_2_regions :: state_pred where
  \<open>P_0x12d39_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x12d39_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12d5c_2 :: state_pred where
  \<open>Q_0x12d5c_2 \<sigma> \<equiv> RIP \<sigma> = 0x12d5c \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12d5c_2_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_6_0x12d39_0x12d4b_2[blocks]:
  assumes \<open>(P_0x12d39_false_2 && P_0x12d39_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 6 0x12d4b 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12d5c_2 ?\<sigma> \<and> block_usage P_0x12d39_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d39_false_2_def P_0x12d39_false_2_regions_def post: Q_0x12d5c_2_def regionset: P_0x12d39_false_2_regions_set_def)

definition P_0x12d5c_3 :: state_pred where
  \<open>P_0x12d5c_3 \<sigma> \<equiv> RIP \<sigma> = 0x12d5c \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12d5c_3_def[Ps]

definition P_0x12d5c_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d5c_3_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12d5c_3_regions :: state_pred where
  \<open>P_0x12d5c_3_regions \<sigma> \<equiv> \<exists>regions. P_0x12d5c_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12d63_3 :: state_pred where
  \<open>Q_0x12d63_3 \<sigma> \<equiv> RIP \<sigma> = 0x12d63 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12d63_3_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_2_0x12d5c_0x12d60_3[blocks]:
  assumes \<open>(P_0x12d5c_3 && P_0x12d5c_3_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x12d60 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12d63_3 ?\<sigma> \<and> block_usage P_0x12d5c_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d5c_3_def P_0x12d5c_3_regions_def post: Q_0x12d63_3_def regionset: P_0x12d5c_3_regions_set_def)

definition P_0x12d63_4 :: state_pred where
  \<open>P_0x12d63_4 \<sigma> \<equiv> RIP \<sigma> = 0x12d63 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12d63_4_def[Ps]

definition P_0x12d63_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d63_4_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12d63_4_regions :: state_pred where
  \<open>P_0x12d63_4_regions \<sigma> \<equiv> \<exists>regions. P_0x12d63_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strcmp_addr_0x12d63_4 :: state_pred where
  \<open>Q_strcmp_addr_0x12d63_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = strcmp_addr \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12d68\<close>
declare Q_strcmp_addr_0x12d63_4_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_1_0x12d63_0x12d63_4[blocks]:
  assumes \<open>(P_0x12d63_4 && P_0x12d63_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12d63 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strcmp_addr_0x12d63_4 ?\<sigma> \<and> block_usage P_0x12d63_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d63_4_def P_0x12d63_4_regions_def post: Q_strcmp_addr_0x12d63_4_def regionset: P_0x12d63_4_regions_set_def)

definition P_0x12d68_5 :: state_pred where
  \<open>P_0x12d68_5 \<sigma> \<equiv> RIP \<sigma> = 0x12d68 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12d68\<close>
declare P_0x12d68_5_def[Ps]

definition P_0x12d68_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d68_5_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12d68_5_regions :: state_pred where
  \<open>P_0x12d68_5_regions \<sigma> \<equiv> \<exists>regions. P_0x12d68_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12d6a_5 :: state_pred where
  \<open>Q_0x12d6a_5 \<sigma> \<equiv> RIP \<sigma> = 0x12d6a \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12d68\<close>
declare Q_0x12d6a_5_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_1_0x12d68_0x12d68_5[blocks]:
  assumes \<open>(P_0x12d68_5 && P_0x12d68_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12d68 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12d6a_5 ?\<sigma> \<and> block_usage P_0x12d68_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d68_5_def P_0x12d68_5_regions_def post: Q_0x12d6a_5_def regionset: P_0x12d68_5_regions_set_def)

definition P_0x12d6a_true_6 :: state_pred where
  \<open>P_0x12d6a_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x12d6a \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12d68\<close>
declare P_0x12d6a_true_6_def[Ps]

definition P_0x12d6a_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d6a_true_6_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12d6a_true_6_regions :: state_pred where
  \<open>P_0x12d6a_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x12d6a_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12d5a_6 :: state_pred where
  \<open>Q_0x12d5a_6 \<sigma> \<equiv> RIP \<sigma> = 0x12d5a \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12d5a_6_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_4_0x12d6a_0x12d57_6[blocks]:
  assumes \<open>(P_0x12d6a_true_6 && P_0x12d6a_true_6_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x12d57 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12d5a_6 ?\<sigma> \<and> block_usage P_0x12d6a_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d6a_true_6_def P_0x12d6a_true_6_regions_def post: Q_0x12d5a_6_def regionset: P_0x12d6a_true_6_regions_set_def)

definition P_0x12d5a_true_7 :: state_pred where
  \<open>P_0x12d5a_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x12d5a \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12d5a_true_7_def[Ps]

definition P_0x12d5a_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d5a_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12d5a_true_7_regions :: state_pred where
  \<open>P_0x12d5a_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x12d5a_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12d80_7 :: state_pred where
  \<open>Q_0x12d80_7 \<sigma> \<equiv> RIP \<sigma> = 0x12d80 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12d80_7_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_1_0x12d5a_0x12d5a_7[blocks]:
  assumes \<open>(P_0x12d5a_true_7 && P_0x12d5a_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12d5a 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12d80_7 ?\<sigma> \<and> block_usage P_0x12d5a_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d5a_true_7_def P_0x12d5a_true_7_regions_def post: Q_0x12d80_7_def regionset: P_0x12d5a_true_7_regions_set_def)

definition P_0x12d5a_false_8 :: state_pred where
  \<open>P_0x12d5a_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x12d5a \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12d5a_false_8_def[Ps]

definition P_0x12d5a_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d5a_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12d5a_false_8_regions :: state_pred where
  \<open>P_0x12d5a_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x12d5a_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12d5c_8 :: state_pred where
  \<open>Q_0x12d5c_8 \<sigma> \<equiv> RIP \<sigma> = 0x12d5c \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12d5c_8_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_1_0x12d5a_0x12d5a_8[blocks]:
  assumes \<open>(P_0x12d5a_false_8 && P_0x12d5a_false_8_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12d5a 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12d5c_8 ?\<sigma> \<and> block_usage P_0x12d5a_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d5a_false_8_def P_0x12d5a_false_8_regions_def post: Q_0x12d5c_8_def regionset: P_0x12d5a_false_8_regions_set_def)

definition P_0x12d6a_false_9 :: state_pred where
  \<open>P_0x12d6a_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x12d6a \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12d68\<close>
declare P_0x12d6a_false_9_def[Ps]

definition P_0x12d6a_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d6a_false_9_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12d6a_false_9_regions :: state_pred where
  \<open>P_0x12d6a_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x12d6a_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12d6c_9 :: state_pred where
  \<open>Q_0x12d6c_9 \<sigma> \<equiv> RIP \<sigma> = 0x12d6c \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12d6c_9_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_1_0x12d6a_0x12d6a_9[blocks]:
  assumes \<open>(P_0x12d6a_false_9 && P_0x12d6a_false_9_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12d6a 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12d6c_9 ?\<sigma> \<and> block_usage P_0x12d6a_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d6a_false_9_def P_0x12d6a_false_9_regions_def post: Q_0x12d6c_9_def regionset: P_0x12d6a_false_9_regions_set_def)

definition P_0x12d80_10 :: state_pred where
  \<open>P_0x12d80_10 \<sigma> \<equiv> RIP \<sigma> = 0x12d80 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12d80_10_def[Ps]

definition P_0x12d80_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d80_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12d80_10_regions :: state_pred where
  \<open>P_0x12d80_10_regions \<sigma> \<equiv> \<exists>regions. P_0x12d80_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_10 :: state_pred where
  \<open>Q_ret_address_10 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_10_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_8_0x12d80_0x12d91_10[blocks]:
  assumes \<open>(P_0x12d80_10 && P_0x12d80_10_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x12d91 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_10 ?\<sigma> \<and> block_usage P_0x12d80_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d80_10_def P_0x12d80_10_regions_def post: Q_ret_address_10_def regionset: P_0x12d80_10_regions_set_def)

definition P_0x12d6c_11 :: state_pred where
  \<open>P_0x12d6c_11 \<sigma> \<equiv> RIP \<sigma> = 0x12d6c \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12d6c_11_def[Ps]

definition P_0x12d6c_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12d6c_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12d6c_11_regions :: state_pred where
  \<open>P_0x12d6c_11_regions \<sigma> \<equiv> \<exists>regions. P_0x12d6c_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_11 :: state_pred where
  \<open>Q_ret_address_11 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_11_def[Qs]

schematic_goal find_snapshot_by_id_isra_8_0_7_0x12d6c_0x12d78_11[blocks]:
  assumes \<open>(P_0x12d6c_11 && P_0x12d6c_11_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x12d78 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_11 ?\<sigma> \<and> block_usage P_0x12d6c_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12d6c_11_def P_0x12d6c_11_regions_def post: Q_ret_address_11_def regionset: P_0x12d6c_11_regions_set_def)

definition find_snapshot_by_id_isra_8_acode :: ACode where
  \<open>find_snapshot_by_id_isra_8_acode =
    Block 8 0x12d36 0;
    IF jle THEN
      Block 8 0x12d78 (Suc 0)
    ELSE
      Block 6 0x12d4b 2;
      WHILE P_0x12d5c_3 DO
        Block 2 0x12d60 3;
        Block (Suc 0) 0x12d63 4;
        CALL strcmp_acode;
        Block (Suc 0) 0x12d68 5;
        IF !ZF THEN
          Block 4 0x12d57 6;
          IF ZF THEN
            Block (Suc 0) 0x12d5a 7
          ELSE
            Block (Suc 0) 0x12d5a 8
          FI
        ELSE
          Block (Suc 0) 0x12d6a 9
        FI
      OD;
      CASES [
        (P_0x12d80_10,
          Block 8 0x12d91 10
        ),
        (P_0x12d6c_11,
          Block 7 0x12d78 11
        )
      ]
    FI
  \<close>

schematic_goal "find_snapshot_by_id_isra_8":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d39 \<longrightarrow> P_0x12d39_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d39 \<longrightarrow> P_0x12d39_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d5c \<longrightarrow> P_0x12d5c_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d63 \<longrightarrow> P_0x12d63_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d68 \<longrightarrow> P_0x12d68_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d6a \<longrightarrow> P_0x12d6a_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d5a \<longrightarrow> P_0x12d5a_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d5a \<longrightarrow> P_0x12d5a_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d6a \<longrightarrow> P_0x12d6a_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d80 \<longrightarrow> P_0x12d80_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d6c \<longrightarrow> P_0x12d6c_11_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_strcmp_addr_0x12d63_4}} \<box>strcmp_acode {{P_0x12d68_5;M_0x12d63}}\<close>
  shows \<open>{{?P}} find_snapshot_by_id_isra_8_acode {{?Q;?M}}\<close>
  apply (vcg acode: find_snapshot_by_id_isra_8_acode_def assms: assms)
      apply (vcg_while \<open>P_0x12d5c_3 || P_0x12d80_10 || P_0x12d6c_11\<close> assms: assms)
  done

end

locale "find_snapshot_by_id_or_name_isra_9" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x12da0_0 :: state_pred where
  \<open>P_0x12da0_0 \<sigma> \<equiv> RIP \<sigma> = 0x12da0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x12da0_0_def[Ps]

definition P_0x12da0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12da0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12da0_0_regions :: state_pred where
  \<open>P_0x12da0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x12da0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12db0_0 :: state_pred where
  \<open>Q_0x12db0_0 \<sigma> \<equiv> RIP \<sigma> = 0x12db0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12db0_0_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_7_0x12da0_0x12dac_0[blocks]:
  assumes \<open>(P_0x12da0_0 && P_0x12da0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x12dac 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12db0_0 ?\<sigma> \<and> block_usage P_0x12da0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12da0_0_def P_0x12da0_0_regions_def post: Q_0x12db0_0_def regionset: P_0x12da0_0_regions_set_def)

definition P_0x12db0_1 :: state_pred where
  \<open>P_0x12db0_1 \<sigma> \<equiv> RIP \<sigma> = 0x12db0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12db0_1_def[Ps]

definition P_0x12db0_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12db0_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12db0_1_regions :: state_pred where
  \<open>P_0x12db0_1_regions \<sigma> \<equiv> \<exists>regions. P_0x12db0_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12d20_0x12db0_1 :: state_pred where
  \<open>Q_0x12d20_0x12db0_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = 0x12d20 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12db5\<close>
declare Q_0x12d20_0x12db0_1_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_1_0x12db0_0x12db0_1[blocks]:
  assumes \<open>(P_0x12db0_1 && P_0x12db0_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12db0 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12d20_0x12db0_1 ?\<sigma> \<and> block_usage P_0x12db0_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12db0_1_def P_0x12db0_1_regions_def post: Q_0x12d20_0x12db0_1_def regionset: P_0x12db0_1_regions_set_def)

definition P_0x12db5_2 :: state_pred where
  \<open>P_0x12db5_2 \<sigma> \<equiv> RIP \<sigma> = 0x12db5 \<and> RAX \<sigma> = find_snapshot_by_id_isra_8_0x12db0_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12db5\<close>
declare P_0x12db5_2_def[Ps]

definition P_0x12db5_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12db5_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12db5_2_regions :: state_pred where
  \<open>P_0x12db5_2_regions \<sigma> \<equiv> \<exists>regions. P_0x12db5_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12db9_2 :: state_pred where
  \<open>Q_0x12db9_2 \<sigma> \<equiv> RIP \<sigma> = 0x12db9 \<and> RAX \<sigma> = find_snapshot_by_id_isra_8_0x12db0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>find_snapshot_by_id_isra_8_0x12db0_retval::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12db5\<close>
declare Q_0x12db9_2_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_2_0x12db5_0x12db7_2[blocks]:
  assumes \<open>(P_0x12db5_2 && P_0x12db5_2_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x12db7 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12db9_2 ?\<sigma> \<and> block_usage P_0x12db5_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12db5_2_def P_0x12db5_2_regions_def post: Q_0x12db9_2_def regionset: P_0x12db5_2_regions_set_def)

definition P_0x12db9_true_3 :: state_pred where
  \<open>P_0x12db9_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x12db9 \<and> RAX \<sigma> = find_snapshot_by_id_isra_8_0x12db0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>find_snapshot_by_id_isra_8_0x12db0_retval::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12db5\<close>
declare P_0x12db9_true_3_def[Ps]

definition P_0x12db9_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12db9_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12db9_true_3_regions :: state_pred where
  \<open>P_0x12db9_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x12db9_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_3 :: state_pred where
  \<open>Q_ret_address_3 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_3_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_8_0x12db9_0x12e08_3[blocks]:
  assumes \<open>(P_0x12db9_true_3 && P_0x12db9_true_3_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 8 0x12e08 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_3 ?\<sigma> \<and> block_usage P_0x12db9_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12db9_true_3_def P_0x12db9_true_3_regions_def post: Q_ret_address_3_def regionset: P_0x12db9_true_3_regions_set_def)

definition P_0x12db9_false_4 :: state_pred where
  \<open>P_0x12db9_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x12db9 \<and> RAX \<sigma> = find_snapshot_by_id_isra_8_0x12db0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>find_snapshot_by_id_isra_8_0x12db0_retval::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12db5\<close>
declare P_0x12db9_false_4_def[Ps]

definition P_0x12db9_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12db9_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12db9_false_4_regions :: state_pred where
  \<open>P_0x12db9_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x12db9_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12dca_4 :: state_pred where
  \<open>Q_0x12dca_4 \<sigma> \<equiv> RIP \<sigma> = 0x12dca \<and> RAX \<sigma> = find_snapshot_by_id_isra_8_0x12db0_retval \<and> RBX \<sigma> = 0xffffffff \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12db5\<close>
declare Q_0x12dca_4_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_4_0x12db9_0x12dc7_4[blocks]:
  assumes \<open>(P_0x12db9_false_4 && P_0x12db9_false_4_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x12dc7 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12dca_4 ?\<sigma> \<and> block_usage P_0x12db9_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12db9_false_4_def P_0x12db9_false_4_regions_def post: Q_0x12dca_4_def regionset: P_0x12db9_false_4_regions_set_def)

definition P_0x12dca_true_5 :: state_pred where
  \<open>P_0x12dca_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x12dca \<and> RAX \<sigma> = find_snapshot_by_id_isra_8_0x12db0_retval \<and> RBX \<sigma> = 0xffffffff \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12db5\<close>
declare P_0x12dca_true_5_def[Ps]

definition P_0x12dca_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12dca_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12dca_true_5_regions :: state_pred where
  \<open>P_0x12dca_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x12dca_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_5 :: state_pred where
  \<open>Q_ret_address_5 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_5_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_8_0x12dca_0x12e08_5[blocks]:
  assumes \<open>(P_0x12dca_true_5 && P_0x12dca_true_5_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 8 0x12e08 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_5 ?\<sigma> \<and> block_usage P_0x12dca_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12dca_true_5_def P_0x12dca_true_5_regions_def post: Q_ret_address_5_def regionset: P_0x12dca_true_5_regions_set_def)

definition P_0x12dca_false_6 :: state_pred where
  \<open>P_0x12dca_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x12dca \<and> RAX \<sigma> = find_snapshot_by_id_isra_8_0x12db0_retval \<and> RBX \<sigma> = 0xffffffff \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12db5\<close>
declare P_0x12dca_false_6_def[Ps]

definition P_0x12dca_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12dca_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12dca_false_6_regions :: state_pred where
  \<open>P_0x12dca_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x12dca_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12dec_6 :: state_pred where
  \<open>Q_0x12dec_6 \<sigma> \<equiv> RIP \<sigma> = 0x12dec \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12dec_6_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_5_0x12dca_0x12dd9_6[blocks]:
  assumes \<open>(P_0x12dca_false_6 && P_0x12dca_false_6_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 5 0x12dd9 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12dec_6 ?\<sigma> \<and> block_usage P_0x12dca_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12dca_false_6_def P_0x12dca_false_6_regions_def post: Q_0x12dec_6_def regionset: P_0x12dca_false_6_regions_set_def)

definition P_0x12dec_7 :: state_pred where
  \<open>P_0x12dec_7 \<sigma> \<equiv> RIP \<sigma> = 0x12dec \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12dec_7_def[Ps]

definition P_0x12dec_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12dec_7_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12dec_7_regions :: state_pred where
  \<open>P_0x12dec_7_regions \<sigma> \<equiv> \<exists>regions. P_0x12dec_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12df3_7 :: state_pred where
  \<open>Q_0x12df3_7 \<sigma> \<equiv> RIP \<sigma> = 0x12df3 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12df3_7_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_2_0x12dec_0x12df0_7[blocks]:
  assumes \<open>(P_0x12dec_7 && P_0x12dec_7_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x12df0 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12df3_7 ?\<sigma> \<and> block_usage P_0x12dec_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12dec_7_def P_0x12dec_7_regions_def post: Q_0x12df3_7_def regionset: P_0x12dec_7_regions_set_def)

definition P_0x12df3_8 :: state_pred where
  \<open>P_0x12df3_8 \<sigma> \<equiv> RIP \<sigma> = 0x12df3 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12df3_8_def[Ps]

definition P_0x12df3_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12df3_8_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12df3_8_regions :: state_pred where
  \<open>P_0x12df3_8_regions \<sigma> \<equiv> \<exists>regions. P_0x12df3_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strcmp_addr_0x12df3_8 :: state_pred where
  \<open>Q_strcmp_addr_0x12df3_8 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = strcmp_addr \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12df8\<close>
declare Q_strcmp_addr_0x12df3_8_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_1_0x12df3_0x12df3_8[blocks]:
  assumes \<open>(P_0x12df3_8 && P_0x12df3_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12df3 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strcmp_addr_0x12df3_8 ?\<sigma> \<and> block_usage P_0x12df3_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12df3_8_def P_0x12df3_8_regions_def post: Q_strcmp_addr_0x12df3_8_def regionset: P_0x12df3_8_regions_set_def)

definition P_0x12df8_9 :: state_pred where
  \<open>P_0x12df8_9 \<sigma> \<equiv> RIP \<sigma> = 0x12df8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12df8\<close>
declare P_0x12df8_9_def[Ps]

definition P_0x12df8_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12df8_9_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12df8_9_regions :: state_pred where
  \<open>P_0x12df8_9_regions \<sigma> \<equiv> \<exists>regions. P_0x12df8_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12dfa_9 :: state_pred where
  \<open>Q_0x12dfa_9 \<sigma> \<equiv> RIP \<sigma> = 0x12dfa \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12df8\<close>
declare Q_0x12dfa_9_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_1_0x12df8_0x12df8_9[blocks]:
  assumes \<open>(P_0x12df8_9 && P_0x12df8_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12df8 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12dfa_9 ?\<sigma> \<and> block_usage P_0x12df8_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12df8_9_def P_0x12df8_9_regions_def post: Q_0x12dfa_9_def regionset: P_0x12df8_9_regions_set_def)

definition P_0x12dfa_true_10 :: state_pred where
  \<open>P_0x12dfa_true_10 \<sigma> \<equiv> RIP \<sigma> = 0x12dfa \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12df8\<close>
declare P_0x12dfa_true_10_def[Ps]

definition P_0x12dfa_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12dfa_true_10_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12dfa_true_10_regions :: state_pred where
  \<open>P_0x12dfa_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0x12dfa_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12dea_10 :: state_pred where
  \<open>Q_0x12dea_10 \<sigma> \<equiv> RIP \<sigma> = 0x12dea \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12dea_10_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_4_0x12dfa_0x12de7_10[blocks]:
  assumes \<open>(P_0x12dfa_true_10 && P_0x12dfa_true_10_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x12de7 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12dea_10 ?\<sigma> \<and> block_usage P_0x12dfa_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12dfa_true_10_def P_0x12dfa_true_10_regions_def post: Q_0x12dea_10_def regionset: P_0x12dfa_true_10_regions_set_def)

definition P_0x12dea_true_11 :: state_pred where
  \<open>P_0x12dea_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x12dea \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12dea_true_11_def[Ps]

definition P_0x12dea_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12dea_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12dea_true_11_regions :: state_pred where
  \<open>P_0x12dea_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x12dea_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12e10_11 :: state_pred where
  \<open>Q_0x12e10_11 \<sigma> \<equiv> RIP \<sigma> = 0x12e10 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12e10_11_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_1_0x12dea_0x12dea_11[blocks]:
  assumes \<open>(P_0x12dea_true_11 && P_0x12dea_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12dea 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12e10_11 ?\<sigma> \<and> block_usage P_0x12dea_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12dea_true_11_def P_0x12dea_true_11_regions_def post: Q_0x12e10_11_def regionset: P_0x12dea_true_11_regions_set_def)

definition P_0x12dea_false_12 :: state_pred where
  \<open>P_0x12dea_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x12dea \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12dea_false_12_def[Ps]

definition P_0x12dea_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12dea_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12dea_false_12_regions :: state_pred where
  \<open>P_0x12dea_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x12dea_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12dec_12 :: state_pred where
  \<open>Q_0x12dec_12 \<sigma> \<equiv> RIP \<sigma> = 0x12dec \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12dec_12_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_1_0x12dea_0x12dea_12[blocks]:
  assumes \<open>(P_0x12dea_false_12 && P_0x12dea_false_12_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12dea 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12dec_12 ?\<sigma> \<and> block_usage P_0x12dea_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12dea_false_12_def P_0x12dea_false_12_regions_def post: Q_0x12dec_12_def regionset: P_0x12dea_false_12_regions_set_def)

definition P_0x12dfa_false_13 :: state_pred where
  \<open>P_0x12dfa_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x12dfa \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12df8\<close>
declare P_0x12dfa_false_13_def[Ps]

definition P_0x12dfa_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12dfa_false_13_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x12dfa_false_13_regions :: state_pred where
  \<open>P_0x12dfa_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x12dfa_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12dfc_13 :: state_pred where
  \<open>Q_0x12dfc_13 \<sigma> \<equiv> RIP \<sigma> = 0x12dfc \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12dfc_13_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_1_0x12dfa_0x12dfa_13[blocks]:
  assumes \<open>(P_0x12dfa_false_13 && P_0x12dfa_false_13_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12dfa 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12dfc_13 ?\<sigma> \<and> block_usage P_0x12dfa_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12dfa_false_13_def P_0x12dfa_false_13_regions_def post: Q_0x12dfc_13_def regionset: P_0x12dfa_false_13_regions_set_def)

definition P_0x12e10_14 :: state_pred where
  \<open>P_0x12e10_14 \<sigma> \<equiv> RIP \<sigma> = 0x12e10 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12e10_14_def[Ps]

definition P_0x12e10_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12e10_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12e10_14_regions :: state_pred where
  \<open>P_0x12e10_14_regions \<sigma> \<equiv> \<exists>regions. P_0x12e10_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_14 :: state_pred where
  \<open>Q_ret_address_14 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_14_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_8_0x12e10_0x12e21_14[blocks]:
  assumes \<open>(P_0x12e10_14 && P_0x12e10_14_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x12e21 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_14 ?\<sigma> \<and> block_usage P_0x12e10_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12e10_14_def P_0x12e10_14_regions_def post: Q_ret_address_14_def regionset: P_0x12e10_14_regions_set_def)

definition P_0x12dfc_15 :: state_pred where
  \<open>P_0x12dfc_15 \<sigma> \<equiv> RIP \<sigma> = 0x12dfc \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12dfc_15_def[Ps]

definition P_0x12dfc_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12dfc_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12dfc_15_regions :: state_pred where
  \<open>P_0x12dfc_15_regions \<sigma> \<equiv> \<exists>regions. P_0x12dfc_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_15 :: state_pred where
  \<open>Q_ret_address_15 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_15_def[Qs]

schematic_goal find_snapshot_by_id_or_name_isra_9_0_7_0x12dfc_0x12e08_15[blocks]:
  assumes \<open>(P_0x12dfc_15 && P_0x12dfc_15_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x12e08 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_15 ?\<sigma> \<and> block_usage P_0x12dfc_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12dfc_15_def P_0x12dfc_15_regions_def post: Q_ret_address_15_def regionset: P_0x12dfc_15_regions_set_def)

interpretation find_snapshot_by_id_isra_8_0x12db0_1: find_snapshot_by_id_isra_8 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ \<open>RAX\<^sub>0\<close> \<open>RBX\<^sub>0\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>((RSP\<^sub>0::64 word) - 0x28)\<close> \<open>RDI\<^sub>0\<close> \<open>R13\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>0x12db0\<close>
  by unfold_locales

definition find_snapshot_by_id_or_name_isra_9_acode :: ACode where
  \<open>find_snapshot_by_id_or_name_isra_9_acode =
    Block 7 0x12dac 0;
    Block (Suc 0) 0x12db0 (Suc 0);
    CALL find_snapshot_by_id_isra_8_0x12db0_1.find_snapshot_by_id_isra_8_acode;
    Block 2 0x12db7 2;
    IF !SF THEN
      Block 8 0x12e08 3
    ELSE
      Block 4 0x12dc7 4;
      IF jle THEN
        Block 8 0x12e08 5
      ELSE
        Block 5 0x12dd9 6;
        WHILE P_0x12dec_7 DO
          Block 2 0x12df0 7;
          Block (Suc 0) 0x12df3 8;
          CALL strcmp_acode;
          Block (Suc 0) 0x12df8 9;
          IF !ZF THEN
            Block 4 0x12de7 10;
            IF ZF THEN
              Block (Suc 0) 0x12dea 11
            ELSE
              Block (Suc 0) 0x12dea 12
            FI
          ELSE
            Block (Suc 0) 0x12dfa 13
          FI
        OD;
        CASES [
          (P_0x12e10_14,
            Block 8 0x12e21 14
          ),
          (P_0x12dfc_15,
            Block 7 0x12e08 15
          )
        ]
      FI
    FI
  \<close>

schematic_goal "find_snapshot_by_id_or_name_isra_9":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12db0 \<longrightarrow> P_0x12db0_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12db5 \<longrightarrow> P_0x12db5_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12db9 \<longrightarrow> P_0x12db9_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12db9 \<longrightarrow> P_0x12db9_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12dca \<longrightarrow> P_0x12dca_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12dca \<longrightarrow> P_0x12dca_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12dec \<longrightarrow> P_0x12dec_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12df3 \<longrightarrow> P_0x12df3_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12df8 \<longrightarrow> P_0x12df8_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12dfa \<longrightarrow> P_0x12dfa_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12dea \<longrightarrow> P_0x12dea_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12dea \<longrightarrow> P_0x12dea_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12dfa \<longrightarrow> P_0x12dfa_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12e10 \<longrightarrow> P_0x12e10_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12dfc \<longrightarrow> P_0x12dfc_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12d20 \<longrightarrow> find_snapshot_by_id_isra_8_0x12db0_1.P_0x12d20_0_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_0x12d20_0x12db0_1}} \<box>find_snapshot_by_id_isra_8_0x12db0_1.find_snapshot_by_id_isra_8_acode {{P_0x12db5_2;M_0x12db0}}\<close>
    and [blocks]: \<open>{{Q_strcmp_addr_0x12df3_8}} \<box>strcmp_acode {{P_0x12df8_9;M_0x12df3}}\<close>
  shows \<open>{{?P}} find_snapshot_by_id_or_name_isra_9_acode {{?Q;?M}}\<close>
  apply (vcg acode: find_snapshot_by_id_or_name_isra_9_acode_def assms: assms)
            apply (vcg_while \<open>P_0x12dec_7 || P_0x12e10_14 || P_0x12dfc_15\<close> assms: assms)
  done

end

end
