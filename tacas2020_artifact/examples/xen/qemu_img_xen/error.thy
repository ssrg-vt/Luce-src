theory error
  imports Main
    "~/Documents/research/devel/VT/assembly/isabelle/VCG/HTriple"
    begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes fwrite_0x3e4d_retval\<^sub>v vfprintf_chk_0x3e64_retval\<^sub>v fputc_0x3e75_retval\<^sub>v exit_0x3e7f_retval\<^sub>v vfprintf_chk_addr exit_addr fputc_addr fwrite_addr :: \<open>64 word\<close>
    and vfprintf_chk_acode exit_acode fputc_acode fwrite_acode :: ACode
  assumes fetch:
    "fetch 0x3da0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x3da1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x3da4 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 208)), 7)"
    "fetch 0x3dab \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40)))) (Storage (Reg (General SixtyFour rsi))), 5)"
    "fetch 0x3db0 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48)))) (Storage (Reg (General SixtyFour rdx))), 5)"
    "fetch 0x3db5 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour rcx))), 5)"
    "fetch 0x3dba \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 64)))) (Storage (Reg (General SixtyFour r8))), 5)"
    "fetch 0x3dbf \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 72)))) (Storage (Reg (General SixtyFour r9))), 5)"
    "fetch 0x3dc4 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rax)) (Storage (Reg (General Eight rax))), 2)"
    "fetch 0x3dc6 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 15871)), 2)"
    "fetch 0x3dc8 \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 80)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 5)"
    "fetch 0x3dcd \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 96)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm1w3 ymm1w2 ymm1w1 ymm1w0))), 5)"
    "fetch 0x3dd2 \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 112)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm2w3 ymm2w2 ymm2w1 ymm2w0))), 5)"
    "fetch 0x3dd7 \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 128)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm3w3 ymm3w2 ymm3w1 ymm3w0))), 8)"
    "fetch 0x3ddf \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 144)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm4w3 ymm4w2 ymm4w1 ymm4w0))), 8)"
    "fetch 0x3de7 \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 160)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm5w3 ymm5w2 ymm5w1 ymm5w0))), 8)"
    "fetch 0x3def \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 176)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm6w3 ymm6w2 ymm6w1 ymm6w0))), 8)"
    "fetch 0x3df7 \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 192)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm7w3 ymm7w2 ymm7w1 ymm7w0))), 8)"
    "fetch 0x3dff \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x3e08 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x3e0d \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x3e0f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 10)), 5)"
    "fetch 0x3e14 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x3e19 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 224)))), 8)"
    "fetch 0x3e21 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 156888))))), 7)"
    "fetch 0x3e28 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x3e2d \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 102868)))), 7)"
    "fetch 0x3e34 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))), 5)"
    "fetch 0x3e39 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rsp)))) (Immediate SixtyFour (ImmVal 8)), 7)"
    "fetch 0x3e40 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 4)))) (Immediate SixtyFour (ImmVal 48)), 8)"
    "fetch 0x3e48 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x3e4d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fwrite'')), 5)"
    "fetch 0x3e52 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x3e55 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x3e58 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x3e5d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 156828))))), 7)"
    "fetch 0x3e64 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__vfprintf_chk'')), 5)"
    "fetch 0x3e69 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 156816))))), 7)"
    "fetch 0x3e70 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 10)), 5)"
    "fetch 0x3e75 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fputc'')), 5)"
    "fetch 0x3e7a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x3e7f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''exit'')), 5)"
    "fetch 0x3e84 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and vfprintf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__vfprintf_chk'') = vfprintf_chk_addr\<close>
    and exit\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''exit'') = exit_addr\<close>
    and fputc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''fputc'') = fputc_addr\<close>
    and fwrite\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''fwrite'') = fwrite_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>fwrite_0x3e4d_retval \<equiv> fwrite_0x3e4d_retval\<^sub>v\<close>
