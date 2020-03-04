theory qemu_paio_cancel
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes mutex_lock_constprop_5_0x1b314_retval\<^sub>v mutex_unlock_constprop_4_0x1b349_retval\<^sub>v mutex_unlock_constprop_4_0x1b360_retval\<^sub>v mutex_lock_constprop_5_addr mutex_unlock_constprop_4_addr :: \<open>64 word\<close>
    and mutex_lock_constprop_5_acode mutex_unlock_constprop_4_acode :: ACode
  assumes fetch:
    "fetch 0x1b310 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b311 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1b314 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''mutex_lock.constprop.5'')), 5)"
    "fetch 0x1b319 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 72))))), 3)"
    "fetch 0x1b31c \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1b31e \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 111448)), 2)"
    "fetch 0x1b320 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40))))), 4)"
    "fetch 0x1b324 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 48))))), 4)"
    "fetch 0x1b328 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1b32b \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 111472)), 2)"
    "fetch 0x1b32d \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 48)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x1b331 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 48))))), 4)"
    "fetch 0x1b335 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40))))), 4)"
    "fetch 0x1b339 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdx)))) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1b33c \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 64)))) (Immediate SixtyFour (ImmVal 18446744073709551491)), 8)"
    "fetch 0x1b344 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x1b349 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''mutex_unlock.constprop.4'')), 5)"
    "fetch 0x1b34e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1b350 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b351 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1b352 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x1b358 \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 64)))) (Immediate SixtyFour (ImmVal 18446744073709551501)), 5)"
    "fetch 0x1b35d \<equiv> (Unary (IS_80386 Setne) (Storage (Reg (General Eight rbx))), 3)"
    "fetch 0x1b360 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''mutex_unlock.constprop.4'')), 5)"
    "fetch 0x1b365 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General Eight rbx))), 3)"
    "fetch 0x1b368 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x1b36b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1b36d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b36e \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1b36f \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x1b370 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 61521)))) (Storage (Reg (General SixtyFour rdx))), 7)"
    "fetch 0x1b377 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 111417)), 2)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and mutex_lock_constprop_5\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''mutex_lock.constprop.5'') = mutex_lock_constprop_5_addr\<close>
    and mutex_unlock_constprop_4\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''mutex_unlock.constprop.4'') = mutex_unlock_constprop_4_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>mutex_lock_constprop_5_0x1b314_retval \<equiv> mutex_lock_constprop_5_0x1b314_retval\<^sub>v\<close>
definition \<open>mutex_unlock_constprop_4_0x1b349_retval \<equiv> mutex_unlock_constprop_4_0x1b349_retval\<^sub>v\<close>
definition \<open>mutex_unlock_constprop_4_0x1b360_retval \<equiv> mutex_unlock_constprop_4_0x1b360_retval\<^sub>v\<close>

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
  auto simp: add block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

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

locale "qemu_paio_cancel" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1b310_0 :: state_pred where
  \<open>P_0x1b310_0 \<sigma> \<equiv> RIP \<sigma> = 0x1b310 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1b310_0_def[Ps]

definition P_0x1b310_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b310_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1b310_0_regions :: state_pred where
  \<open>P_0x1b310_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1b310_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b314_0 :: state_pred where
  \<open>Q_0x1b314_0 \<sigma> \<equiv> RIP \<sigma> = 0x1b314 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1b314_0_def[Qs]

schematic_goal qemu_paio_cancel_0_2_0x1b310_0x1b311_0[blocks]:
  assumes \<open>(P_0x1b310_0 && P_0x1b310_0_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b311 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b314_0 ?\<sigma> \<and> block_usage P_0x1b310_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b310_0_def P_0x1b310_0_regions_def post: Q_0x1b314_0_def regionset: P_0x1b310_0_regions_set_def)

definition P_0x1b314_1 :: state_pred where
  \<open>P_0x1b314_1 \<sigma> \<equiv> RIP \<sigma> = 0x1b314 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1b314_1_def[Ps]

