theory qemu_read 
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes read_0x5233_retval\<^sub>v errno_location_0x5260_retval\<^sub>v errno_location_0x5290_retval\<^sub>v assert_fail_0x52b7_retval\<^sub>v assert_fail_addr errno_location_addr read_addr :: \<open>64 word\<close>
    and assert_fail_acode errno_location_acode read_acode :: ACode
  assumes fetch:
    "fetch 0x5210 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5212 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x5215 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5217 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x521a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x521b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x521d \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x521e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x5221 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x5225 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x5228 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 21071)), 2)"
    "fetch 0x522a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x522d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x5230 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x5233 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''read'')), 5)"
    "fetch 0x5238 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x523b \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 21136)), 2)"
    "fetch 0x523d \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 21088)), 2)"
    "fetch 0x523f \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x5242 \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 21149)), 2)"
    "fetch 0x5244 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5247 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x524a \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x524d \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 21034)), 2)"
    "fetch 0x524f \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x5253 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x5256 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5257 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5258 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x525a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x525c \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x525d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x5260 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x5265 \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 4)), 3)"
    "fetch 0x5268 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 21034)), 2)"
    "fetch 0x526a \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x526d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 18446744073709551615)), 7)"
    "fetch 0x5274 \<equiv> (Binary (IS_PentiumPro Cmove) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x5278 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x527c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x527d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x5280 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5281 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5283 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5285 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5286 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x5290 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x5295 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 0)), 6)"
    "fetch 0x529b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 21071)), 2)"
    "fetch 0x529d \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 101388)))), 7)"
    "fetch 0x52a4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 75)), 5)"
    "fetch 0x52a9 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 101332)))), 7)"
    "fetch 0x52b0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 101333)))), 7)"
    "fetch 0x52b7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and assert_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__assert_fail'') = assert_fail_addr\<close>
    and errno_location\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__errno_location'') = errno_location_addr\<close>
    and read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''read'') = read_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>read_0x5233_retval \<equiv> read_0x5233_retval\<^sub>v\<close>
definition \<open>errno_location_0x5260_retval \<equiv> errno_location_0x5260_retval\<^sub>v\<close>
definition \<open>errno_location_0x5290_retval \<equiv> errno_location_0x5290_retval\<^sub>v\<close>
definition \<open>assert_fail_0x52b7_retval \<equiv> assert_fail_0x52b7_retval\<^sub>v\<close>

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
  auto simp: block_usage_def eq_def setcc_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

method vcg_step uses assms =
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?

method vcg_while for P :: state_pred uses assms =
  (rule htriples)+,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "qemu_read" = "qemu_img_xen" +
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

definition P_0x5210_0 :: state_pred where
  \<open>P_0x5210_0 \<sigma> \<equiv> RIP \<sigma> = 0x5210 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5210_0_def[Ps]

definition P_0x5210_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5210_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5210_0_regions :: state_pred where
  \<open>P_0x5210_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5210_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5228_0 :: state_pred where
  \<open>Q_0x5228_0 \<sigma> \<equiv> RIP \<sigma> = 0x5228 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5228_0_def[Qs]

schematic_goal qemu_read_0_10_0x5210_0x5225_0[blocks]:
  assumes \<open>(P_0x5210_0 && P_0x5210_0_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x5225 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5228_0 ?\<sigma> \<and> block_usage P_0x5210_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5210_0_def P_0x5210_0_regions_def post: Q_0x5228_0_def regionset: P_0x5210_0_regions_set_def)

definition P_0x5228_true_1 :: state_pred where
  \<open>P_0x5228_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x5228 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5228_true_1_def[Ps]

