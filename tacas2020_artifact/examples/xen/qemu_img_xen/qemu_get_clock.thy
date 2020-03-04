theory qemu_get_clock
  imports
    "../../../isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes gettimeofday_0x51b9_retval\<^sub>v stack_chk_fail_0x5205_retval\<^sub>v stack_chk_fail_addr gettimeofday_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode gettimeofday_acode :: ACode
  assumes fetch:
    "fetch 0x51a0 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 40)), 4)"
    "fetch 0x51a4 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x51a6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x51af \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x51b4 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x51b6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x51b9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''gettimeofday'')), 5)"
    "fetch 0x51be \<equiv> (Ternary (IS_8088 Imul) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))) (Immediate SixtyFour (ImmVal 1000000000)), 8)"
    "fetch 0x51c6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 4835703278458516699)), 10)"
    "fetch 0x51d0 \<equiv> (Ternary (IS_8088 Imul) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))) (Immediate SixtyFour (ImmVal 1000)), 9)"
    "fetch 0x51d9 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x51dc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x51df \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0x51e3 \<equiv> (Unary (IS_8088 Imul) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x51e6 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 18)), 4)"
    "fetch 0x51ea \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x51ed \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x51f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x51f5 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x51fe \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 20997)), 2)"
    "fetch 0x5200 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 40)), 4)"
    "fetch 0x5204 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5205 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and gettimeofday\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''gettimeofday'') = gettimeofday_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>gettimeofday_0x51b9_retval \<equiv> gettimeofday_0x51b9_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x5205_retval \<equiv> stack_chk_fail_0x5205_retval\<^sub>v\<close>

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
  )

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "qemu_get_clock" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x51a0_0 :: state_pred where
  \<open>P_0x51a0_0 \<sigma> \<equiv> RIP \<sigma> = 0x51a0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x51a0_0_def[Ps]

definition P_0x51a0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x51a0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x51a0_0_regions :: state_pred where
  \<open>P_0x51a0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x51a0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x51b9_0 :: state_pred where
  \<open>Q_0x51b9_0 \<sigma> \<equiv> RIP \<sigma> = 0x51b9 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x51b9_0_def[Qs]

schematic_goal qemu_get_clock_0_6_0x51a0_0x51b6_0[blocks]:
  assumes \<open>(P_0x51a0_0 && P_0x51a0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x51b6 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x51b9_0 ?\<sigma> \<and> block_usage P_0x51a0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x51a0_0_def P_0x51a0_0_regions_def post: Q_0x51b9_0_def regionset: P_0x51a0_0_regions_set_def)

definition P_0x51b9_1 :: state_pred where
  \<open>P_0x51b9_1 \<sigma> \<equiv> RIP \<sigma> = 0x51b9 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x51b9_1_def[Ps]

definition P_0x51b9_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x51b9_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x51b9_1_regions :: state_pred where
  \<open>P_0x51b9_1_regions \<sigma> \<equiv> \<exists>regions. P_0x51b9_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_gettimeofday_addr_0x51b9_1 :: state_pred where
  \<open>Q_gettimeofday_addr_0x51b9_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = gettimeofday_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x51be\<close>
declare Q_gettimeofday_addr_0x51b9_1_def[Qs]

schematic_goal qemu_get_clock_0_1_0x51b9_0x51b9_1[blocks]:
  assumes \<open>(P_0x51b9_1 && P_0x51b9_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x51b9 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_gettimeofday_addr_0x51b9_1 ?\<sigma> \<and> block_usage P_0x51b9_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x51b9_1_def P_0x51b9_1_regions_def post: Q_gettimeofday_addr_0x51b9_1_def regionset: P_0x51b9_1_regions_set_def)

definition P_0x51be_2 :: state_pred where
  \<open>P_0x51be_2 \<sigma> \<equiv> RIP \<sigma> = 0x51be \<and> RAX \<sigma> = gettimeofday_0x51b9_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x51be\<close>
declare P_0x51be_2_def[Ps]