definition \<open>vfprintf_chk_0x3e64_retval \<equiv> vfprintf_chk_0x3e64_retval\<^sub>v\<close>
definition \<open>fputc_0x3e75_retval \<equiv> fputc_0x3e75_retval\<^sub>v\<close>
definition \<open>exit_0x3e7f_retval \<equiv> exit_0x3e7f_retval\<^sub>v\<close>

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
  auto simp: block_usage_def eq_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

method vcg_step uses assms =
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "error" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ymm0w0\<^sub>0\<^sub>v ymm0w1\<^sub>0\<^sub>v ymm1w0\<^sub>0\<^sub>v ymm1w1\<^sub>0\<^sub>v ymm2w0\<^sub>0\<^sub>v ymm2w1\<^sub>0\<^sub>v ymm3w0\<^sub>0\<^sub>v ymm3w1\<^sub>0\<^sub>v ymm4w0\<^sub>0\<^sub>v ymm4w1\<^sub>0\<^sub>v ymm5w0\<^sub>0\<^sub>v ymm5w1\<^sub>0\<^sub>v ymm6w0\<^sub>0\<^sub>v ymm6w1\<^sub>0\<^sub>v ymm7w0\<^sub>0\<^sub>v ymm7w1\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ymm0w0\<^sub>0 \<equiv> ymm0w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm0w1\<^sub>0 \<equiv> ymm0w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm1w0\<^sub>0 \<equiv> ymm1w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm1w1\<^sub>0 \<equiv> ymm1w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm2w0\<^sub>0 \<equiv> ymm2w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm2w1\<^sub>0 \<equiv> ymm2w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm3w0\<^sub>0 \<equiv> ymm3w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm3w1\<^sub>0 \<equiv> ymm3w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm4w0\<^sub>0 \<equiv> ymm4w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm4w1\<^sub>0 \<equiv> ymm4w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm5w0\<^sub>0 \<equiv> ymm5w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm5w1\<^sub>0 \<equiv> ymm5w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm6w0\<^sub>0 \<equiv> ymm6w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm6w1\<^sub>0 \<equiv> ymm6w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm7w0\<^sub>0 \<equiv> ymm7w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm7w1\<^sub>0 \<equiv> ymm7w1\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x3da0 :: state_pred where
  \<open>P_0x3da0 \<sigma> \<equiv> RIP \<sigma> = 0x3da0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x3da0_def[Ps]

