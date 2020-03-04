theory cloop_probe
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes memcmp_0x9fac_retval\<^sub>v memcmp_addr :: \<open>64 word\<close>
    and memcmp_acode :: ACode
  assumes fetch:
    "fetch 0x9f90 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x9f94 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 83)), 5)"
    "fetch 0x9f99 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 83)), 3)"
    "fetch 0x9f9c \<equiv> (Binary (IS_PentiumPro Cmovge) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x9f9f \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x9fa2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x9fa5 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 92764)))), 7)"
    "fetch 0x9fac \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcmp'')), 5)"
    "fetch 0x9fb1 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x9fb3 \<equiv> (Unary (IS_80386 Sete) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x9fb6 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x9fba \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x9fbd \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x9fbf \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and memcmp\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcmp'') = memcmp_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>memcmp_0x9fac_retval \<equiv> memcmp_0x9fac_retval\<^sub>v\<close>

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

method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "cloop_probe" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x9f90_0 :: state_pred where
  \<open>P_0x9f90_0 \<sigma> \<equiv> RIP \<sigma> = 0x9f90 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x9f90_0_def[Ps]

definition P_0x9f90_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9f90_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x9f90_0_regions :: state_pred where
  \<open>P_0x9f90_0_regions \<sigma> \<equiv> \<exists>regions. P_0x9f90_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x9fac_0 :: state_pred where
  \<open>Q_0x9fac_0 \<sigma> \<equiv> RIP \<sigma> = 0x9fac \<and> RAX \<sigma> = 0x53 \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) \<ge>s 0x53 then 0x53 else ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = 0x20a08 \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x9fac_0_def[Qs]

schematic_goal cloop_probe_0_7_0x9f90_0x9fa5_0[blocks]:
  assumes \<open>(P_0x9f90_0 && P_0x9f90_0_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x9fa5 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9fac_0 ?\<sigma> \<and> block_usage P_0x9f90_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9f90_0_def P_0x9f90_0_regions_def post: Q_0x9fac_0_def regionset: P_0x9f90_0_regions_set_def)

definition P_0x9fac_1 :: state_pred where
  \<open>P_0x9fac_1 \<sigma> \<equiv> RIP \<sigma> = 0x9fac \<and> RAX \<sigma> = 0x53 \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) \<ge>s 0x53 then 0x53 else ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = 0x20a08 \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x9fac_1_def[Ps]

definition P_0x9fac_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9fac_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x9fac_1_regions :: state_pred where
  \<open>P_0x9fac_1_regions \<sigma> \<equiv> \<exists>regions. P_0x9fac_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcmp_addr_0x9fac_1 :: state_pred where
  \<open>Q_memcmp_addr_0x9fac_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = memcmp_addr \<and> RAX \<sigma> = 0x53 \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) \<ge>s 0x53 then 0x53 else ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = 0x20a08 \<and> RSI \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x9fb1\<close>
declare Q_memcmp_addr_0x9fac_1_def[Qs]

schematic_goal cloop_probe_0_1_0x9fac_0x9fac_1[blocks]:
  assumes \<open>(P_0x9fac_1 && P_0x9fac_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9fac (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcmp_addr_0x9fac_1 ?\<sigma> \<and> block_usage P_0x9fac_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9fac_1_def P_0x9fac_1_regions_def post: Q_memcmp_addr_0x9fac_1_def regionset: P_0x9fac_1_regions_set_def)

definition P_0x9fb1_2 :: state_pred where
  \<open>P_0x9fb1_2 \<sigma> \<equiv> RIP \<sigma> = 0x9fb1 \<and> RAX \<sigma> = memcmp_0x9fac_retval \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) \<ge>s 0x53 then 0x53 else ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = 0x20a08 \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x9fb1\<close>
declare P_0x9fb1_2_def[Ps]

definition P_0x9fb1_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9fb1_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x9fb1_2_regions :: state_pred where
  \<open>P_0x9fb1_2_regions \<sigma> \<equiv> \<exists>regions. P_0x9fb1_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_2 :: state_pred where
  \<open>Q_ret_address_2 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = ucast ((((if' ((\<langle>31,0\<rangle>memcmp_0x9fac_retval::32 word)::32 word) = (ucast ((0x0::64 word))::32 word) then 0x1 else (0x0::32 word))::32 word) + (if' ((\<langle>31,0\<rangle>memcmp_0x9fac_retval::32 word)::32 word) = (ucast ((0x0::64 word))::32 word) then 0x1 else (0x0::32 word)))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) \<ge>s 0x53 then 0x53 else ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = 0x20a08 \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x9fb1\<close>
declare Q_ret_address_2_def[Qs]

schematic_goal cloop_probe_0_6_0x9fb1_0x9fbf_2[blocks]:
  assumes \<open>(P_0x9fb1_2 && P_0x9fb1_2_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x9fbf 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_2 ?\<sigma> \<and> block_usage P_0x9fb1_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9fb1_2_def P_0x9fb1_2_regions_def post: Q_ret_address_2_def regionset: P_0x9fb1_2_regions_set_def)

definition cloop_probe_acode :: ACode where
  \<open>cloop_probe_acode =
    Block 7 0x9fa5 0;
    Block (Suc 0) 0x9fac (Suc 0);
    CALL memcmp_acode;
    Block 6 0x9fbf 2
  \<close>

schematic_goal "cloop_probe":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9fac \<longrightarrow> P_0x9fac_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9fb1 \<longrightarrow> P_0x9fb1_2_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_memcmp_addr_0x9fac_1}} \<box>memcmp_acode {{P_0x9fb1_2;M_0x9fac}}\<close>
  shows \<open>{{?P}} cloop_probe_acode {{?Q;?M}}\<close>
  by (vcg acode: cloop_probe_acode_def assms: assms)

end