definition P_0x51be_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x51be_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x51be_2_regions :: state_pred where
  \<open>P_0x51be_2_regions \<sigma> \<equiv> \<exists>regions. P_0x51be_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x51fe_2 :: state_pred where
  \<open>Q_0x51fe_2 \<sigma> \<equiv> RIP \<sigma> = 0x51fe \<and> RAX \<sigma> = ((((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18)::64 word) - ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63)) \<and> RCX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = ((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x51be\<close>
declare Q_0x51fe_2_def[Qs]

schematic_goal qemu_get_clock_0_12_0x51be_0x51f5_2[blocks]:
  assumes \<open>(P_0x51be_2 && P_0x51be_2_regions) \<sigma>\<close>
  shows \<open>exec_block 12 0x51f5 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x51fe_2 ?\<sigma> \<and> block_usage P_0x51be_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x51be_2_def P_0x51be_2_regions_def post: Q_0x51fe_2_def regionset: P_0x51be_2_regions_set_def)

definition P_0x51fe_true_3 :: state_pred where
  \<open>P_0x51fe_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x51fe \<and> RAX \<sigma> = ((((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18)::64 word) - ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63)) \<and> RCX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = ((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x51be\<close>
declare P_0x51fe_true_3_def[Ps]

definition P_0x51fe_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x51fe_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x51fe_true_3_regions :: state_pred where
  \<open>P_0x51fe_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x51fe_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5205_3 :: state_pred where
  \<open>Q_0x5205_3 \<sigma> \<equiv> RIP \<sigma> = 0x5205 \<and> RAX \<sigma> = ((((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18)::64 word) - ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63)) \<and> RCX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = ((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x51be\<close>
declare Q_0x5205_3_def[Qs]

schematic_goal qemu_get_clock_0_1_0x51fe_0x51fe_3[blocks]:
  assumes \<open>(P_0x51fe_true_3 && P_0x51fe_true_3_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x51fe 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5205_3 ?\<sigma> \<and> block_usage P_0x51fe_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x51fe_true_3_def P_0x51fe_true_3_regions_def post: Q_0x5205_3_def regionset: P_0x51fe_true_3_regions_set_def)

definition P_0x5205_4 :: state_pred where
  \<open>P_0x5205_4 \<sigma> \<equiv> RIP \<sigma> = 0x5205 \<and> RAX \<sigma> = ((((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18)::64 word) - ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63)) \<and> RCX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = ((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x51be\<close>
declare P_0x5205_4_def[Ps]

definition P_0x5205_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5205_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5205_4_regions :: state_pred where
  \<open>P_0x5205_4_regions \<sigma> \<equiv> \<exists>regions. P_0x5205_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x5205_4 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x5205_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = ((((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18)::64 word) - ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63)) \<and> RCX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = ((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x5205_4_def[Qs]

schematic_goal qemu_get_clock_0_1_0x5205_0x5205_4[blocks]:
  assumes \<open>(P_0x5205_4 && P_0x5205_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5205 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x5205_4 ?\<sigma> \<and> block_usage P_0x5205_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5205_4_def P_0x5205_4_regions_def post: Q_stack_chk_fail_addr_0x5205_4_def regionset: P_0x5205_4_regions_set_def)

definition P_0x51fe_false_5 :: state_pred where
  \<open>P_0x51fe_false_5 \<sigma> \<equiv> RIP \<sigma> = 0x51fe \<and> RAX \<sigma> = ((((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18)::64 word) - ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63)) \<and> RCX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = ((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x51be\<close>
declare P_0x51fe_false_5_def[Ps]

definition P_0x51fe_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x51fe_false_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x51fe_false_5_regions :: state_pred where
  \<open>P_0x51fe_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0x51fe_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_5 :: state_pred where
  \<open>Q_ret_address_5 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RCX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = ((ucast (((hi_imul(ucast (((((\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)::64 word) * 0x3b9aca00)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word)::64 word) * 0x3e8)::64 word))::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word))::64 word))::64 word) >>> 18) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RSI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word)\<close>
declare Q_ret_address_5_def[Qs]

schematic_goal qemu_get_clock_0_3_0x51fe_0x5204_5[blocks]:
  assumes \<open>(P_0x51fe_false_5 && P_0x51fe_false_5_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5204 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_5 ?\<sigma> \<and> block_usage P_0x51fe_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x51fe_false_5_def P_0x51fe_false_5_regions_def post: Q_ret_address_5_def regionset: P_0x51fe_false_5_regions_set_def)

definition qemu_get_clock_acode :: ACode where
  \<open>qemu_get_clock_acode =
    Block 6 0x51b6 0;
    Block (Suc 0) 0x51b9 (Suc 0);
    CALL gettimeofday_acode;
    Block 12 0x51f5 2;
    IF !ZF THEN
      Block (Suc 0) 0x51fe 3;
      Block (Suc 0) 0x5205 4;
      CALL stack_chk_fail_acode
    ELSE
      Block 3 0x5204 5
    FI
  \<close>

schematic_goal "qemu_get_clock":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x51b9 \<longrightarrow> P_0x51b9_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x51be \<longrightarrow> P_0x51be_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x51fe \<longrightarrow> P_0x51fe_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5205 \<longrightarrow> P_0x5205_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x51fe \<longrightarrow> P_0x51fe_false_5_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_gettimeofday_addr_0x51b9_1}} \<box>gettimeofday_acode {{P_0x51be_2;M_0x51b9}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x5205_4}} \<box>stack_chk_fail_acode {{Q_fail;M_0x5205}}\<close>
  shows \<open>{{?P}} qemu_get_clock_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_get_clock_acode_def assms: assms)

end