definition P_0x3da0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3da0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (4, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (5, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x3da0_regions :: state_pred where
  \<open>P_0x3da0_regions \<sigma> \<equiv> \<exists>regions. P_0x3da0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3dc6 :: state_pred where
  \<open>Q_0x3dc6 \<sigma> \<equiv> RIP \<sigma> = 0x3dc6 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0\<close>
declare Q_0x3dc6_def[Qs]

schematic_goal error_0_9_0x3da0_0x3dc4[blocks]:
  assumes \<open>(P_0x3da0 && P_0x3da0_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x3da0 0x3dc4 None \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3dc6 ?\<sigma> \<and> block_usage P_0x3da0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3da0_def P_0x3da0_regions_def post: Q_0x3dc6_def regionset: P_0x3da0_regions_set_def)

definition P_0x3dc6_true :: state_pred where
  \<open>P_0x3dc6_true \<sigma> \<equiv> RIP \<sigma> = 0x3dc6 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0\<close>
declare P_0x3dc6_true_def[Ps]

definition P_0x3dc6_true_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3dc6_true_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (4, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (5, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x3dc6_true_regions :: state_pred where
  \<open>P_0x3dc6_true_regions \<sigma> \<equiv> \<exists>regions. P_0x3dc6_true_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3dff :: state_pred where
  \<open>Q_0x3dff \<sigma> \<equiv> RIP \<sigma> = 0x3dff \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0\<close>
declare Q_0x3dff_def[Qs]

schematic_goal error_0_1_0x3dc6_0x3dc6_true[blocks]:
  assumes \<open>(P_0x3dc6_true && P_0x3dc6_true_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3dc6 0x3dc6 (Some True) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3dff ?\<sigma> \<and> block_usage P_0x3dc6_true_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3dc6_true_def P_0x3dc6_true_regions_def post: Q_0x3dff_def regionset: P_0x3dc6_true_regions_set_def)

definition P_0x3dc6_false :: state_pred where
  \<open>P_0x3dc6_false \<sigma> \<equiv> RIP \<sigma> = 0x3dc6 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0\<close>
declare P_0x3dc6_false_def[Ps]

definition P_0x3dc6_false_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3dc6_false_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (21, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (22, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x3dc6_false_regions :: state_pred where
  \<open>P_0x3dc6_false_regions \<sigma> \<equiv> \<exists>regions. P_0x3dc6_false_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3dff :: state_pred where
  \<open>Q_0x3dff \<sigma> \<equiv> RIP \<sigma> = 0x3dff \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0\<close>
declare Q_0x3dff_def[Qs]

schematic_goal error_0_9_0x3dc6_0x3df7_false[blocks]:
  assumes \<open>(P_0x3dc6_false && P_0x3dc6_false_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x3dc6 0x3df7 (Some False) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3dff ?\<sigma> \<and> block_usage P_0x3dc6_false_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3dc6_false_def P_0x3dc6_false_regions_def post: Q_0x3dff_def regionset: P_0x3dc6_false_regions_set_def)

definition P_0x3dff :: state_pred where
  \<open>P_0x3dff \<sigma> \<equiv> RIP \<sigma> = 0x3dff \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0\<close>
declare P_0x3dff_def[Ps]

definition P_0x3dff_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3dff_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xc0), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xc8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xd0), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xd4), 4),
    (13, ((RSP\<^sub>0::64 word) - 0xd8), 4)
  }\<close>

definition P_0x3dff_regions :: state_pred where
  \<open>P_0x3dff_regions \<sigma> \<equiv> \<exists>regions. P_0x3dff_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3e4d :: state_pred where
  \<open>Q_0x3e4d \<sigma> \<equiv> RIP \<sigma> = 0x3e4d \<and> RAX \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0xa \<and> RDI \<sigma> = 0x1d008 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8\<close>
declare Q_0x3e4d_def[Qs]

schematic_goal error_0_13_0x3dff_0x3e48[blocks]:
  assumes \<open>(P_0x3dff && P_0x3dff_regions) \<sigma>\<close>
  shows \<open>exec_block 13 0x3dff 0x3e48 None \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3e4d ?\<sigma> \<and> block_usage P_0x3dff_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3dff_def P_0x3dff_regions_def post: Q_0x3e4d_def regionset: P_0x3dff_regions_set_def)

definition P_0x3e4d :: state_pred where
  \<open>P_0x3e4d \<sigma> \<equiv> RIP \<sigma> = 0x3e4d \<and> RAX \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0xa \<and> RDI \<sigma> = 0x1d008 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8\<close>
declare P_0x3e4d_def[Ps]

definition P_0x3e4d_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3e4d_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xc0), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xc8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xd0), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xd4), 4),
    (13, ((RSP\<^sub>0::64 word) - 0xd8), 4),
    (14, ((RSP\<^sub>0::64 word) - 0xe0), 8)
  }\<close>

definition P_0x3e4d_regions :: state_pred where
  \<open>P_0x3e4d_regions \<sigma> \<equiv> \<exists>regions. P_0x3e4d_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fwrite_addr_0x3e4d :: state_pred where
  \<open>Q_fwrite_addr_0x3e4d \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xe0) \<and> RIP \<sigma> = fwrite_addr \<and> RAX \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0xa \<and> RDI \<sigma> = 0x1d008 \<and> RSI \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e52\<close>
declare Q_fwrite_addr_0x3e4d_def[Qs]

schematic_goal error_0_1_0x3e4d_0x3e4d[blocks]:
  assumes \<open>(P_0x3e4d && P_0x3e4d_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3e4d 0x3e4d None \<sigma> \<triangleq> ?\<sigma> \<and> Q_fwrite_addr_0x3e4d ?\<sigma> \<and> block_usage P_0x3e4d_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3e4d_def P_0x3e4d_regions_def post: Q_fwrite_addr_0x3e4d_def regionset: P_0x3e4d_regions_set_def)