definition P_0x5228_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5228_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5228_true_1_regions :: state_pred where
  \<open>P_0x5228_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5228_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal qemu_read_0_8_0x5228_0x525c_1[blocks]:
  assumes \<open>(P_0x5228_true_1 && P_0x5228_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x525c (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x5228_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5228_true_1_def P_0x5228_true_1_regions_def post: Q_ret_address_1_def regionset: P_0x5228_true_1_regions_set_def)

definition P_0x5228_false_2 :: state_pred where
  \<open>P_0x5228_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x5228 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R12 \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5228_false_2_def[Ps]

definition P_0x5228_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5228_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5228_false_2_regions :: state_pred where
  \<open>P_0x5228_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5228_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x522a_2 :: state_pred where
  \<open>Q_0x522a_2 \<sigma> \<equiv> RIP \<sigma> = 0x522a \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x522a_2_def[Qs]

schematic_goal qemu_read_0_1_0x5228_0x5228_2[blocks]:
  assumes \<open>(P_0x5228_false_2 && P_0x5228_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5228 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x522a_2 ?\<sigma> \<and> block_usage P_0x5228_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5228_false_2_def P_0x5228_false_2_regions_def post: Q_0x522a_2_def regionset: P_0x5228_false_2_regions_set_def)

definition P_0x522a_3 :: state_pred where
  \<open>P_0x522a_3 \<sigma> \<equiv> RIP \<sigma> = 0x522a \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x522a_3_def[Ps]

definition P_0x522a_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x522a_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x522a_3_regions :: state_pred where
  \<open>P_0x522a_3_regions \<sigma> \<equiv> \<exists>regions. P_0x522a_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5233_3 :: state_pred where
  \<open>Q_0x5233_3 \<sigma> \<equiv> RIP \<sigma> = 0x5233 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5233_3_def[Qs]

schematic_goal qemu_read_0_3_0x522a_0x5230_3[blocks]:
  assumes \<open>(P_0x522a_3 && P_0x522a_3_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x5230 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5233_3 ?\<sigma> \<and> block_usage P_0x522a_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x522a_3_def P_0x522a_3_regions_def post: Q_0x5233_3_def regionset: P_0x522a_3_regions_set_def)

definition P_0x5233_4 :: state_pred where
  \<open>P_0x5233_4 \<sigma> \<equiv> RIP \<sigma> = 0x5233 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5233_4_def[Ps]

definition P_0x5233_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5233_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5233_4_regions :: state_pred where
  \<open>P_0x5233_4_regions \<sigma> \<equiv> \<exists>regions. P_0x5233_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_read_addr_0x5233_4 :: state_pred where
  \<open>Q_read_addr_0x5233_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = read_addr \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare Q_read_addr_0x5233_4_def[Qs]

schematic_goal qemu_read_0_1_0x5233_0x5233_4[blocks]:
  assumes \<open>(P_0x5233_4 && P_0x5233_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5233 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_read_addr_0x5233_4 ?\<sigma> \<and> block_usage P_0x5233_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5233_4_def P_0x5233_4_regions_def post: Q_read_addr_0x5233_4_def regionset: P_0x5233_4_regions_set_def)

definition P_0x5238_5 :: state_pred where
  \<open>P_0x5238_5 \<sigma> \<equiv> RIP \<sigma> = 0x5238 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare P_0x5238_5_def[Ps]

definition P_0x5238_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5238_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5238_5_regions :: state_pred where
  \<open>P_0x5238_5_regions \<sigma> \<equiv> \<exists>regions. P_0x5238_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x523b_5 :: state_pred where
  \<open>Q_0x523b_5 \<sigma> \<equiv> RIP \<sigma> = 0x523b \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare Q_0x523b_5_def[Qs]

schematic_goal qemu_read_0_1_0x5238_0x5238_5[blocks]:
  assumes \<open>(P_0x5238_5 && P_0x5238_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5238 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x523b_5 ?\<sigma> \<and> block_usage P_0x5238_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5238_5_def P_0x5238_5_regions_def post: Q_0x523b_5_def regionset: P_0x5238_5_regions_set_def)

definition P_0x523b_true_6 :: state_pred where
  \<open>P_0x523b_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x523b \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare P_0x523b_true_6_def[Ps]

definition P_0x523b_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x523b_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x523b_true_6_regions :: state_pred where
  \<open>P_0x523b_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x523b_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5290_6 :: state_pred where
  \<open>Q_0x5290_6 \<sigma> \<equiv> RIP \<sigma> = 0x5290 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5290_6_def[Qs]

schematic_goal qemu_read_0_1_0x523b_0x523b_6[blocks]:
  assumes \<open>(P_0x523b_true_6 && P_0x523b_true_6_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x523b 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5290_6 ?\<sigma> \<and> block_usage P_0x523b_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x523b_true_6_def P_0x523b_true_6_regions_def post: Q_0x5290_6_def regionset: P_0x523b_true_6_regions_set_def)

definition P_0x523b_false_7 :: state_pred where
  \<open>P_0x523b_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x523b \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare P_0x523b_false_7_def[Ps]

definition P_0x523b_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x523b_false_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x523b_false_7_regions :: state_pred where
  \<open>P_0x523b_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x523b_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x523d_7 :: state_pred where
  \<open>Q_0x523d_7 \<sigma> \<equiv> RIP \<sigma> = 0x523d \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare Q_0x523d_7_def[Qs]

schematic_goal qemu_read_0_1_0x523b_0x523b_7[blocks]:
  assumes \<open>(P_0x523b_false_7 && P_0x523b_false_7_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x523b 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x523d_7 ?\<sigma> \<and> block_usage P_0x523b_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x523b_false_7_def P_0x523b_false_7_regions_def post: Q_0x523d_7_def regionset: P_0x523b_false_7_regions_set_def)

definition P_0x523d_true_8 :: state_pred where
  \<open>P_0x523d_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x523d \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare P_0x523d_true_8_def[Ps]

definition P_0x523d_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x523d_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x523d_true_8_regions :: state_pred where
  \<open>P_0x523d_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x523d_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5260_8 :: state_pred where
  \<open>Q_0x5260_8 \<sigma> \<equiv> RIP \<sigma> = 0x5260 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare Q_0x5260_8_def[Qs]

schematic_goal qemu_read_0_1_0x523d_0x523d_8[blocks]:
  assumes \<open>(P_0x523d_true_8 && P_0x523d_true_8_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x523d 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5260_8 ?\<sigma> \<and> block_usage P_0x523d_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x523d_true_8_def P_0x523d_true_8_regions_def post: Q_0x5260_8_def regionset: P_0x523d_true_8_regions_set_def)

definition P_0x5260_9 :: state_pred where
  \<open>P_0x5260_9 \<sigma> \<equiv> RIP \<sigma> = 0x5260 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare P_0x5260_9_def[Ps]

definition P_0x5260_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5260_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5260_9_regions :: state_pred where
  \<open>P_0x5260_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5260_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x5260_9 :: state_pred where
  \<open>Q_errno_location_addr_0x5260_9 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = errno_location_addr \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5265\<close>
declare Q_errno_location_addr_0x5260_9_def[Qs]

schematic_goal qemu_read_0_1_0x5260_0x5260_9[blocks]:
  assumes \<open>(P_0x5260_9 && P_0x5260_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5260 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x5260_9 ?\<sigma> \<and> block_usage P_0x5260_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5260_9_def P_0x5260_9_regions_def post: Q_errno_location_addr_0x5260_9_def regionset: P_0x5260_9_regions_set_def)

definition P_0x5265_10 :: state_pred where
  \<open>P_0x5265_10 \<sigma> \<equiv> RIP \<sigma> = 0x5265 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5265\<close>
declare P_0x5265_10_def[Ps]

definition P_0x5265_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5265_10_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5265_10_regions :: state_pred where
  \<open>P_0x5265_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5265_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5268_10 :: state_pred where
  \<open>Q_0x5268_10 \<sigma> \<equiv> RIP \<sigma> = 0x5268 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5268_10_def[Qs]

schematic_goal qemu_read_0_1_0x5265_0x5265_10[blocks]:
  assumes \<open>(P_0x5265_10 && P_0x5265_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5265 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5268_10 ?\<sigma> \<and> block_usage P_0x5265_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5265_10_def P_0x5265_10_regions_def post: Q_0x5268_10_def regionset: P_0x5265_10_regions_set_def)

definition P_0x5268_true_11 :: state_pred where
  \<open>P_0x5268_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x5268 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5268_true_11_def[Ps]

definition P_0x5268_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5268_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5268_true_11_regions :: state_pred where
  \<open>P_0x5268_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x5268_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x522a_11 :: state_pred where
  \<open>Q_0x522a_11 \<sigma> \<equiv> RIP \<sigma> = 0x522a \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x522a_11_def[Qs]

schematic_goal qemu_read_0_1_0x5268_0x5268_11[blocks]:
  assumes \<open>(P_0x5268_true_11 && P_0x5268_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5268 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x522a_11 ?\<sigma> \<and> block_usage P_0x5268_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5268_true_11_def P_0x5268_true_11_regions_def post: Q_0x522a_11_def regionset: P_0x5268_true_11_regions_set_def)

definition P_0x5268_false_12 :: state_pred where
  \<open>P_0x5268_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x5268 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5268_false_12_def[Ps]

definition P_0x5268_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5268_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5268_false_12_regions :: state_pred where
  \<open>P_0x5268_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x5268_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x526a_12 :: state_pred where
  \<open>Q_0x526a_12 \<sigma> \<equiv> RIP \<sigma> = 0x526a \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x526a_12_def[Qs]

schematic_goal qemu_read_0_1_0x5268_0x5268_12[blocks]:
  assumes \<open>(P_0x5268_false_12 && P_0x5268_false_12_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5268 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x526a_12 ?\<sigma> \<and> block_usage P_0x5268_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5268_false_12_def P_0x5268_false_12_regions_def post: Q_0x526a_12_def regionset: P_0x5268_false_12_regions_set_def)

definition P_0x523d_false_13 :: state_pred where
  \<open>P_0x523d_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x523d \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare P_0x523d_false_13_def[Ps]

definition P_0x523d_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x523d_false_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x523d_false_13_regions :: state_pred where
  \<open>P_0x523d_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x523d_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5242_13 :: state_pred where
  \<open>Q_0x5242_13 \<sigma> \<equiv> RIP \<sigma> = 0x5242 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare Q_0x5242_13_def[Qs]

schematic_goal qemu_read_0_2_0x523d_0x523f_13[blocks]:
  assumes \<open>(P_0x523d_false_13 && P_0x523d_false_13_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x523f 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5242_13 ?\<sigma> \<and> block_usage P_0x523d_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x523d_false_13_def P_0x523d_false_13_regions_def post: Q_0x5242_13_def regionset: P_0x523d_false_13_regions_set_def)

definition P_0x5242_true_14 :: state_pred where
  \<open>P_0x5242_true_14 \<sigma> \<equiv> RIP \<sigma> = 0x5242 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare P_0x5242_true_14_def[Ps]

definition P_0x5242_true_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5242_true_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5242_true_14_regions :: state_pred where
  \<open>P_0x5242_true_14_regions \<sigma> \<equiv> \<exists>regions. P_0x5242_true_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x529d_14 :: state_pred where
  \<open>Q_0x529d_14 \<sigma> \<equiv> RIP \<sigma> = 0x529d \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x529d_14_def[Qs]

schematic_goal qemu_read_0_1_0x5242_0x5242_14[blocks]:
  assumes \<open>(P_0x5242_true_14 && P_0x5242_true_14_regions && ja) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5242 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x529d_14 ?\<sigma> \<and> block_usage P_0x5242_true_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5242_true_14_def P_0x5242_true_14_regions_def post: Q_0x529d_14_def regionset: P_0x5242_true_14_regions_set_def)

