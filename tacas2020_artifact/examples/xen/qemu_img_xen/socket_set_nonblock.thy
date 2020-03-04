theory socket_set_nonblock
  imports
    "../../../isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes fcntl64_0x553a_retval\<^sub>v fcntl64_0x554e_retval\<^sub>v fcntl64_addr :: \<open>64 word\<close>
    and fcntl64_acode :: ACode
  assumes fetch:
    "fetch 0x5530 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5531 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 3)), 5)"
    "fetch 0x5536 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5538 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x553a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fcntl64'')), 5)"
    "fetch 0x553f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x5541 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 4)), 5)"
    "fetch 0x5546 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5547 \<equiv> (Binary (IS_8088 Or) (Reg (General EightHigh rax)) (Immediate SixtyFour (ImmVal 8)), 3)"
    "fetch 0x554a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x554c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x554e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fcntl64'')), 1)"
    "fetch 0x554f \<equiv> (Nullary (IS_8088 Ret), 4)"
    "fetch 0x5553 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and fcntl64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''fcntl64'') = fcntl64_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>fcntl64_0x553a_retval \<equiv> fcntl64_0x553a_retval\<^sub>v\<close>
definition \<open>fcntl64_0x554e_retval \<equiv> fcntl64_0x554e_retval\<^sub>v\<close>

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

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "socket_set_nonblock" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5530_0 :: state_pred where
  \<open>P_0x5530_0 \<sigma> \<equiv> RIP \<sigma> = 0x5530 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5530_0_def[Ps]

definition P_0x5530_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5530_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x5530_0_regions :: state_pred where
  \<open>P_0x5530_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5530_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x553a_0 :: state_pred where
  \<open>Q_0x553a_0 \<sigma> \<equiv> RIP \<sigma> = 0x553a \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x553a_0_def[Qs]

schematic_goal socket_set_nonblock_0_4_0x5530_0x5538_0[blocks]:
  assumes \<open>(P_0x5530_0 && P_0x5530_0_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x5538 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x553a_0 ?\<sigma> \<and> block_usage P_0x5530_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5530_0_def P_0x5530_0_regions_def post: Q_0x553a_0_def regionset: P_0x5530_0_regions_set_def)

definition P_0x553a_1 :: state_pred where
  \<open>P_0x553a_1 \<sigma> \<equiv> RIP \<sigma> = 0x553a \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x553a_1_def[Ps]

definition P_0x553a_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x553a_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x553a_1_regions :: state_pred where
  \<open>P_0x553a_1_regions \<sigma> \<equiv> \<exists>regions. P_0x553a_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fcntl64_addr_0x553a_1 :: state_pred where
  \<open>Q_fcntl64_addr_0x553a_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = fcntl64_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x553f\<close>
declare Q_fcntl64_addr_0x553a_1_def[Qs]