definition P_0x3e52 :: state_pred where
  \<open>P_0x3e52 \<sigma> \<equiv> RIP \<sigma> = 0x3e52 \<and> RAX \<sigma> = fwrite_0x3e4d_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0xa \<and> RDI \<sigma> = 0x1d008 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e52\<close>
declare P_0x3e52_def[Ps]

definition P_0x3e52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3e52_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xc0), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xc8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xd0), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xd4), 4),
    (13, ((RSP\<^sub>0::64 word) - 0xd8), 4),
    (14, ((RSP\<^sub>0::64 word) - 0xe0), 8)
  }\<close>

definition P_0x3e52_regions :: state_pred where
  \<open>P_0x3e52_regions \<sigma> \<equiv> \<exists>regions. P_0x3e52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3e64 :: state_pred where
  \<open>Q_0x3e64 \<sigma> \<equiv> RIP \<sigma> = 0x3e64 \<and> RAX \<sigma> = fwrite_0x3e4d_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e52\<close>
declare Q_0x3e64_def[Qs]

schematic_goal error_0_4_0x3e52_0x3e5d[blocks]:
  assumes \<open>(P_0x3e52 && P_0x3e52_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x3e52 0x3e5d None \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3e64 ?\<sigma> \<and> block_usage P_0x3e52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3e52_def P_0x3e52_regions_def post: Q_0x3e64_def regionset: P_0x3e52_regions_set_def)

definition P_0x3e64 :: state_pred where
  \<open>P_0x3e64 \<sigma> \<equiv> RIP \<sigma> = 0x3e64 \<and> RAX \<sigma> = fwrite_0x3e4d_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e52\<close>
declare P_0x3e64_def[Ps]

definition P_0x3e64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3e64_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xc0), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xc8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xd0), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xd4), 4),
    (13, ((RSP\<^sub>0::64 word) - 0xd8), 4),
    (14, ((RSP\<^sub>0::64 word) - 0xe0), 8)
  }\<close>

definition P_0x3e64_regions :: state_pred where
  \<open>P_0x3e64_regions \<sigma> \<equiv> \<exists>regions. P_0x3e64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_vfprintf_chk_addr_0x3e64 :: state_pred where
  \<open>Q_vfprintf_chk_addr_0x3e64 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xe0) \<and> RIP \<sigma> = vfprintf_chk_addr \<and> RAX \<sigma> = fwrite_0x3e4d_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e69\<close>
declare Q_vfprintf_chk_addr_0x3e64_def[Qs]

schematic_goal error_0_1_0x3e64_0x3e64[blocks]:
  assumes \<open>(P_0x3e64 && P_0x3e64_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3e64 0x3e64 None \<sigma> \<triangleq> ?\<sigma> \<and> Q_vfprintf_chk_addr_0x3e64 ?\<sigma> \<and> block_usage P_0x3e64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3e64_def P_0x3e64_regions_def post: Q_vfprintf_chk_addr_0x3e64_def regionset: P_0x3e64_regions_set_def)

definition P_0x3e69 :: state_pred where
  \<open>P_0x3e69 \<sigma> \<equiv> RIP \<sigma> = 0x3e69 \<and> RAX \<sigma> = vfprintf_chk_0x3e64_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e69\<close>
declare P_0x3e69_def[Ps]

definition P_0x3e69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3e69_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xc0), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xc8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xd0), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xd4), 4),
    (13, ((RSP\<^sub>0::64 word) - 0xd8), 4),
    (14, ((RSP\<^sub>0::64 word) - 0xe0), 8)
  }\<close>