definition P_0x5242_false_15 :: state_pred where
  \<open>P_0x5242_false_15 \<sigma> \<equiv> RIP \<sigma> = 0x5242 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RBX \<sigma> \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = R12 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5238\<close>
declare P_0x5242_false_15_def[Ps]

definition P_0x5242_false_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5242_false_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5242_false_15_regions :: state_pred where
  \<open>P_0x5242_false_15_regions \<sigma> \<equiv> \<exists>regions. P_0x5242_false_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x524d_15 :: state_pred where
  \<open>Q_0x524d_15 \<sigma> \<equiv> RIP \<sigma> = 0x524d \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x524d_15_def[Qs]

schematic_goal qemu_read_0_4_0x5242_0x524a_15[blocks]:
  assumes \<open>(P_0x5242_false_15 && P_0x5242_false_15_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block 4 0x524a 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x524d_15 ?\<sigma> \<and> block_usage P_0x5242_false_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5242_false_15_def P_0x5242_false_15_regions_def post: Q_0x524d_15_def regionset: P_0x5242_false_15_regions_set_def)

definition P_0x524d_true_16 :: state_pred where
  \<open>P_0x524d_true_16 \<sigma> \<equiv> RIP \<sigma> = 0x524d \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x524d_true_16_def[Ps]