definition P_0x1b314_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b314_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b314_1_regions :: state_pred where
  \<open>P_0x1b314_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1b314_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_mutex_lock_constprop_5_addr_0x1b314_1 :: state_pred where
  \<open>Q_mutex_lock_constprop_5_addr_0x1b314_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = mutex_lock_constprop_5_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare Q_mutex_lock_constprop_5_addr_0x1b314_1_def[Qs]

schematic_goal qemu_paio_cancel_0_1_0x1b314_0x1b314_1[blocks]:
  assumes \<open>(P_0x1b314_1 && P_0x1b314_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b314 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_mutex_lock_constprop_5_addr_0x1b314_1 ?\<sigma> \<and> block_usage P_0x1b314_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b314_1_def P_0x1b314_1_regions_def post: Q_mutex_lock_constprop_5_addr_0x1b314_1_def regionset: P_0x1b314_1_regions_set_def)

definition P_0x1b319_2 :: state_pred where
  \<open>P_0x1b319_2 \<sigma> \<equiv> RIP \<sigma> = 0x1b319 \<and> RAX \<sigma> = mutex_lock_constprop_5_0x1b314_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare P_0x1b319_2_def[Ps]

definition P_0x1b319_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b319_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0x48), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b319_2_regions :: state_pred where
  \<open>P_0x1b319_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1b319_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b31e_2 :: state_pred where
  \<open>Q_0x1b31e_2 \<sigma> \<equiv> RIP \<sigma> = 0x1b31e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare Q_0x1b31e_2_def[Qs]

schematic_goal qemu_paio_cancel_0_2_0x1b319_0x1b31c_2[blocks]:
  assumes \<open>(P_0x1b319_2 && P_0x1b319_2_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b31c 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b31e_2 ?\<sigma> \<and> block_usage P_0x1b319_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b319_2_def P_0x1b319_2_regions_def post: Q_0x1b31e_2_def regionset: P_0x1b319_2_regions_set_def)

definition P_0x1b31e_true_3 :: state_pred where
  \<open>P_0x1b31e_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x1b31e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare P_0x1b31e_true_3_def[Ps]