definition P_0x3e69_regions :: state_pred where
  \<open>P_0x3e69_regions \<sigma> \<equiv> \<exists>regions. P_0x3e69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3e75 :: state_pred where
  \<open>Q_0x3e75 \<sigma> \<equiv> RIP \<sigma> = 0x3e75 \<and> RAX \<sigma> = vfprintf_chk_0x3e64_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0xa \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e69\<close>
declare Q_0x3e75_def[Qs]

schematic_goal error_0_2_0x3e69_0x3e70[blocks]:
  assumes \<open>(P_0x3e69 && P_0x3e69_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x3e69 0x3e70 None \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3e75 ?\<sigma> \<and> block_usage P_0x3e69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3e69_def P_0x3e69_regions_def post: Q_0x3e75_def regionset: P_0x3e69_regions_set_def)

definition P_0x3e75 :: state_pred where
  \<open>P_0x3e75 \<sigma> \<equiv> RIP \<sigma> = 0x3e75 \<and> RAX \<sigma> = vfprintf_chk_0x3e64_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0xa \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e69\<close>
declare P_0x3e75_def[Ps]

definition P_0x3e75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3e75_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xc0), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xc8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xd0), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xd4), 4),
    (13, ((RSP\<^sub>0::64 word) - 0xd8), 4),
    (14, ((RSP\<^sub>0::64 word) - 0xe0), 8)
  }\<close>

definition P_0x3e75_regions :: state_pred where
  \<open>P_0x3e75_regions \<sigma> \<equiv> \<exists>regions. P_0x3e75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fputc_addr_0x3e75 :: state_pred where
  \<open>Q_fputc_addr_0x3e75 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xe0) \<and> RIP \<sigma> = fputc_addr \<and> RAX \<sigma> = vfprintf_chk_0x3e64_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0xa \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e7a\<close>
declare Q_fputc_addr_0x3e75_def[Qs]

schematic_goal error_0_1_0x3e75_0x3e75[blocks]:
  assumes \<open>(P_0x3e75 && P_0x3e75_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3e75 0x3e75 None \<sigma> \<triangleq> ?\<sigma> \<and> Q_fputc_addr_0x3e75 ?\<sigma> \<and> block_usage P_0x3e75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3e75_def P_0x3e75_regions_def post: Q_fputc_addr_0x3e75_def regionset: P_0x3e75_regions_set_def)

definition P_0x3e7a :: state_pred where
  \<open>P_0x3e7a \<sigma> \<equiv> RIP \<sigma> = 0x3e7a \<and> RAX \<sigma> = fputc_0x3e75_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0xa \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e7a\<close>
declare P_0x3e7a_def[Ps]

definition P_0x3e7a_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3e7a_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xc0), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xc8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xd0), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xd4), 4),
    (13, ((RSP\<^sub>0::64 word) - 0xd8), 4),
    (14, ((RSP\<^sub>0::64 word) - 0xe0), 8)
  }\<close>

definition P_0x3e7a_regions :: state_pred where
  \<open>P_0x3e7a_regions \<sigma> \<equiv> \<exists>regions. P_0x3e7a_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3e7f :: state_pred where
  \<open>Q_0x3e7f \<sigma> \<equiv> RIP \<sigma> = 0x3e7f \<and> RAX \<sigma> = fputc_0x3e75_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e7a\<close>
declare Q_0x3e7f_def[Qs]

schematic_goal error_0_1_0x3e7a_0x3e7a[blocks]:
  assumes \<open>(P_0x3e7a && P_0x3e7a_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3e7a 0x3e7a None \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3e7f ?\<sigma> \<and> block_usage P_0x3e7a_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3e7a_def P_0x3e7a_regions_def post: Q_0x3e7f_def regionset: P_0x3e7a_regions_set_def)

definition P_0x3e7f :: state_pred where
  \<open>P_0x3e7f \<sigma> \<equiv> RIP \<sigma> = 0x3e7f \<and> RAX \<sigma> = fputc_0x3e75_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e7a\<close>
declare P_0x3e7f_def[Ps]