definition P_0x524d_true_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x524d_true_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x524d_true_16_regions :: state_pred where
  \<open>P_0x524d_true_16_regions \<sigma> \<equiv> \<exists>regions. P_0x524d_true_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x522a_16 :: state_pred where
  \<open>Q_0x522a_16 \<sigma> \<equiv> RIP \<sigma> = 0x522a \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x522a_16_def[Qs]

schematic_goal qemu_read_0_1_0x524d_0x524d_16[blocks]:
  assumes \<open>(P_0x524d_true_16 && P_0x524d_true_16_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x524d 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x522a_16 ?\<sigma> \<and> block_usage P_0x524d_true_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x524d_true_16_def P_0x524d_true_16_regions_def post: Q_0x522a_16_def regionset: P_0x524d_true_16_regions_set_def)

definition P_0x524d_false_17 :: state_pred where
  \<open>P_0x524d_false_17 \<sigma> \<equiv> RIP \<sigma> = 0x524d \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x524d_false_17_def[Ps]

definition P_0x524d_false_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x524d_false_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x524d_false_17_regions :: state_pred where
  \<open>P_0x524d_false_17_regions \<sigma> \<equiv> \<exists>regions. P_0x524d_false_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x524f_17 :: state_pred where
  \<open>Q_0x524f_17 \<sigma> \<equiv> RIP \<sigma> = 0x524f \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x524f_17_def[Qs]