definition P_0x1b31e_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b31e_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x48), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b31e_true_3_regions :: state_pred where
  \<open>P_0x1b31e_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1b31e_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b360_3 :: state_pred where
  \<open>Q_0x1b360_3 \<sigma> \<equiv> RIP \<sigma> = 0x1b360 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> RBX \<sigma> = (ucast(fst (bv_cat ((ucast (((\<langle>63,8\<rangle>RSI\<^sub>0::56 word)::56 word))::64 word), 56) ((ucast (((if' ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) \<noteq> 0xffffffffffffff8d then 0x1 else (0x0::8 word))::8 word))::64 word), 8)))::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare Q_0x1b360_3_def[Qs]

schematic_goal qemu_paio_cancel_0_3_0x1b31e_0x1b35d_3[blocks]:
  assumes \<open>(P_0x1b31e_true_3 && P_0x1b31e_true_3_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b35d 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b360_3 ?\<sigma> \<and> block_usage P_0x1b31e_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps add: bv_cat.simps pre: P_0x1b31e_true_3_def P_0x1b31e_true_3_regions_def post: Q_0x1b360_3_def regionset: P_0x1b31e_true_3_regions_set_def)

definition P_0x1b360_4 :: state_pred where
  \<open>P_0x1b360_4 \<sigma> \<equiv> RIP \<sigma> = 0x1b360 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> RBX \<sigma> = (ucast(fst (bv_cat ((ucast (((\<langle>63,8\<rangle>RSI\<^sub>0::56 word)::56 word))::64 word), 56) ((ucast (((if' ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) \<noteq> 0xffffffffffffff8d then 0x1 else (0x0::8 word))::8 word))::64 word), 8)))::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare P_0x1b360_4_def[Ps]

definition P_0x1b360_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b360_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x48), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b360_4_regions :: state_pred where
  \<open>P_0x1b360_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1b360_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_mutex_unlock_constprop_4_addr_0x1b360_4 :: state_pred where
  \<open>Q_mutex_unlock_constprop_4_addr_0x1b360_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = mutex_unlock_constprop_4_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> RBX \<sigma> = (ucast(fst (bv_cat ((ucast (((\<langle>63,8\<rangle>RSI\<^sub>0::56 word)::56 word))::64 word), 56) ((ucast (((if' ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) \<noteq> 0xffffffffffffff8d then 0x1 else (0x0::8 word))::8 word))::64 word), 8)))::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b365\<close>
declare Q_mutex_unlock_constprop_4_addr_0x1b360_4_def[Qs]

schematic_goal qemu_paio_cancel_0_1_0x1b360_0x1b360_4[blocks]:
  assumes \<open>(P_0x1b360_4 && P_0x1b360_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b360 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_mutex_unlock_constprop_4_addr_0x1b360_4 ?\<sigma> \<and> block_usage P_0x1b360_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b360_4_def P_0x1b360_4_regions_def post: Q_mutex_unlock_constprop_4_addr_0x1b360_4_def regionset: P_0x1b360_4_regions_set_def)

definition P_0x1b365_5 :: state_pred where
  \<open>P_0x1b365_5 \<sigma> \<equiv> RIP \<sigma> = 0x1b365 \<and> RAX \<sigma> = mutex_unlock_constprop_4_0x1b360_retval \<and> RBX \<sigma> = (ucast(fst (bv_cat ((ucast (((\<langle>63,8\<rangle>RSI\<^sub>0::56 word)::56 word))::64 word), 56) ((ucast (((if' ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) \<noteq> 0xffffffffffffff8d then 0x1 else (0x0::8 word))::8 word))::64 word), 8)))::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b365\<close>
declare P_0x1b365_5_def[Ps]

definition P_0x1b365_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b365_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x48), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b365_5_regions :: state_pred where
  \<open>P_0x1b365_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1b365_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_5 :: state_pred where
  \<open>Q_ret_address_5 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_5_def[Qs]

schematic_goal qemu_paio_cancel_0_5_0x1b365_0x1b36e_5[blocks]:
  assumes \<open>(P_0x1b365_5 && P_0x1b365_5_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1b36e 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_5 ?\<sigma> \<and> block_usage P_0x1b365_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b365_5_def P_0x1b365_5_regions_def post: Q_ret_address_5_def regionset: P_0x1b365_5_regions_set_def)

definition P_0x1b31e_false_6 :: state_pred where
  \<open>P_0x1b31e_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x1b31e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare P_0x1b31e_false_6_def[Ps]

definition P_0x1b31e_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b31e_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x30), 8),
    (3, ((RSI\<^sub>0::64 word) + 0x48), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b31e_false_6_regions :: state_pred where
  \<open>P_0x1b31e_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1b31e_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b32b_6 :: state_pred where
  \<open>Q_0x1b32b_6 \<sigma> \<equiv> RIP \<sigma> = 0x1b32b \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare Q_0x1b32b_6_def[Qs]

schematic_goal qemu_paio_cancel_0_4_0x1b31e_0x1b328_6[blocks]:
  assumes \<open>(P_0x1b31e_false_6 && P_0x1b31e_false_6_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1b328 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b32b_6 ?\<sigma> \<and> block_usage P_0x1b31e_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b31e_false_6_def P_0x1b31e_false_6_regions_def post: Q_0x1b32b_6_def regionset: P_0x1b31e_false_6_regions_set_def)

definition P_0x1b32b_true_7 :: state_pred where
  \<open>P_0x1b32b_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x1b32b \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare P_0x1b32b_true_7_def[Ps]

definition P_0x1b32b_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b32b_true_7_regions_set \<sigma> \<equiv> {
    (0, 0x2a3c8, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSI\<^sub>0::64 word) + 0x30), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x48), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b32b_true_7_regions :: state_pred where
  \<open>P_0x1b32b_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1b32b_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b339_7 :: state_pred where
  \<open>Q_0x1b339_7 \<sigma> \<equiv> RIP \<sigma> = 0x1b339 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare Q_0x1b339_7_def[Qs]

schematic_goal qemu_paio_cancel_0_3_0x1b32b_0x1b377_7[blocks]:
  assumes \<open>(P_0x1b32b_true_7 && P_0x1b32b_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b377 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b339_7 ?\<sigma> \<and> block_usage P_0x1b32b_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b32b_true_7_def P_0x1b32b_true_7_regions_def post: Q_0x1b339_7_def regionset: P_0x1b32b_true_7_regions_set_def)

definition P_0x1b32b_false_8 :: state_pred where
  \<open>P_0x1b32b_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x1b32b \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare P_0x1b32b_false_8_def[Ps]

definition P_0x1b32b_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b32b_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x30), 8),
    (3, ((RSI\<^sub>0::64 word) + 0x48), 4),
    (4, (((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word)::64 word) + 0x30), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b32b_false_8_regions :: state_pred where
  \<open>P_0x1b32b_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1b32b_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b339_8 :: state_pred where
  \<open>Q_0x1b339_8 \<sigma> \<equiv> RIP \<sigma> = 0x1b339 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare Q_0x1b339_8_def[Qs]

schematic_goal qemu_paio_cancel_0_4_0x1b32b_0x1b335_8[blocks]:
  assumes \<open>(P_0x1b32b_false_8 && P_0x1b32b_false_8_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1b335 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b339_8 ?\<sigma> \<and> block_usage P_0x1b32b_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b32b_false_8_def P_0x1b32b_false_8_regions_def post: Q_0x1b339_8_def regionset: P_0x1b32b_false_8_regions_set_def)

definition P_0x1b339_9 :: state_pred where
  \<open>P_0x1b339_9 \<sigma> \<equiv> RIP \<sigma> = 0x1b339 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319\<close>
declare P_0x1b339_9_def[Ps]

definition P_0x1b339_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b339_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x30), 8),
    (3, ((RSI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x48), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word), 8)
  }\<close>

definition P_0x1b339_9_regions :: state_pred where
  \<open>P_0x1b339_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1b339_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b349_9 :: state_pred where
  \<open>Q_0x1b349_9 \<sigma> \<equiv> RIP \<sigma> = 0x1b349 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> RBX \<sigma> = 0x1 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) = 0xffffffffffffff83 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1b349_9_def[Qs]

schematic_goal qemu_paio_cancel_0_3_0x1b339_0x1b344_9[blocks]:
  assumes \<open>(P_0x1b339_9 && P_0x1b339_9_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b344 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b349_9 ?\<sigma> \<and> block_usage P_0x1b339_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b339_9_def P_0x1b339_9_regions_def post: Q_0x1b349_9_def regionset: P_0x1b339_9_regions_set_def)

definition P_0x1b349_10 :: state_pred where
  \<open>P_0x1b349_10 \<sigma> \<equiv> RIP \<sigma> = 0x1b349 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> RBX \<sigma> = 0x1 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) = 0xffffffffffffff83 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b319 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x1b349_10_def[Ps]

definition P_0x1b349_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b349_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x30), 8),
    (3, ((RSI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x48), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word), 8)
  }\<close>

definition P_0x1b349_10_regions :: state_pred where
  \<open>P_0x1b349_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1b349_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_mutex_unlock_constprop_4_addr_0x1b349_10 :: state_pred where
  \<open>Q_mutex_unlock_constprop_4_addr_0x1b349_10 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = mutex_unlock_constprop_4_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> RBX \<sigma> = 0x1 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) = 0xffffffffffffff83 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b34e \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_mutex_unlock_constprop_4_addr_0x1b349_10_def[Qs]

schematic_goal qemu_paio_cancel_0_1_0x1b349_0x1b349_10[blocks]:
  assumes \<open>(P_0x1b349_10 && P_0x1b349_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b349 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_mutex_unlock_constprop_4_addr_0x1b349_10 ?\<sigma> \<and> block_usage P_0x1b349_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b349_10_def P_0x1b349_10_regions_def post: Q_mutex_unlock_constprop_4_addr_0x1b349_10_def regionset: P_0x1b349_10_regions_set_def)

definition P_0x1b34e_11 :: state_pred where
  \<open>P_0x1b34e_11 \<sigma> \<equiv> RIP \<sigma> = 0x1b34e \<and> RAX \<sigma> = mutex_unlock_constprop_4_0x1b349_retval \<and> RBX \<sigma> = 0x1 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x40),8]::64 word) = 0xffffffffffffff83 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b34e \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x1b34e_11_def[Ps]

definition P_0x1b34e_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b34e_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSI\<^sub>0::64 word) + 0x30), 8),
    (3, ((RSI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x48), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x30),8]::64 word), 8)
  }\<close>

definition P_0x1b34e_11_regions :: state_pred where
  \<open>P_0x1b34e_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1b34e_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_11 :: state_pred where
  \<open>Q_ret_address_11 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_11_def[Qs]

schematic_goal qemu_paio_cancel_0_3_0x1b34e_0x1b351_11[blocks]:
  assumes \<open>(P_0x1b34e_11 && P_0x1b34e_11_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b351 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_11 ?\<sigma> \<and> block_usage P_0x1b34e_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b34e_11_def P_0x1b34e_11_regions_def post: Q_ret_address_11_def regionset: P_0x1b34e_11_regions_set_def)

definition qemu_paio_cancel_acode :: ACode where
  \<open>qemu_paio_cancel_acode =
    Block 2 0x1b311 0;
    Block (Suc 0) 0x1b314 (Suc 0);
    CALL mutex_lock_constprop_5_acode;
    Block 2 0x1b31c 2;
    IF !ZF THEN
      Block 3 0x1b35d 3;
      Block (Suc 0) 0x1b360 4;
      CALL mutex_unlock_constprop_4_acode;
      Block 5 0x1b36e 5
    ELSE
      Block 4 0x1b328 6;
      IF ZF THEN
        Block 3 0x1b377 7
      ELSE
        Block 4 0x1b335 8
      FI;
      Block 3 0x1b344 9;
      Block (Suc 0) 0x1b349 10;
      CALL mutex_unlock_constprop_4_acode;
      Block 3 0x1b351 11
    FI
  \<close>

schematic_goal "qemu_paio_cancel":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b314 \<longrightarrow> P_0x1b314_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b319 \<longrightarrow> P_0x1b319_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b31e \<longrightarrow> P_0x1b31e_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b360 \<longrightarrow> P_0x1b360_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b365 \<longrightarrow> P_0x1b365_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b31e \<longrightarrow> P_0x1b31e_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b32b \<longrightarrow> P_0x1b32b_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b32b \<longrightarrow> P_0x1b32b_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b339 \<longrightarrow> P_0x1b339_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b349 \<longrightarrow> P_0x1b349_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b34e \<longrightarrow> P_0x1b34e_11_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_mutex_lock_constprop_5_addr_0x1b314_1}} \<box>mutex_lock_constprop_5_acode {{P_0x1b319_2;M_0x1b314}}\<close>
    and [blocks]: \<open>{{Q_mutex_unlock_constprop_4_addr_0x1b360_4}} \<box>mutex_unlock_constprop_4_acode {{P_0x1b365_5;M_0x1b360}}\<close>
    and [blocks]: \<open>{{Q_mutex_unlock_constprop_4_addr_0x1b349_10}} \<box>mutex_unlock_constprop_4_acode {{P_0x1b34e_11;M_0x1b349}}\<close>
  shows \<open>{{?P}} qemu_paio_cancel_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_paio_cancel_acode_def assms: assms)

end