definition P_0x3e7f_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3e7f_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (6, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (7, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xc0), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xc8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xd0), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xd4), 4),
    (13, ((RSP\<^sub>0::64 word) - 0xd8), 4),
    (14, ((RSP\<^sub>0::64 word) - 0xe0), 8)
  }\<close>

definition P_0x3e7f_regions :: state_pred where
  \<open>P_0x3e7f_regions \<sigma> \<equiv> \<exists>regions. P_0x3e7f_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_exit_addr_0x3e7f :: state_pred where
  \<open>Q_exit_addr_0x3e7f \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xe0) \<and> RIP \<sigma> = exit_addr \<and> RAX \<sigma> = fputc_0x3e75_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0xd8) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> regs \<sigma> ymm6w1 = ymm6w1\<^sub>0 \<and> regs \<sigma> ymm6w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm7w1 = ymm7w1\<^sub>0 \<and> regs \<sigma> ymm7w0 = ymm7w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc0),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc8),8]::64 word) = ((RSP\<^sub>0::64 word) - 0xb8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd0),8]::64 word) = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd4),4]::32 word) = 0x30 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xd8),4]::32 word) = 0x8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xe0),8]::64 word) = 0x3e84\<close>
declare Q_exit_addr_0x3e7f_def[Qs]

schematic_goal error_0_1_0x3e7f_0x3e7f[blocks]:
  assumes \<open>(P_0x3e7f && P_0x3e7f_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3e7f 0x3e7f None \<sigma> \<triangleq> ?\<sigma> \<and> Q_exit_addr_0x3e7f ?\<sigma> \<and> block_usage P_0x3e7f_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3e7f_def P_0x3e7f_regions_def post: Q_exit_addr_0x3e7f_def regionset: P_0x3e7f_regions_set_def)

definition error_acode :: ACode where
  \<open>error_acode =
    Block 9 0x3da0 0x3dc4 None;
    IF ZF THEN
      Block (Suc 0) 0x3dc6 0x3dc6 (Some True)
    ELSE
      Block 9 0x3dc6 0x3df7 (Some False)
    FI;
    Block 13 0x3dff 0x3e48 None;
    Block (Suc 0) 0x3e4d 0x3e4d None;
    CALL fwrite_acode;
    Block 4 0x3e52 0x3e5d None;
    Block (Suc 0) 0x3e64 0x3e64 None;
    CALL vfprintf_chk_acode;
    Block 2 0x3e69 0x3e70 None;
    Block (Suc 0) 0x3e75 0x3e75 None;
    CALL fputc_acode;
    Block (Suc 0) 0x3e7a 0x3e7a None;
    Block (Suc 0) 0x3e7f 0x3e7f None;
    CALL exit_acode
  \<close>

schematic_goal "error":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3dc6 \<longrightarrow> P_0x3dc6_true_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3dc6 \<longrightarrow> P_0x3dc6_false_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3dff \<longrightarrow> P_0x3dff_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3e4d \<longrightarrow> P_0x3e4d_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3e52 \<longrightarrow> P_0x3e52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3e64 \<longrightarrow> P_0x3e64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3e69 \<longrightarrow> P_0x3e69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3e75 \<longrightarrow> P_0x3e75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3e7a \<longrightarrow> P_0x3e7a_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3e7f \<longrightarrow> P_0x3e7f_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_fwrite_addr_0x3e4d}} \<box>fwrite_acode {{P_0x3e52;M_0x3e4d}}\<close>
    and [blocks]: \<open>{{Q_vfprintf_chk_addr_0x3e64}} \<box>vfprintf_chk_acode {{P_0x3e69;M_0x3e64}}\<close>
    and [blocks]: \<open>{{Q_fputc_addr_0x3e75}} \<box>fputc_acode {{P_0x3e7a;M_0x3e75}}\<close>
    and [blocks]: \<open>{{Q_exit_addr_0x3e7f}} \<box>exit_acode {{Q_fail;M_0x3e7f}}\<close>
  shows \<open>{{?P}} error_acode {{?Q;?M}}\<close>
  by (vcg acode: error_acode_def assms: assms)

end
end