schematic_goal qemu_read_0_1_0x524d_0x524d_17[blocks]:
  assumes \<open>(P_0x524d_false_17 && P_0x524d_false_17_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x524d 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x524f_17 ?\<sigma> \<and> block_usage P_0x524d_false_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x524d_false_17_def P_0x524d_false_17_regions_def post: Q_0x524f_17_def regionset: P_0x524d_false_17_regions_set_def)

definition P_0x524f_18 :: state_pred where
  \<open>P_0x524f_18 \<sigma> \<equiv> RIP \<sigma> = 0x524f \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x524f_18_def[Ps]

definition P_0x524f_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x524f_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x524f_18_regions :: state_pred where
  \<open>P_0x524f_18_regions \<sigma> \<equiv> \<exists>regions. P_0x524f_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_18 :: state_pred where
  \<open>Q_ret_address_18 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_18_def[Qs]

schematic_goal qemu_read_0_7_0x524f_0x525c_18[blocks]:
  assumes \<open>(P_0x524f_18 && P_0x524f_18_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x525c 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_18 ?\<sigma> \<and> block_usage P_0x524f_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x524f_18_def P_0x524f_18_regions_def post: Q_ret_address_18_def regionset: P_0x524f_18_regions_set_def)

definition P_0x529d_19 :: state_pred where
  \<open>P_0x529d_19 \<sigma> \<equiv> RIP \<sigma> = 0x529d \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x529d_19_def[Ps]

definition P_0x529d_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x529d_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x529d_19_regions :: state_pred where
  \<open>P_0x529d_19_regions \<sigma> \<equiv> \<exists>regions. P_0x529d_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x52b7_19 :: state_pred where
  \<open>Q_0x52b7_19 \<sigma> \<equiv> RIP \<sigma> = 0x52b7 \<and> RCX \<sigma> = 0x1deb0 \<and> RDX \<sigma> = 0x4b \<and> RDI \<sigma> = 0x1de8c \<and> RSI \<sigma> = 0x1de84 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x52b7_19_def[Qs]

schematic_goal qemu_read_0_4_0x529d_0x52b0_19[blocks]:
  assumes \<open>(P_0x529d_19 && P_0x529d_19_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x52b0 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x52b7_19 ?\<sigma> \<and> block_usage P_0x529d_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x529d_19_def P_0x529d_19_regions_def post: Q_0x52b7_19_def regionset: P_0x529d_19_regions_set_def)

definition P_0x52b7_20 :: state_pred where
  \<open>P_0x52b7_20 \<sigma> \<equiv> RIP \<sigma> = 0x52b7 \<and> RCX \<sigma> = 0x1deb0 \<and> RDX \<sigma> = 0x4b \<and> RDI \<sigma> = 0x1de8c \<and> RSI \<sigma> = 0x1de84 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x52b7_20_def[Ps]