schematic_goal socket_set_nonblock_0_1_0x553a_0x553a_1[blocks]:
  assumes \<open>(P_0x553a_1 && P_0x553a_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x553a (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_fcntl64_addr_0x553a_1 ?\<sigma> \<and> block_usage P_0x553a_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x553a_1_def P_0x553a_1_regions_def post: Q_fcntl64_addr_0x553a_1_def regionset: P_0x553a_1_regions_set_def)

definition P_0x553f_2 :: state_pred where
  \<open>P_0x553f_2 \<sigma> \<equiv> RIP \<sigma> = 0x553f \<and> RAX \<sigma> = fcntl64_0x553a_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x3 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x553f\<close>
declare P_0x553f_2_def[Ps]

definition P_0x553f_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x553f_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x553f_2_regions :: state_pred where
  \<open>P_0x553f_2_regions \<sigma> \<equiv> \<exists>regions. P_0x553f_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x554e_2 :: state_pred where
  \<open>Q_0x554e_2 \<sigma> \<equiv> RIP \<sigma> = 0x554e \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ucast ((ucast(fst (bv_cat ((ucast (((ucast(fst (bv_cat ((ucast (((\<langle>31,16\<rangle>fcntl64_0x553a_retval::16 word)::16 word))::64 word), 16) ((ucast (((((\<langle>15,8\<rangle>fcntl64_0x553a_retval::8 word)::8 word) OR 0x8)::8 word))::64 word), 8)))::24 word)::24 word))::64 word), 24) ((ucast (((\<langle>7,0\<rangle>fcntl64_0x553a_retval::8 word)::8 word))::64 word), 8)))::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x4 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x553f\<close>
declare Q_0x554e_2_def[Qs]

schematic_goal socket_set_nonblock_0_6_0x553f_0x554c_2[blocks]:
  assumes \<open>(P_0x553f_2 && P_0x553f_2_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x554c 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x554e_2 ?\<sigma> \<and> block_usage P_0x553f_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x553f_2_def P_0x553f_2_regions_def post: Q_0x554e_2_def regionset: P_0x553f_2_regions_set_def)

definition P_0x554e_3 :: state_pred where
  \<open>P_0x554e_3 \<sigma> \<equiv> RIP \<sigma> = 0x554e \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ucast ((ucast(fst (bv_cat ((ucast (((ucast(fst (bv_cat ((ucast (((\<langle>31,16\<rangle>fcntl64_0x553a_retval::16 word)::16 word))::64 word), 16) ((ucast (((((\<langle>15,8\<rangle>fcntl64_0x553a_retval::8 word)::8 word) OR 0x8)::8 word))::64 word), 8)))::24 word)::24 word))::64 word), 24) ((ucast (((\<langle>7,0\<rangle>fcntl64_0x553a_retval::8 word)::8 word))::64 word), 8)))::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x4 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x553f\<close>
declare P_0x554e_3_def[Ps]

definition P_0x554e_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x554e_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x554e_3_regions :: state_pred where
  \<open>P_0x554e_3_regions \<sigma> \<equiv> \<exists>regions. P_0x554e_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fcntl64_addr_0x554e_3 :: state_pred where
  \<open>Q_fcntl64_addr_0x554e_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = fcntl64_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ucast ((ucast(fst (bv_cat ((ucast (((ucast(fst (bv_cat ((ucast (((\<langle>31,16\<rangle>fcntl64_0x553a_retval::16 word)::16 word))::64 word), 16) ((ucast (((((\<langle>15,8\<rangle>fcntl64_0x553a_retval::8 word)::8 word) OR 0x8)::8 word))::64 word), 8)))::24 word)::24 word))::64 word), 24) ((ucast (((\<langle>7,0\<rangle>fcntl64_0x553a_retval::8 word)::8 word))::64 word), 8)))::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x4 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x554f \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x553f\<close>
declare Q_fcntl64_addr_0x554e_3_def[Qs]

schematic_goal socket_set_nonblock_0_1_0x554e_0x554e_3[blocks]:
  assumes \<open>(P_0x554e_3 && P_0x554e_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x554e 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fcntl64_addr_0x554e_3 ?\<sigma> \<and> block_usage P_0x554e_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x554e_3_def P_0x554e_3_regions_def post: Q_fcntl64_addr_0x554e_3_def regionset: P_0x554e_3_regions_set_def)

definition P_0x554f_4 :: state_pred where
  \<open>P_0x554f_4 \<sigma> \<equiv> RIP \<sigma> = 0x554f \<and> RAX \<sigma> = fcntl64_0x554e_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ucast ((ucast(fst (bv_cat ((ucast (((ucast(fst (bv_cat ((ucast (((\<langle>31,16\<rangle>fcntl64_0x553a_retval::16 word)::16 word))::64 word), 16) ((ucast (((((\<langle>15,8\<rangle>fcntl64_0x553a_retval::8 word)::8 word) OR 0x8)::8 word))::64 word), 8)))::24 word)::24 word))::64 word), 24) ((ucast (((\<langle>7,0\<rangle>fcntl64_0x553a_retval::8 word)::8 word))::64 word), 8)))::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x4 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x554f \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x553f\<close>
declare P_0x554f_4_def[Ps]

definition P_0x554f_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x554f_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x554f_4_regions :: state_pred where
  \<open>P_0x554f_4_regions \<sigma> \<equiv> \<exists>regions. P_0x554f_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_4 :: state_pred where
  \<open>Q_ret_address_4 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = fcntl64_0x554e_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ucast ((ucast(fst (bv_cat ((ucast (((ucast(fst (bv_cat ((ucast (((\<langle>31,16\<rangle>fcntl64_0x553a_retval::16 word)::16 word))::64 word), 16) ((ucast (((((\<langle>15,8\<rangle>fcntl64_0x553a_retval::8 word)::8 word) OR 0x8)::8 word))::64 word), 8)))::24 word)::24 word))::64 word), 24) ((ucast (((\<langle>7,0\<rangle>fcntl64_0x553a_retval::8 word)::8 word))::64 word), 8)))::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x554f \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x553f\<close>
declare Q_ret_address_4_def[Qs]

schematic_goal socket_set_nonblock_0_1_0x554f_0x554f_4[blocks]:
  assumes \<open>(P_0x554f_4 && P_0x554f_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x554f 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_4 ?\<sigma> \<and> block_usage P_0x554f_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x554f_4_def P_0x554f_4_regions_def post: Q_ret_address_4_def regionset: P_0x554f_4_regions_set_def)

definition socket_set_nonblock_acode :: ACode where
  \<open>socket_set_nonblock_acode =
    Block 4 0x5538 0;
    Block (Suc 0) 0x553a (Suc 0);
    CALL fcntl64_acode;
    Block 6 0x554c 2;
    Block (Suc 0) 0x554e 3;
    CALL fcntl64_acode;
    Block (Suc 0) 0x554f 4
  \<close>

schematic_goal "socket_set_nonblock":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x553a \<longrightarrow> P_0x553a_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x553f \<longrightarrow> P_0x553f_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x554e \<longrightarrow> P_0x554e_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x554f \<longrightarrow> P_0x554f_4_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_fcntl64_addr_0x553a_1}} \<box>fcntl64_acode {{P_0x553f_2;M_0x553a}}\<close>
    and [blocks]: \<open>{{Q_fcntl64_addr_0x554e_3}} \<box>fcntl64_acode {{P_0x554f_4;M_0x554e}}\<close>
  shows \<open>{{?P}} socket_set_nonblock_acode {{?Q;?M}}\<close>
  by (vcg acode: socket_set_nonblock_acode_def assms: assms)

end