definition P_0x52b7_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x52b7_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x52b7_20_regions :: state_pred where
  \<open>P_0x52b7_20_regions \<sigma> \<equiv> \<exists>regions. P_0x52b7_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0x52b7_20 :: state_pred where
  \<open>Q_assert_fail_addr_0x52b7_20 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = assert_fail_addr \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_assert_fail_addr_0x52b7_20_def[Qs]

schematic_goal qemu_read_0_1_0x52b7_0x52b7_20[blocks]:
  assumes \<open>(P_0x52b7_20 && P_0x52b7_20_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x52b7 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0x52b7_20 ?\<sigma> \<and> block_usage P_0x52b7_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x52b7_20_def P_0x52b7_20_regions_def post: Q_assert_fail_addr_0x52b7_20_def regionset: P_0x52b7_20_regions_set_def)

definition P_0x526a_21 :: state_pred where
  \<open>P_0x526a_21 \<sigma> \<equiv> RIP \<sigma> = 0x526a \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x526a_21_def[Ps]

definition P_0x526a_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x526a_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x526a_21_regions :: state_pred where
  \<open>P_0x526a_21_regions \<sigma> \<equiv> \<exists>regions. P_0x526a_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_21 :: state_pred where
  \<open>Q_ret_address_21 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_21_def[Qs]

schematic_goal qemu_read_0_10_0x526a_0x5285_21[blocks]:
  assumes \<open>(P_0x526a_21 && P_0x526a_21_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x5285 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_21 ?\<sigma> \<and> block_usage P_0x526a_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x526a_21_def P_0x526a_21_regions_def post: Q_ret_address_21_def regionset: P_0x526a_21_regions_set_def)

definition P_0x5290_22 :: state_pred where
  \<open>P_0x5290_22 \<sigma> \<equiv> RIP \<sigma> = 0x5290 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5290_22_def[Ps]

definition P_0x5290_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5290_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5290_22_regions :: state_pred where
  \<open>P_0x5290_22_regions \<sigma> \<equiv> \<exists>regions. P_0x5290_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x5290_22 :: state_pred where
  \<open>Q_errno_location_addr_0x5290_22 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = errno_location_addr \<and> RCX \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5295\<close>
declare Q_errno_location_addr_0x5290_22_def[Qs]

schematic_goal qemu_read_0_1_0x5290_0x5290_22[blocks]:
  assumes \<open>(P_0x5290_22 && P_0x5290_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5290 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x5290_22 ?\<sigma> \<and> block_usage P_0x5290_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5290_22_def P_0x5290_22_regions_def post: Q_errno_location_addr_0x5290_22_def regionset: P_0x5290_22_regions_set_def)

definition P_0x5295_23 :: state_pred where
  \<open>P_0x5295_23 \<sigma> \<equiv> RIP \<sigma> = 0x5295 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5295\<close>
declare P_0x5295_23_def[Ps]

definition P_0x5295_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5295_23_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5295_23_regions :: state_pred where
  \<open>P_0x5295_23_regions \<sigma> \<equiv> \<exists>regions. P_0x5295_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x524f_23 :: state_pred where
  \<open>Q_0x524f_23 \<sigma> \<equiv> RIP \<sigma> = 0x524f \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RAX \<sigma>,4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5295\<close>
declare Q_0x524f_23_def[Qs]

schematic_goal qemu_read_0_2_0x5295_0x529b_23[blocks]:
  assumes \<open>(P_0x5295_23 && P_0x5295_23_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x529b 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x524f_23 ?\<sigma> \<and> block_usage P_0x5295_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5295_23_def P_0x5295_23_regions_def post: Q_0x524f_23_def regionset: P_0x5295_23_regions_set_def)

definition P_0x524f_24 :: state_pred where
  \<open>P_0x524f_24 \<sigma> \<equiv> RIP \<sigma> = 0x524f \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RAX \<sigma>,4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5295\<close>
declare P_0x524f_24_def[Ps]

definition P_0x524f_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x524f_24_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x524f_24_regions :: state_pred where
  \<open>P_0x524f_24_regions \<sigma> \<equiv> \<exists>regions. P_0x524f_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_24 :: state_pred where
  \<open>Q_ret_address_24 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_24_def[Qs]

schematic_goal qemu_read_0_7_0x524f_0x525c_24[blocks]:
  assumes \<open>(P_0x524f_24 && P_0x524f_24_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x525c 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_24 ?\<sigma> \<and> block_usage P_0x524f_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x524f_24_def P_0x524f_24_regions_def post: Q_ret_address_24_def regionset: P_0x524f_24_regions_set_def)

definition qemu_read_acode :: ACode where
  \<open>qemu_read_acode =
    Block 10 0x5225 0;
    IF ZF THEN
      Block 8 0x525c (Suc 0)
    ELSE
      Block (Suc 0) 0x5228 2;
      WHILE P_0x522a_3 DO
        Block 3 0x5230 3;
        Block (Suc 0) 0x5233 4;
        CALL read_acode;
        Block (Suc 0) 0x5238 5;
        IF ZF THEN
          Block (Suc 0) 0x523b 6
        ELSE
          Block (Suc 0) 0x523b 7;
          IF SF THEN
            Block (Suc 0) 0x523d 8;
            Block (Suc 0) 0x5260 9;
            CALL errno_location_acode;
            Block (Suc 0) 0x5265 10;
            IF ZF THEN
              Block (Suc 0) 0x5268 11
            ELSE
              Block (Suc 0) 0x5268 12
            FI
          ELSE
            Block 2 0x523f 13;
            IF ja THEN
              Block (Suc 0) 0x5242 14
            ELSE
              Block 4 0x524a 15;
              IF !ZF THEN
                Block (Suc 0) 0x524d 16
              ELSE
                Block (Suc 0) 0x524d 17
              FI
            FI
          FI
        FI
      OD;
      CASES [
        (P_0x524f_18,
          Block 7 0x525c 18
        ),
        (P_0x529d_19,
          Block 4 0x52b0 19;
          Block (Suc 0) 0x52b7 20;
          CALL assert_fail_acode
        ),
        (P_0x526a_21,
          Block 10 0x5285 21
        ),
        (P_0x5290_22,
          Block (Suc 0) 0x5290 22;
          CALL errno_location_acode;
          Block 2 0x529b 23;
          Block 7 0x525c 24
        )
      ]
    FI
  \<close>

schematic_goal "qemu_read":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5228 \<longrightarrow> P_0x5228_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5228 \<longrightarrow> P_0x5228_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x522a \<longrightarrow> P_0x522a_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5233 \<longrightarrow> P_0x5233_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5238 \<longrightarrow> P_0x5238_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x523b \<longrightarrow> P_0x523b_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x523b \<longrightarrow> P_0x523b_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x523d \<longrightarrow> P_0x523d_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5260 \<longrightarrow> P_0x5260_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5265 \<longrightarrow> P_0x5265_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5268 \<longrightarrow> P_0x5268_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5268 \<longrightarrow> P_0x5268_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x523d \<longrightarrow> P_0x523d_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5242 \<longrightarrow> P_0x5242_true_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5242 \<longrightarrow> P_0x5242_false_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x524d \<longrightarrow> P_0x524d_true_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x524d \<longrightarrow> P_0x524d_false_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x524f \<longrightarrow> P_0x524f_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x529d \<longrightarrow> P_0x529d_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x52b7 \<longrightarrow> P_0x52b7_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x526a \<longrightarrow> P_0x526a_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5290 \<longrightarrow> P_0x5290_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5295 \<longrightarrow> P_0x5295_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x524f \<longrightarrow> P_0x524f_24_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_read_addr_0x5233_4}} \<box>read_acode {{P_0x5238_5;M_0x5233}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x5260_9}} \<box>errno_location_acode {{P_0x5265_10;M_0x5260}}\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0x52b7_20}} \<box>assert_fail_acode {{Q_fail;M_0x52b7}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x5290_22}} \<box>errno_location_acode {{P_0x5295_23;M_0x5290}}\<close>
  shows \<open>{{?P}} qemu_read_acode {{?Q;?M}}\<close>
  apply (vcg acode: qemu_read_acode_def assms: assms)
      apply (vcg_while \<open>P_0x522a_3 || P_0x524f_18 || P_0x529d_19 || P_0x526a_21 || P_0x5290_22\<close> assms: assms)
         apply (vcg_step assms: assms)+
        apply (auto simp add: pred_logic Ps Qs assms)[1]
       apply (rule htriples)+
            apply (simp only: snd_conv fst_conv)
            apply (vcg_step assms: assms)+
  done

end
