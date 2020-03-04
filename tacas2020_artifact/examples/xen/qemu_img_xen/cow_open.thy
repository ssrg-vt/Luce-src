theory cow_open
  imports
    "../../../isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes open64_0x5e62_retval\<^sub>v qemu_read_ok_0x5e84_retval\<^sub>v pstrcpy_0x5edf_retval\<^sub>v get_mmap_addr_0x5f02_retval\<^sub>v mmap64_0x5f1d_retval\<^sub>v open64_0x5f77_retval\<^sub>v close_0x5f93_retval\<^sub>v stack_chk_fail_0x5f9f_retval\<^sub>v stack_chk_fail_addr close_addr get_mmap_addr_addr mmap64_addr open64_addr pstrcpy_addr qemu_read_ok_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode close_acode get_mmap_addr_acode mmap64_acode open64_acode pstrcpy_acode qemu_read_ok_acode :: ACode
  assumes fetch:
    "fetch 0x5e30 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5e32 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5e35 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 2)), 5)"
    "fetch 0x5e3a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5e3c \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5e3d \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5e3e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5e41 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 1080)), 7)"
    "fetch 0x5e48 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x5e4c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x5e4f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x5e58 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 1064)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x5e60 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5e62 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''open64'')), 5)"
    "fetch 0x5e67 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x5e6a \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5e6c \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 24432)), 6)"
    "fetch 0x5e72 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General ThirtyTwo r12))), 4)"
    "fetch 0x5e76 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x5e79 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1056)), 5)"
    "fetch 0x5e7e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x5e81 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x5e84 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_read_ok'')), 5)"
    "fetch 0x5e89 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5e8b \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 24464)), 6)"
    "fetch 0x5e91 \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rsp)))) (Immediate SixtyFour (ImmVal 1297043279)), 7)"
    "fetch 0x5e98 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 24464)), 6)"
    "fetch 0x5e9e \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 4)))) (Immediate SixtyFour (ImmVal 33554432)), 8)"
    "fetch 0x5ea6 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 24464)), 6)"
    "fetch 0x5eac \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 8)))), 4)"
    "fetch 0x5eb0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 1040))))), 8)"
    "fetch 0x5eb8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1024)), 5)"
    "fetch 0x5ebd \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1096)))), 7)"
    "fetch 0x5ec4 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5ec7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5eca \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 511)))), 7)"
    "fetch 0x5ed1 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5ed4 \<equiv> (Binary (IS_PentiumPro Cmovns) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x5ed8 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x5edc \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rbx)))) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5edf \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''pstrcpy'')), 5)"
    "fetch 0x5ee4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rbx))))), 3)"
    "fetch 0x5ee7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0))))), 4)"
    "fetch 0x5eeb \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 7)), 4)"
    "fetch 0x5eef \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x5ef3 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 1056)), 6)"
    "fetch 0x5ef9 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 24)))) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x5efc \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rbx)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x5eff \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x5f02 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''get_mmap_addr'')), 5)"
    "fetch 0x5f07 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0x5f0a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x5f0d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x5f12 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 3)), 5)"
    "fetch 0x5f17 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x5f1a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5f1d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''mmap64'')), 5)"
    "fetch 0x5f22 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x5f26 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 18446744073709551615)), 4)"
    "fetch 0x5f2a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 24464)), 2)"
    "fetch 0x5f2c \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1056)), 6)"
    "fetch 0x5f32 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x5f36 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 24))))), 3)"
    "fetch 0x5f39 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 511)), 5)"
    "fetch 0x5f3e \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294966784)), 5)"
    "fetch 0x5f43 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x5f45 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 32)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x5f49 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5f4b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 1064))))), 8)"
    "fetch 0x5f53 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x5f5c \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 24479)), 2)"
    "fetch 0x5f5e \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 1080)), 7)"
    "fetch 0x5f65 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5f66 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5f67 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5f69 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5f6b \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5f6c \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x5f70 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x5f72 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x5f75 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5f77 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''open64'')), 5)"
    "fetch 0x5f7c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x5f7f \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5f81 \<equiv> (Unary (IS_8088 Jns) (Immediate SixtyFour (ImmVal 24178)), 6)"
    "fetch 0x5f87 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x5f8c \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 24395)), 2)"
    "fetch 0x5f8e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x5f90 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x5f93 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''close'')), 5)"
    "fetch 0x5f98 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x5f9d \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 24395)), 2)"
    "fetch 0x5f9f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x5fa4 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and close\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''close'') = close_addr\<close>
    and get_mmap_addr\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''get_mmap_addr'') = get_mmap_addr_addr\<close>
    and mmap64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''mmap64'') = mmap64_addr\<close>
    and open64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''open64'') = open64_addr\<close>
    and pstrcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''pstrcpy'') = pstrcpy_addr\<close>
    and qemu_read_ok\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_read_ok'') = qemu_read_ok_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>open64_0x5e62_retval \<equiv> open64_0x5e62_retval\<^sub>v\<close>
definition \<open>qemu_read_ok_0x5e84_retval \<equiv> qemu_read_ok_0x5e84_retval\<^sub>v\<close>
definition \<open>pstrcpy_0x5edf_retval \<equiv> pstrcpy_0x5edf_retval\<^sub>v\<close>
definition \<open>get_mmap_addr_0x5f02_retval \<equiv> get_mmap_addr_0x5f02_retval\<^sub>v\<close>
definition \<open>mmap64_0x5f1d_retval \<equiv> mmap64_0x5f1d_retval\<^sub>v\<close>
definition \<open>open64_0x5f77_retval \<equiv> open64_0x5f77_retval\<^sub>v\<close>
definition \<open>close_0x5f93_retval \<equiv> close_0x5f93_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x5f9f_retval \<equiv> stack_chk_fail_0x5f9f_retval\<^sub>v\<close>

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
  auto simp: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

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

locale "cow_open" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5e30_0 :: state_pred where
  \<open>P_0x5e30_0 \<sigma> \<equiv> RIP \<sigma> = 0x5e30 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5e30_0_def[Ps]

definition P_0x5e30_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e30_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5e30_0_regions :: state_pred where
  \<open>P_0x5e30_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5e30_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e62_0 :: state_pred where
  \<open>Q_0x5e62_0 \<sigma> \<equiv> RIP \<sigma> = 0x5e62 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5e62_0_def[Qs]

schematic_goal cow_open_0_13_0x5e30_0x5e60_0[blocks]:
  assumes \<open>(P_0x5e30_0 && P_0x5e30_0_regions) \<sigma>\<close>
  shows \<open>exec_block 13 0x5e60 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e62_0 ?\<sigma> \<and> block_usage P_0x5e30_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e30_0_def P_0x5e30_0_regions_def post: Q_0x5e62_0_def regionset: P_0x5e30_0_regions_set_def)

definition P_0x5e62_1 :: state_pred where
  \<open>P_0x5e62_1 \<sigma> \<equiv> RIP \<sigma> = 0x5e62 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x5e62_1_def[Ps]

definition P_0x5e62_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e62_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e62_1_regions :: state_pred where
  \<open>P_0x5e62_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5e62_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_open64_addr_0x5e62_1 :: state_pred where
  \<open>Q_open64_addr_0x5e62_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = open64_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e67\<close>
declare Q_open64_addr_0x5e62_1_def[Qs]

schematic_goal cow_open_0_1_0x5e62_0x5e62_1[blocks]:
  assumes \<open>(P_0x5e62_1 && P_0x5e62_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5e62 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_open64_addr_0x5e62_1 ?\<sigma> \<and> block_usage P_0x5e62_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e62_1_def P_0x5e62_1_regions_def post: Q_open64_addr_0x5e62_1_def regionset: P_0x5e62_1_regions_set_def)

definition P_0x5e67_2 :: state_pred where
  \<open>P_0x5e67_2 \<sigma> \<equiv> RIP \<sigma> = 0x5e67 \<and> RAX \<sigma> = open64_0x5e62_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e67\<close>
declare P_0x5e67_2_def[Ps]

definition P_0x5e67_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e67_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e67_2_regions :: state_pred where
  \<open>P_0x5e67_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5e67_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e6c_2 :: state_pred where
  \<open>Q_0x5e6c_2 \<sigma> \<equiv> RIP \<sigma> = 0x5e6c \<and> RAX \<sigma> = open64_0x5e62_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e67\<close>
declare Q_0x5e6c_2_def[Qs]

schematic_goal cow_open_0_2_0x5e67_0x5e6a_2[blocks]:
  assumes \<open>(P_0x5e67_2 && P_0x5e67_2_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5e6a 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e6c_2 ?\<sigma> \<and> block_usage P_0x5e67_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e67_2_def P_0x5e67_2_regions_def post: Q_0x5e6c_2_def regionset: P_0x5e67_2_regions_set_def)

definition P_0x5e6c_true_3 :: state_pred where
  \<open>P_0x5e6c_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x5e6c \<and> RAX \<sigma> = open64_0x5e62_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e67\<close>
declare P_0x5e6c_true_3_def[Ps]

definition P_0x5e6c_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e6c_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e6c_true_3_regions :: state_pred where
  \<open>P_0x5e6c_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x5e6c_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f77_3 :: state_pred where
  \<open>Q_0x5f77_3 \<sigma> \<equiv> RIP \<sigma> = 0x5f77 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e67\<close>
declare Q_0x5f77_3_def[Qs]

schematic_goal cow_open_0_4_0x5e6c_0x5f75_3[blocks]:
  assumes \<open>(P_0x5e6c_true_3 && P_0x5e6c_true_3_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x5f75 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f77_3 ?\<sigma> \<and> block_usage P_0x5e6c_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e6c_true_3_def P_0x5e6c_true_3_regions_def post: Q_0x5f77_3_def regionset: P_0x5e6c_true_3_regions_set_def)

definition P_0x5f77_4 :: state_pred where
  \<open>P_0x5f77_4 \<sigma> \<equiv> RIP \<sigma> = 0x5f77 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e67\<close>
declare P_0x5f77_4_def[Ps]

definition P_0x5f77_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f77_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f77_4_regions :: state_pred where
  \<open>P_0x5f77_4_regions \<sigma> \<equiv> \<exists>regions. P_0x5f77_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_open64_addr_0x5f77_4 :: state_pred where
  \<open>Q_open64_addr_0x5f77_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = open64_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f7c\<close>
declare Q_open64_addr_0x5f77_4_def[Qs]

schematic_goal cow_open_0_1_0x5f77_0x5f77_4[blocks]:
  assumes \<open>(P_0x5f77_4 && P_0x5f77_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f77 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_open64_addr_0x5f77_4 ?\<sigma> \<and> block_usage P_0x5f77_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f77_4_def P_0x5f77_4_regions_def post: Q_open64_addr_0x5f77_4_def regionset: P_0x5f77_4_regions_set_def)

definition P_0x5f7c_5 :: state_pred where
  \<open>P_0x5f7c_5 \<sigma> \<equiv> RIP \<sigma> = 0x5f7c \<and> RAX \<sigma> = open64_0x5f77_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f7c\<close>
declare P_0x5f7c_5_def[Ps]

definition P_0x5f7c_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f7c_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f7c_5_regions :: state_pred where
  \<open>P_0x5f7c_5_regions \<sigma> \<equiv> \<exists>regions. P_0x5f7c_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f81_5 :: state_pred where
  \<open>Q_0x5f81_5 \<sigma> \<equiv> RIP \<sigma> = 0x5f81 \<and> RAX \<sigma> = open64_0x5f77_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f7c\<close>
declare Q_0x5f81_5_def[Qs]

schematic_goal cow_open_0_2_0x5f7c_0x5f7f_5[blocks]:
  assumes \<open>(P_0x5f7c_5 && P_0x5f7c_5_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f7f 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f81_5 ?\<sigma> \<and> block_usage P_0x5f7c_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f7c_5_def P_0x5f7c_5_regions_def post: Q_0x5f81_5_def regionset: P_0x5f7c_5_regions_set_def)

definition P_0x5f81_true_6 :: state_pred where
  \<open>P_0x5f81_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x5f81 \<and> RAX \<sigma> = open64_0x5f77_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f7c\<close>
declare P_0x5f81_true_6_def[Ps]

definition P_0x5f81_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f81_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f81_true_6_regions :: state_pred where
  \<open>P_0x5f81_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x5f81_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e84_6 :: state_pred where
  \<open>Q_0x5e84_6 \<sigma> \<equiv> RIP \<sigma> = 0x5e84 \<and> RAX \<sigma> = open64_0x5f77_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f7c\<close>
declare Q_0x5e84_6_def[Qs]

schematic_goal cow_open_0_6_0x5f81_0x5e81_6[blocks]:
  assumes \<open>(P_0x5f81_true_6 && P_0x5f81_true_6_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 6 0x5e81 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e84_6 ?\<sigma> \<and> block_usage P_0x5f81_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f81_true_6_def P_0x5f81_true_6_regions_def post: Q_0x5e84_6_def regionset: P_0x5f81_true_6_regions_set_def)

definition P_0x5e84_7 :: state_pred where
  \<open>P_0x5e84_7 \<sigma> \<equiv> RIP \<sigma> = 0x5e84 \<and> RAX \<sigma> = open64_0x5f77_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f7c\<close>
declare P_0x5e84_7_def[Ps]

definition P_0x5e84_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e84_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e84_7_regions :: state_pred where
  \<open>P_0x5e84_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5e84_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_read_ok_addr_0x5e84_7 :: state_pred where
  \<open>Q_qemu_read_ok_addr_0x5e84_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = qemu_read_ok_addr \<and> RAX \<sigma> = open64_0x5f77_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_qemu_read_ok_addr_0x5e84_7_def[Qs]

schematic_goal cow_open_0_1_0x5e84_0x5e84_7[blocks]:
  assumes \<open>(P_0x5e84_7 && P_0x5e84_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5e84 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_read_ok_addr_0x5e84_7 ?\<sigma> \<and> block_usage P_0x5e84_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e84_7_def P_0x5e84_7_regions_def post: Q_qemu_read_ok_addr_0x5e84_7_def regionset: P_0x5e84_7_regions_set_def)

definition P_0x5e89_8 :: state_pred where
  \<open>P_0x5e89_8 \<sigma> \<equiv> RIP \<sigma> = 0x5e89 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5e89_8_def[Ps]

definition P_0x5e89_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e89_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e89_8_regions :: state_pred where
  \<open>P_0x5e89_8_regions \<sigma> \<equiv> \<exists>regions. P_0x5e89_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e8b_8 :: state_pred where
  \<open>Q_0x5e8b_8 \<sigma> \<equiv> RIP \<sigma> = 0x5e8b \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5e8b_8_def[Qs]

schematic_goal cow_open_0_1_0x5e89_0x5e89_8[blocks]:
  assumes \<open>(P_0x5e89_8 && P_0x5e89_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5e89 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e8b_8 ?\<sigma> \<and> block_usage P_0x5e89_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e89_8_def P_0x5e89_8_regions_def post: Q_0x5e8b_8_def regionset: P_0x5e89_8_regions_set_def)

definition P_0x5e8b_true_9 :: state_pred where
  \<open>P_0x5e8b_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x5e8b \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5e8b_true_9_def[Ps]

definition P_0x5e8b_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e8b_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e8b_true_9_regions :: state_pred where
  \<open>P_0x5e8b_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5e8b_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f93_9 :: state_pred where
  \<open>Q_0x5f93_9 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5f93_9_def[Qs]

schematic_goal cow_open_0_2_0x5e8b_0x5f90_9[blocks]:
  assumes \<open>(P_0x5e8b_true_9 && P_0x5e8b_true_9_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f90 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f93_9 ?\<sigma> \<and> block_usage P_0x5e8b_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e8b_true_9_def P_0x5e8b_true_9_regions_def post: Q_0x5f93_9_def regionset: P_0x5e8b_true_9_regions_set_def)

definition P_0x5f93_10 :: state_pred where
  \<open>P_0x5f93_10 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5f93_10_def[Ps]

definition P_0x5f93_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f93_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f93_10_regions :: state_pred where
  \<open>P_0x5f93_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5f93_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x5f93_10 :: state_pred where
  \<open>Q_close_addr_0x5f93_10 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare Q_close_addr_0x5f93_10_def[Qs]

schematic_goal cow_open_0_1_0x5f93_0x5f93_10[blocks]:
  assumes \<open>(P_0x5f93_10 && P_0x5f93_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f93 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x5f93_10 ?\<sigma> \<and> block_usage P_0x5f93_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f93_10_def P_0x5f93_10_regions_def post: Q_close_addr_0x5f93_10_def regionset: P_0x5f93_10_regions_set_def)

definition P_0x5f98_11 :: state_pred where
  \<open>P_0x5f98_11 \<sigma> \<equiv> RIP \<sigma> = 0x5f98 \<and> RAX \<sigma> = close_0x5f93_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare P_0x5f98_11_def[Ps]

definition P_0x5f98_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f98_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f98_11_regions :: state_pred where
  \<open>P_0x5f98_11_regions \<sigma> \<equiv> \<exists>regions. P_0x5f98_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_11 :: state_pred where
  \<open>Q_0x5f4b_11 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_11_def[Qs]

schematic_goal cow_open_0_2_0x5f98_0x5f9d_11[blocks]:
  assumes \<open>(P_0x5f98_11 && P_0x5f98_11_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f9d 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_11 ?\<sigma> \<and> block_usage P_0x5f98_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f98_11_def P_0x5f98_11_regions_def post: Q_0x5f4b_11_def regionset: P_0x5f98_11_regions_set_def)

definition P_0x5e8b_false_12 :: state_pred where
  \<open>P_0x5e8b_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x5e8b \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5e8b_false_12_def[Ps]

definition P_0x5e8b_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e8b_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e8b_false_12_regions :: state_pred where
  \<open>P_0x5e8b_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x5e8b_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e98_12 :: state_pred where
  \<open>Q_0x5e98_12 \<sigma> \<equiv> RIP \<sigma> = 0x5e98 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5e98_12_def[Qs]

schematic_goal cow_open_0_2_0x5e8b_0x5e91_12[blocks]:
  assumes \<open>(P_0x5e8b_false_12 && P_0x5e8b_false_12_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5e91 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e98_12 ?\<sigma> \<and> block_usage P_0x5e8b_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e8b_false_12_def P_0x5e8b_false_12_regions_def post: Q_0x5e98_12_def regionset: P_0x5e8b_false_12_regions_set_def)

definition P_0x5e98_true_13 :: state_pred where
  \<open>P_0x5e98_true_13 \<sigma> \<equiv> RIP \<sigma> = 0x5e98 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5e98_true_13_def[Ps]

definition P_0x5e98_true_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e98_true_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e98_true_13_regions :: state_pred where
  \<open>P_0x5e98_true_13_regions \<sigma> \<equiv> \<exists>regions. P_0x5e98_true_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f93_13 :: state_pred where
  \<open>Q_0x5f93_13 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5f93_13_def[Qs]

schematic_goal cow_open_0_2_0x5e98_0x5f90_13[blocks]:
  assumes \<open>(P_0x5e98_true_13 && P_0x5e98_true_13_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f90 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f93_13 ?\<sigma> \<and> block_usage P_0x5e98_true_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e98_true_13_def P_0x5e98_true_13_regions_def post: Q_0x5f93_13_def regionset: P_0x5e98_true_13_regions_set_def)

definition P_0x5f93_14 :: state_pred where
  \<open>P_0x5f93_14 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5f93_14_def[Ps]

definition P_0x5f93_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f93_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f93_14_regions :: state_pred where
  \<open>P_0x5f93_14_regions \<sigma> \<equiv> \<exists>regions. P_0x5f93_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x5f93_14 :: state_pred where
  \<open>Q_close_addr_0x5f93_14 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare Q_close_addr_0x5f93_14_def[Qs]

schematic_goal cow_open_0_1_0x5f93_0x5f93_14[blocks]:
  assumes \<open>(P_0x5f93_14 && P_0x5f93_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f93 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x5f93_14 ?\<sigma> \<and> block_usage P_0x5f93_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f93_14_def P_0x5f93_14_regions_def post: Q_close_addr_0x5f93_14_def regionset: P_0x5f93_14_regions_set_def)

definition P_0x5f98_15 :: state_pred where
  \<open>P_0x5f98_15 \<sigma> \<equiv> RIP \<sigma> = 0x5f98 \<and> RAX \<sigma> = close_0x5f93_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare P_0x5f98_15_def[Ps]

definition P_0x5f98_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f98_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f98_15_regions :: state_pred where
  \<open>P_0x5f98_15_regions \<sigma> \<equiv> \<exists>regions. P_0x5f98_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_15 :: state_pred where
  \<open>Q_0x5f4b_15 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_15_def[Qs]

schematic_goal cow_open_0_2_0x5f98_0x5f9d_15[blocks]:
  assumes \<open>(P_0x5f98_15 && P_0x5f98_15_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f9d 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_15 ?\<sigma> \<and> block_usage P_0x5f98_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f98_15_def P_0x5f98_15_regions_def post: Q_0x5f4b_15_def regionset: P_0x5f98_15_regions_set_def)

definition P_0x5e98_false_16 :: state_pred where
  \<open>P_0x5e98_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x5e98 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5e98_false_16_def[Ps]

definition P_0x5e98_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e98_false_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e98_false_16_regions :: state_pred where
  \<open>P_0x5e98_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x5e98_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5ea6_16 :: state_pred where
  \<open>Q_0x5ea6_16 \<sigma> \<equiv> RIP \<sigma> = 0x5ea6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5ea6_16_def[Qs]

schematic_goal cow_open_0_2_0x5e98_0x5e9e_16[blocks]:
  assumes \<open>(P_0x5e98_false_16 && P_0x5e98_false_16_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5e9e 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5ea6_16 ?\<sigma> \<and> block_usage P_0x5e98_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e98_false_16_def P_0x5e98_false_16_regions_def post: Q_0x5ea6_16_def regionset: P_0x5e98_false_16_regions_set_def)

definition P_0x5ea6_true_17 :: state_pred where
  \<open>P_0x5ea6_true_17 \<sigma> \<equiv> RIP \<sigma> = 0x5ea6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5ea6_true_17_def[Ps]

definition P_0x5ea6_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5ea6_true_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5ea6_true_17_regions :: state_pred where
  \<open>P_0x5ea6_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0x5ea6_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f93_17 :: state_pred where
  \<open>Q_0x5f93_17 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5f93_17_def[Qs]

schematic_goal cow_open_0_2_0x5ea6_0x5f90_17[blocks]:
  assumes \<open>(P_0x5ea6_true_17 && P_0x5ea6_true_17_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f90 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f93_17 ?\<sigma> \<and> block_usage P_0x5ea6_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5ea6_true_17_def P_0x5ea6_true_17_regions_def post: Q_0x5f93_17_def regionset: P_0x5ea6_true_17_regions_set_def)

definition P_0x5f93_18 :: state_pred where
  \<open>P_0x5f93_18 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5f93_18_def[Ps]

definition P_0x5f93_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f93_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f93_18_regions :: state_pred where
  \<open>P_0x5f93_18_regions \<sigma> \<equiv> \<exists>regions. P_0x5f93_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x5f93_18 :: state_pred where
  \<open>Q_close_addr_0x5f93_18 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare Q_close_addr_0x5f93_18_def[Qs]

schematic_goal cow_open_0_1_0x5f93_0x5f93_18[blocks]:
  assumes \<open>(P_0x5f93_18 && P_0x5f93_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f93 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x5f93_18 ?\<sigma> \<and> block_usage P_0x5f93_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f93_18_def P_0x5f93_18_regions_def post: Q_close_addr_0x5f93_18_def regionset: P_0x5f93_18_regions_set_def)

definition P_0x5f98_19 :: state_pred where
  \<open>P_0x5f98_19 \<sigma> \<equiv> RIP \<sigma> = 0x5f98 \<and> RAX \<sigma> = close_0x5f93_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare P_0x5f98_19_def[Ps]

definition P_0x5f98_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f98_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f98_19_regions :: state_pred where
  \<open>P_0x5f98_19_regions \<sigma> \<equiv> \<exists>regions. P_0x5f98_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_19 :: state_pred where
  \<open>Q_0x5f4b_19 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_19_def[Qs]

schematic_goal cow_open_0_2_0x5f98_0x5f9d_19[blocks]:
  assumes \<open>(P_0x5f98_19 && P_0x5f98_19_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f9d 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_19 ?\<sigma> \<and> block_usage P_0x5f98_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f98_19_def P_0x5f98_19_regions_def post: Q_0x5f4b_19_def regionset: P_0x5f98_19_regions_set_def)

definition P_0x5ea6_false_20 :: state_pred where
  \<open>P_0x5ea6_false_20 \<sigma> \<equiv> RIP \<sigma> = 0x5ea6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5ea6_false_20_def[Ps]

definition P_0x5ea6_false_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5ea6_false_20_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5ea6_false_20_regions :: state_pred where
  \<open>P_0x5ea6_false_20_regions \<sigma> \<equiv> \<exists>regions. P_0x5ea6_false_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5edf_20 :: state_pred where
  \<open>Q_0x5edf_20 \<sigma> \<equiv> RIP \<sigma> = 0x5edf \<and> RAX \<sigma> = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x448) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5edf_20_def[Qs]

schematic_goal cow_open_0_12_0x5ea6_0x5edc_20[blocks]:
  assumes \<open>(P_0x5ea6_false_20 && P_0x5ea6_false_20_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 12 0x5edc 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5edf_20 ?\<sigma> \<and> block_usage P_0x5ea6_false_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5ea6_false_20_def P_0x5ea6_false_20_regions_def post: Q_0x5edf_20_def regionset: P_0x5ea6_false_20_regions_set_def)

definition P_0x5edf_21 :: state_pred where
  \<open>P_0x5edf_21 \<sigma> \<equiv> RIP \<sigma> = 0x5edf \<and> RAX \<sigma> = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x448) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5edf_21_def[Ps]

definition P_0x5edf_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5edf_21_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5edf_21_regions :: state_pred where
  \<open>P_0x5edf_21_regions \<sigma> \<equiv> \<exists>regions. P_0x5edf_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_pstrcpy_addr_0x5edf_21 :: state_pred where
  \<open>Q_pstrcpy_addr_0x5edf_21 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = pstrcpy_addr \<and> RAX \<sigma> = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x448) \<and> RSI \<sigma> = 0x400 \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5ee4\<close>
declare Q_pstrcpy_addr_0x5edf_21_def[Qs]

schematic_goal cow_open_0_1_0x5edf_0x5edf_21[blocks]:
  assumes \<open>(P_0x5edf_21 && P_0x5edf_21_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5edf 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_pstrcpy_addr_0x5edf_21 ?\<sigma> \<and> block_usage P_0x5edf_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5edf_21_def P_0x5edf_21_regions_def post: Q_pstrcpy_addr_0x5edf_21_def regionset: P_0x5edf_21_regions_set_def)

definition P_0x5ee4_22 :: state_pred where
  \<open>P_0x5ee4_22 \<sigma> \<equiv> RIP \<sigma> = 0x5ee4 \<and> RAX \<sigma> = pstrcpy_0x5edf_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x448) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5ee4\<close>
declare P_0x5ee4_22_def[Ps]

definition P_0x5ee4_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5ee4_22_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5ee4_22_regions :: state_pred where
  \<open>P_0x5ee4_22_regions \<sigma> \<equiv> \<exists>regions. P_0x5ee4_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f02_22 :: state_pred where
  \<open>Q_0x5f02_22 \<sigma> \<equiv> RIP \<sigma> = 0x5f02 \<and> RAX \<sigma> = pstrcpy_0x5edf_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5ee4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5f02_22_def[Qs]

schematic_goal cow_open_0_8_0x5ee4_0x5eff_22[blocks]:
  assumes \<open>(P_0x5ee4_22 && P_0x5ee4_22_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x5eff 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f02_22 ?\<sigma> \<and> block_usage P_0x5ee4_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5ee4_22_def P_0x5ee4_22_regions_def post: Q_0x5f02_22_def regionset: P_0x5ee4_22_regions_set_def)

definition P_0x5f02_23 :: state_pred where
  \<open>P_0x5f02_23 \<sigma> \<equiv> RIP \<sigma> = 0x5f02 \<and> RAX \<sigma> = pstrcpy_0x5edf_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5ee4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f02_23_def[Ps]

definition P_0x5f02_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f02_23_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f02_23_regions :: state_pred where
  \<open>P_0x5f02_23_regions \<sigma> \<equiv> \<exists>regions. P_0x5f02_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_mmap_addr_addr_0x5f02_23 :: state_pred where
  \<open>Q_get_mmap_addr_addr_0x5f02_23 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = get_mmap_addr_addr \<and> RAX \<sigma> = pstrcpy_0x5edf_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSI \<sigma> = 0x400 \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f07 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_get_mmap_addr_addr_0x5f02_23_def[Qs]

schematic_goal cow_open_0_1_0x5f02_0x5f02_23[blocks]:
  assumes \<open>(P_0x5f02_23 && P_0x5f02_23_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f02 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_mmap_addr_addr_0x5f02_23 ?\<sigma> \<and> block_usage P_0x5f02_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f02_23_def P_0x5f02_23_regions_def post: Q_get_mmap_addr_addr_0x5f02_23_def regionset: P_0x5f02_23_regions_set_def)

definition P_0x5f07_24 :: state_pred where
  \<open>P_0x5f07_24 \<sigma> \<equiv> RIP \<sigma> = 0x5f07 \<and> RAX \<sigma> = get_mmap_addr_0x5f02_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f07 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f07_24_def[Ps]

definition P_0x5f07_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f07_24_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f07_24_regions :: state_pred where
  \<open>P_0x5f07_24_regions \<sigma> \<equiv> \<exists>regions. P_0x5f07_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f1d_24 :: state_pred where
  \<open>Q_0x5f1d_24 \<sigma> \<equiv> RIP \<sigma> = 0x5f1d \<and> RAX \<sigma> = get_mmap_addr_0x5f02_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f07 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5f1d_24_def[Qs]

schematic_goal cow_open_0_6_0x5f07_0x5f1a_24[blocks]:
  assumes \<open>(P_0x5f07_24 && P_0x5f07_24_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x5f1a 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f1d_24 ?\<sigma> \<and> block_usage P_0x5f07_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f07_24_def P_0x5f07_24_regions_def post: Q_0x5f1d_24_def regionset: P_0x5f07_24_regions_set_def)

definition P_0x5f1d_25 :: state_pred where
  \<open>P_0x5f1d_25 \<sigma> \<equiv> RIP \<sigma> = 0x5f1d \<and> RAX \<sigma> = get_mmap_addr_0x5f02_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f07 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f1d_25_def[Ps]

definition P_0x5f1d_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f1d_25_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f1d_25_regions :: state_pred where
  \<open>P_0x5f1d_25_regions \<sigma> \<equiv> \<exists>regions. P_0x5f1d_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_mmap64_addr_0x5f1d_25 :: state_pred where
  \<open>Q_mmap64_addr_0x5f1d_25 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = mmap64_addr \<and> RAX \<sigma> = get_mmap_addr_0x5f02_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_mmap64_addr_0x5f1d_25_def[Qs]

schematic_goal cow_open_0_1_0x5f1d_0x5f1d_25[blocks]:
  assumes \<open>(P_0x5f1d_25 && P_0x5f1d_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f1d 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_mmap64_addr_0x5f1d_25 ?\<sigma> \<and> block_usage P_0x5f1d_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f1d_25_def P_0x5f1d_25_regions_def post: Q_mmap64_addr_0x5f1d_25_def regionset: P_0x5f1d_25_regions_set_def)

definition P_0x5f22_26 :: state_pred where
  \<open>P_0x5f22_26 \<sigma> \<equiv> RIP \<sigma> = 0x5f22 \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f22_26_def[Ps]

definition P_0x5f22_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f22_26_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (15, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f22_26_regions :: state_pred where
  \<open>P_0x5f22_26_regions \<sigma> \<equiv> \<exists>regions. P_0x5f22_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f2a_26 :: state_pred where
  \<open>Q_0x5f2a_26 \<sigma> \<equiv> RIP \<sigma> = 0x5f2a \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5f2a_26_def[Qs]

schematic_goal cow_open_0_2_0x5f22_0x5f26_26[blocks]:
  assumes \<open>(P_0x5f22_26 && P_0x5f22_26_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f26 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f2a_26 ?\<sigma> \<and> block_usage P_0x5f22_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f22_26_def P_0x5f22_26_regions_def post: Q_0x5f2a_26_def regionset: P_0x5f22_26_regions_set_def)

definition P_0x5f2a_true_27 :: state_pred where
  \<open>P_0x5f2a_true_27 \<sigma> \<equiv> RIP \<sigma> = 0x5f2a \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f2a_true_27_def[Ps]

definition P_0x5f2a_true_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f2a_true_27_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f2a_true_27_regions :: state_pred where
  \<open>P_0x5f2a_true_27_regions \<sigma> \<equiv> \<exists>regions. P_0x5f2a_true_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f93_27 :: state_pred where
  \<open>Q_0x5f93_27 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5f93_27_def[Qs]

schematic_goal cow_open_0_2_0x5f2a_0x5f90_27[blocks]:
  assumes \<open>(P_0x5f2a_true_27 && P_0x5f2a_true_27_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f90 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f93_27 ?\<sigma> \<and> block_usage P_0x5f2a_true_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f2a_true_27_def P_0x5f2a_true_27_regions_def post: Q_0x5f93_27_def regionset: P_0x5f2a_true_27_regions_set_def)

definition P_0x5f93_28 :: state_pred where
  \<open>P_0x5f93_28 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f93_28_def[Ps]

definition P_0x5f93_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f93_28_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f93_28_regions :: state_pred where
  \<open>P_0x5f93_28_regions \<sigma> \<equiv> \<exists>regions. P_0x5f93_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x5f93_28 :: state_pred where
  \<open>Q_close_addr_0x5f93_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_close_addr_0x5f93_28_def[Qs]

schematic_goal cow_open_0_1_0x5f93_0x5f93_28[blocks]:
  assumes \<open>(P_0x5f93_28 && P_0x5f93_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f93 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x5f93_28 ?\<sigma> \<and> block_usage P_0x5f93_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f93_28_def P_0x5f93_28_regions_def post: Q_close_addr_0x5f93_28_def regionset: P_0x5f93_28_regions_set_def)

definition P_0x5f98_29 :: state_pred where
  \<open>P_0x5f98_29 \<sigma> \<equiv> RIP \<sigma> = 0x5f98 \<and> RAX \<sigma> = close_0x5f93_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f98_29_def[Ps]

definition P_0x5f98_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f98_29_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f98_29_regions :: state_pred where
  \<open>P_0x5f98_29_regions \<sigma> \<equiv> \<exists>regions. P_0x5f98_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_29 :: state_pred where
  \<open>Q_0x5f4b_29 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_29_def[Qs]

schematic_goal cow_open_0_2_0x5f98_0x5f9d_29[blocks]:
  assumes \<open>(P_0x5f98_29 && P_0x5f98_29_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f9d 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_29 ?\<sigma> \<and> block_usage P_0x5f98_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f98_29_def P_0x5f98_29_regions_def post: Q_0x5f4b_29_def regionset: P_0x5f98_29_regions_set_def)

definition P_0x5f2a_false_30 :: state_pred where
  \<open>P_0x5f2a_false_30 \<sigma> \<equiv> RIP \<sigma> = 0x5f2a \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f2a_false_30_def[Ps]

definition P_0x5f2a_false_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f2a_false_30_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f2a_false_30_regions :: state_pred where
  \<open>P_0x5f2a_false_30_regions \<sigma> \<equiv> \<exists>regions. P_0x5f2a_false_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_30 :: state_pred where
  \<open>Q_0x5f4b_30 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_30_def[Qs]

schematic_goal cow_open_0_9_0x5f2a_0x5f49_30[blocks]:
  assumes \<open>(P_0x5f2a_false_30 && P_0x5f2a_false_30_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x5f49 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_30 ?\<sigma> \<and> block_usage P_0x5f2a_false_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f2a_false_30_def P_0x5f2a_false_30_regions_def post: Q_0x5f4b_30_def regionset: P_0x5f2a_false_30_regions_set_def)

definition P_0x5f81_false_31 :: state_pred where
  \<open>P_0x5f81_false_31 \<sigma> \<equiv> RIP \<sigma> = 0x5f81 \<and> RAX \<sigma> = open64_0x5f77_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5f77_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f7c\<close>
declare P_0x5f81_false_31_def[Ps]

definition P_0x5f81_false_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f81_false_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f81_false_31_regions :: state_pred where
  \<open>P_0x5f81_false_31_regions \<sigma> \<equiv> \<exists>regions. P_0x5f81_false_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_31 :: state_pred where
  \<open>Q_0x5f4b_31 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_31_def[Qs]

schematic_goal cow_open_0_3_0x5f81_0x5f8c_31[blocks]:
  assumes \<open>(P_0x5f81_false_31 && P_0x5f81_false_31_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5f8c 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_31 ?\<sigma> \<and> block_usage P_0x5f81_false_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f81_false_31_def P_0x5f81_false_31_regions_def post: Q_0x5f4b_31_def regionset: P_0x5f81_false_31_regions_set_def)

definition P_0x5e6c_false_32 :: state_pred where
  \<open>P_0x5e6c_false_32 \<sigma> \<equiv> RIP \<sigma> = 0x5e6c \<and> RAX \<sigma> = open64_0x5e62_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e67\<close>
declare P_0x5e6c_false_32_def[Ps]

definition P_0x5e6c_false_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e6c_false_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5e6c_false_32_regions :: state_pred where
  \<open>P_0x5e6c_false_32_regions \<sigma> \<equiv> \<exists>regions. P_0x5e6c_false_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e84_32 :: state_pred where
  \<open>Q_0x5e84_32 \<sigma> \<equiv> RIP \<sigma> = 0x5e84 \<and> RAX \<sigma> = open64_0x5e62_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e67\<close>
declare Q_0x5e84_32_def[Qs]

schematic_goal cow_open_0_6_0x5e6c_0x5e81_32[blocks]:
  assumes \<open>(P_0x5e6c_false_32 && P_0x5e6c_false_32_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 6 0x5e81 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e84_32 ?\<sigma> \<and> block_usage P_0x5e6c_false_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e6c_false_32_def P_0x5e6c_false_32_regions_def post: Q_0x5e84_32_def regionset: P_0x5e6c_false_32_regions_set_def)

definition P_0x5e84_33 :: state_pred where
  \<open>P_0x5e84_33 \<sigma> \<equiv> RIP \<sigma> = 0x5e84 \<and> RAX \<sigma> = open64_0x5e62_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e67\<close>
declare P_0x5e84_33_def[Ps]

definition P_0x5e84_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e84_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e84_33_regions :: state_pred where
  \<open>P_0x5e84_33_regions \<sigma> \<equiv> \<exists>regions. P_0x5e84_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_read_ok_addr_0x5e84_33 :: state_pred where
  \<open>Q_qemu_read_ok_addr_0x5e84_33 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = qemu_read_ok_addr \<and> RAX \<sigma> = open64_0x5e62_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_qemu_read_ok_addr_0x5e84_33_def[Qs]

schematic_goal cow_open_0_1_0x5e84_0x5e84_33[blocks]:
  assumes \<open>(P_0x5e84_33 && P_0x5e84_33_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5e84 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_read_ok_addr_0x5e84_33 ?\<sigma> \<and> block_usage P_0x5e84_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e84_33_def P_0x5e84_33_regions_def post: Q_qemu_read_ok_addr_0x5e84_33_def regionset: P_0x5e84_33_regions_set_def)

definition P_0x5e89_34 :: state_pred where
  \<open>P_0x5e89_34 \<sigma> \<equiv> RIP \<sigma> = 0x5e89 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5e89_34_def[Ps]

definition P_0x5e89_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e89_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e89_34_regions :: state_pred where
  \<open>P_0x5e89_34_regions \<sigma> \<equiv> \<exists>regions. P_0x5e89_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e8b_34 :: state_pred where
  \<open>Q_0x5e8b_34 \<sigma> \<equiv> RIP \<sigma> = 0x5e8b \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5e8b_34_def[Qs]

schematic_goal cow_open_0_1_0x5e89_0x5e89_34[blocks]:
  assumes \<open>(P_0x5e89_34 && P_0x5e89_34_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5e89 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e8b_34 ?\<sigma> \<and> block_usage P_0x5e89_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e89_34_def P_0x5e89_34_regions_def post: Q_0x5e8b_34_def regionset: P_0x5e89_34_regions_set_def)

definition P_0x5e8b_true_35 :: state_pred where
  \<open>P_0x5e8b_true_35 \<sigma> \<equiv> RIP \<sigma> = 0x5e8b \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5e8b_true_35_def[Ps]

definition P_0x5e8b_true_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e8b_true_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e8b_true_35_regions :: state_pred where
  \<open>P_0x5e8b_true_35_regions \<sigma> \<equiv> \<exists>regions. P_0x5e8b_true_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f93_35 :: state_pred where
  \<open>Q_0x5f93_35 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5f93_35_def[Qs]

schematic_goal cow_open_0_2_0x5e8b_0x5f90_35[blocks]:
  assumes \<open>(P_0x5e8b_true_35 && P_0x5e8b_true_35_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f90 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f93_35 ?\<sigma> \<and> block_usage P_0x5e8b_true_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e8b_true_35_def P_0x5e8b_true_35_regions_def post: Q_0x5f93_35_def regionset: P_0x5e8b_true_35_regions_set_def)

definition P_0x5f93_36 :: state_pred where
  \<open>P_0x5f93_36 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5f93_36_def[Ps]

definition P_0x5f93_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f93_36_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f93_36_regions :: state_pred where
  \<open>P_0x5f93_36_regions \<sigma> \<equiv> \<exists>regions. P_0x5f93_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x5f93_36 :: state_pred where
  \<open>Q_close_addr_0x5f93_36 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare Q_close_addr_0x5f93_36_def[Qs]

schematic_goal cow_open_0_1_0x5f93_0x5f93_36[blocks]:
  assumes \<open>(P_0x5f93_36 && P_0x5f93_36_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f93 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x5f93_36 ?\<sigma> \<and> block_usage P_0x5f93_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f93_36_def P_0x5f93_36_regions_def post: Q_close_addr_0x5f93_36_def regionset: P_0x5f93_36_regions_set_def)

definition P_0x5f98_37 :: state_pred where
  \<open>P_0x5f98_37 \<sigma> \<equiv> RIP \<sigma> = 0x5f98 \<and> RAX \<sigma> = close_0x5f93_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare P_0x5f98_37_def[Ps]

definition P_0x5f98_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f98_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f98_37_regions :: state_pred where
  \<open>P_0x5f98_37_regions \<sigma> \<equiv> \<exists>regions. P_0x5f98_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_37 :: state_pred where
  \<open>Q_0x5f4b_37 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_37_def[Qs]

schematic_goal cow_open_0_2_0x5f98_0x5f9d_37[blocks]:
  assumes \<open>(P_0x5f98_37 && P_0x5f98_37_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f9d 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_37 ?\<sigma> \<and> block_usage P_0x5f98_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f98_37_def P_0x5f98_37_regions_def post: Q_0x5f4b_37_def regionset: P_0x5f98_37_regions_set_def)

definition P_0x5e8b_false_38 :: state_pred where
  \<open>P_0x5e8b_false_38 \<sigma> \<equiv> RIP \<sigma> = 0x5e8b \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5e8b_false_38_def[Ps]

definition P_0x5e8b_false_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e8b_false_38_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e8b_false_38_regions :: state_pred where
  \<open>P_0x5e8b_false_38_regions \<sigma> \<equiv> \<exists>regions. P_0x5e8b_false_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e98_38 :: state_pred where
  \<open>Q_0x5e98_38 \<sigma> \<equiv> RIP \<sigma> = 0x5e98 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5e98_38_def[Qs]

schematic_goal cow_open_0_2_0x5e8b_0x5e91_38[blocks]:
  assumes \<open>(P_0x5e8b_false_38 && P_0x5e8b_false_38_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5e91 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e98_38 ?\<sigma> \<and> block_usage P_0x5e8b_false_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e8b_false_38_def P_0x5e8b_false_38_regions_def post: Q_0x5e98_38_def regionset: P_0x5e8b_false_38_regions_set_def)

definition P_0x5e98_true_39 :: state_pred where
  \<open>P_0x5e98_true_39 \<sigma> \<equiv> RIP \<sigma> = 0x5e98 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5e98_true_39_def[Ps]

definition P_0x5e98_true_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e98_true_39_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e98_true_39_regions :: state_pred where
  \<open>P_0x5e98_true_39_regions \<sigma> \<equiv> \<exists>regions. P_0x5e98_true_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f93_39 :: state_pred where
  \<open>Q_0x5f93_39 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5f93_39_def[Qs]

schematic_goal cow_open_0_2_0x5e98_0x5f90_39[blocks]:
  assumes \<open>(P_0x5e98_true_39 && P_0x5e98_true_39_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f90 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f93_39 ?\<sigma> \<and> block_usage P_0x5e98_true_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e98_true_39_def P_0x5e98_true_39_regions_def post: Q_0x5f93_39_def regionset: P_0x5e98_true_39_regions_set_def)

definition P_0x5f93_40 :: state_pred where
  \<open>P_0x5f93_40 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5f93_40_def[Ps]

definition P_0x5f93_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f93_40_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f93_40_regions :: state_pred where
  \<open>P_0x5f93_40_regions \<sigma> \<equiv> \<exists>regions. P_0x5f93_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x5f93_40 :: state_pred where
  \<open>Q_close_addr_0x5f93_40 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare Q_close_addr_0x5f93_40_def[Qs]

schematic_goal cow_open_0_1_0x5f93_0x5f93_40[blocks]:
  assumes \<open>(P_0x5f93_40 && P_0x5f93_40_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f93 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x5f93_40 ?\<sigma> \<and> block_usage P_0x5f93_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f93_40_def P_0x5f93_40_regions_def post: Q_close_addr_0x5f93_40_def regionset: P_0x5f93_40_regions_set_def)

definition P_0x5f98_41 :: state_pred where
  \<open>P_0x5f98_41 \<sigma> \<equiv> RIP \<sigma> = 0x5f98 \<and> RAX \<sigma> = close_0x5f93_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare P_0x5f98_41_def[Ps]

definition P_0x5f98_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f98_41_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f98_41_regions :: state_pred where
  \<open>P_0x5f98_41_regions \<sigma> \<equiv> \<exists>regions. P_0x5f98_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_41 :: state_pred where
  \<open>Q_0x5f4b_41 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_41_def[Qs]

schematic_goal cow_open_0_2_0x5f98_0x5f9d_41[blocks]:
  assumes \<open>(P_0x5f98_41 && P_0x5f98_41_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f9d 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_41 ?\<sigma> \<and> block_usage P_0x5f98_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f98_41_def P_0x5f98_41_regions_def post: Q_0x5f4b_41_def regionset: P_0x5f98_41_regions_set_def)

definition P_0x5e98_false_42 :: state_pred where
  \<open>P_0x5e98_false_42 \<sigma> \<equiv> RIP \<sigma> = 0x5e98 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5e98_false_42_def[Ps]

definition P_0x5e98_false_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e98_false_42_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5e98_false_42_regions :: state_pred where
  \<open>P_0x5e98_false_42_regions \<sigma> \<equiv> \<exists>regions. P_0x5e98_false_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5ea6_42 :: state_pred where
  \<open>Q_0x5ea6_42 \<sigma> \<equiv> RIP \<sigma> = 0x5ea6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5ea6_42_def[Qs]

schematic_goal cow_open_0_2_0x5e98_0x5e9e_42[blocks]:
  assumes \<open>(P_0x5e98_false_42 && P_0x5e98_false_42_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5e9e 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5ea6_42 ?\<sigma> \<and> block_usage P_0x5e98_false_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e98_false_42_def P_0x5e98_false_42_regions_def post: Q_0x5ea6_42_def regionset: P_0x5e98_false_42_regions_set_def)

definition P_0x5ea6_true_43 :: state_pred where
  \<open>P_0x5ea6_true_43 \<sigma> \<equiv> RIP \<sigma> = 0x5ea6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5ea6_true_43_def[Ps]

definition P_0x5ea6_true_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5ea6_true_43_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5ea6_true_43_regions :: state_pred where
  \<open>P_0x5ea6_true_43_regions \<sigma> \<equiv> \<exists>regions. P_0x5ea6_true_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f93_43 :: state_pred where
  \<open>Q_0x5f93_43 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5f93_43_def[Qs]

schematic_goal cow_open_0_2_0x5ea6_0x5f90_43[blocks]:
  assumes \<open>(P_0x5ea6_true_43 && P_0x5ea6_true_43_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f90 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f93_43 ?\<sigma> \<and> block_usage P_0x5ea6_true_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5ea6_true_43_def P_0x5ea6_true_43_regions_def post: Q_0x5f93_43_def regionset: P_0x5ea6_true_43_regions_set_def)

definition P_0x5f93_44 :: state_pred where
  \<open>P_0x5f93_44 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5f93_44_def[Ps]

definition P_0x5f93_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f93_44_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f93_44_regions :: state_pred where
  \<open>P_0x5f93_44_regions \<sigma> \<equiv> \<exists>regions. P_0x5f93_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x5f93_44 :: state_pred where
  \<open>Q_close_addr_0x5f93_44 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare Q_close_addr_0x5f93_44_def[Qs]

schematic_goal cow_open_0_1_0x5f93_0x5f93_44[blocks]:
  assumes \<open>(P_0x5f93_44 && P_0x5f93_44_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f93 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x5f93_44 ?\<sigma> \<and> block_usage P_0x5f93_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f93_44_def P_0x5f93_44_regions_def post: Q_close_addr_0x5f93_44_def regionset: P_0x5f93_44_regions_set_def)

definition P_0x5f98_45 :: state_pred where
  \<open>P_0x5f98_45 \<sigma> \<equiv> RIP \<sigma> = 0x5f98 \<and> RAX \<sigma> = close_0x5f93_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98\<close>
declare P_0x5f98_45_def[Ps]

definition P_0x5f98_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f98_45_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f98_45_regions :: state_pred where
  \<open>P_0x5f98_45_regions \<sigma> \<equiv> \<exists>regions. P_0x5f98_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_45 :: state_pred where
  \<open>Q_0x5f4b_45 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_45_def[Qs]

schematic_goal cow_open_0_2_0x5f98_0x5f9d_45[blocks]:
  assumes \<open>(P_0x5f98_45 && P_0x5f98_45_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f9d 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_45 ?\<sigma> \<and> block_usage P_0x5f98_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f98_45_def P_0x5f98_45_regions_def post: Q_0x5f4b_45_def regionset: P_0x5f98_45_regions_set_def)

definition P_0x5ea6_false_46 :: state_pred where
  \<open>P_0x5ea6_false_46 \<sigma> \<equiv> RIP \<sigma> = 0x5ea6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x5e84_retval) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x420 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5ea6_false_46_def[Ps]

definition P_0x5ea6_false_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5ea6_false_46_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5ea6_false_46_regions :: state_pred where
  \<open>P_0x5ea6_false_46_regions \<sigma> \<equiv> \<exists>regions. P_0x5ea6_false_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5edf_46 :: state_pred where
  \<open>Q_0x5edf_46 \<sigma> \<equiv> RIP \<sigma> = 0x5edf \<and> RAX \<sigma> = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x448) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare Q_0x5edf_46_def[Qs]

schematic_goal cow_open_0_12_0x5ea6_0x5edc_46[blocks]:
  assumes \<open>(P_0x5ea6_false_46 && P_0x5ea6_false_46_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 12 0x5edc 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5edf_46 ?\<sigma> \<and> block_usage P_0x5ea6_false_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5ea6_false_46_def P_0x5ea6_false_46_regions_def post: Q_0x5edf_46_def regionset: P_0x5ea6_false_46_regions_set_def)

definition P_0x5edf_47 :: state_pred where
  \<open>P_0x5edf_47 \<sigma> \<equiv> RIP \<sigma> = 0x5edf \<and> RAX \<sigma> = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x448) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5e89\<close>
declare P_0x5edf_47_def[Ps]

definition P_0x5edf_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5edf_47_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5edf_47_regions :: state_pred where
  \<open>P_0x5edf_47_regions \<sigma> \<equiv> \<exists>regions. P_0x5edf_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_pstrcpy_addr_0x5edf_47 :: state_pred where
  \<open>Q_pstrcpy_addr_0x5edf_47 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = pstrcpy_addr \<and> RAX \<sigma> = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x448) \<and> RSI \<sigma> = 0x400 \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5ee4\<close>
declare Q_pstrcpy_addr_0x5edf_47_def[Qs]

schematic_goal cow_open_0_1_0x5edf_0x5edf_47[blocks]:
  assumes \<open>(P_0x5edf_47 && P_0x5edf_47_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5edf 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_pstrcpy_addr_0x5edf_47 ?\<sigma> \<and> block_usage P_0x5edf_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5edf_47_def P_0x5edf_47_regions_def post: Q_pstrcpy_addr_0x5edf_47_def regionset: P_0x5edf_47_regions_set_def)

definition P_0x5ee4_48 :: state_pred where
  \<open>P_0x5ee4_48 \<sigma> \<equiv> RIP \<sigma> = 0x5ee4 \<and> RAX \<sigma> = pstrcpy_0x5edf_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = ((RDI\<^sub>0::64 word) + 0x448) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5ee4\<close>
declare P_0x5ee4_48_def[Ps]

definition P_0x5ee4_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5ee4_48_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5ee4_48_regions :: state_pred where
  \<open>P_0x5ee4_48_regions \<sigma> \<equiv> \<exists>regions. P_0x5ee4_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f02_48 :: state_pred where
  \<open>Q_0x5f02_48 \<sigma> \<equiv> RIP \<sigma> = 0x5f02 \<and> RAX \<sigma> = pstrcpy_0x5edf_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5ee4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5f02_48_def[Qs]

schematic_goal cow_open_0_8_0x5ee4_0x5eff_48[blocks]:
  assumes \<open>(P_0x5ee4_48 && P_0x5ee4_48_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x5eff 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f02_48 ?\<sigma> \<and> block_usage P_0x5ee4_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5ee4_48_def P_0x5ee4_48_regions_def post: Q_0x5f02_48_def regionset: P_0x5ee4_48_regions_set_def)

definition P_0x5f02_49 :: state_pred where
  \<open>P_0x5f02_49 \<sigma> \<equiv> RIP \<sigma> = 0x5f02 \<and> RAX \<sigma> = pstrcpy_0x5edf_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5ee4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f02_49_def[Ps]

definition P_0x5f02_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f02_49_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f02_49_regions :: state_pred where
  \<open>P_0x5f02_49_regions \<sigma> \<equiv> \<exists>regions. P_0x5f02_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_mmap_addr_addr_0x5f02_49 :: state_pred where
  \<open>Q_get_mmap_addr_addr_0x5f02_49 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = get_mmap_addr_addr \<and> RAX \<sigma> = pstrcpy_0x5edf_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSI \<sigma> = 0x400 \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f07 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_get_mmap_addr_addr_0x5f02_49_def[Qs]

schematic_goal cow_open_0_1_0x5f02_0x5f02_49[blocks]:
  assumes \<open>(P_0x5f02_49 && P_0x5f02_49_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f02 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_mmap_addr_addr_0x5f02_49 ?\<sigma> \<and> block_usage P_0x5f02_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f02_49_def P_0x5f02_49_regions_def post: Q_get_mmap_addr_addr_0x5f02_49_def regionset: P_0x5f02_49_regions_set_def)

definition P_0x5f07_50 :: state_pred where
  \<open>P_0x5f07_50 \<sigma> \<equiv> RIP \<sigma> = 0x5f07 \<and> RAX \<sigma> = get_mmap_addr_0x5f02_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x450) \<and> RDI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f07 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f07_50_def[Ps]

definition P_0x5f07_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f07_50_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f07_50_regions :: state_pred where
  \<open>P_0x5f07_50_regions \<sigma> \<equiv> \<exists>regions. P_0x5f07_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f1d_50 :: state_pred where
  \<open>Q_0x5f1d_50 \<sigma> \<equiv> RIP \<sigma> = 0x5f1d \<and> RAX \<sigma> = get_mmap_addr_0x5f02_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f07 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5f1d_50_def[Qs]

schematic_goal cow_open_0_6_0x5f07_0x5f1a_50[blocks]:
  assumes \<open>(P_0x5f07_50 && P_0x5f07_50_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x5f1a 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f1d_50 ?\<sigma> \<and> block_usage P_0x5f07_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f07_50_def P_0x5f07_50_regions_def post: Q_0x5f1d_50_def regionset: P_0x5f07_50_regions_set_def)

definition P_0x5f1d_51 :: state_pred where
  \<open>P_0x5f1d_51 \<sigma> \<equiv> RIP \<sigma> = 0x5f1d \<and> RAX \<sigma> = get_mmap_addr_0x5f02_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f07 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f1d_51_def[Ps]

definition P_0x5f1d_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f1d_51_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f1d_51_regions :: state_pred where
  \<open>P_0x5f1d_51_regions \<sigma> \<equiv> \<exists>regions. P_0x5f1d_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_mmap64_addr_0x5f1d_51 :: state_pred where
  \<open>Q_mmap64_addr_0x5f1d_51 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = mmap64_addr \<and> RAX \<sigma> = get_mmap_addr_0x5f02_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_mmap64_addr_0x5f1d_51_def[Qs]

schematic_goal cow_open_0_1_0x5f1d_0x5f1d_51[blocks]:
  assumes \<open>(P_0x5f1d_51 && P_0x5f1d_51_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f1d 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_mmap64_addr_0x5f1d_51 ?\<sigma> \<and> block_usage P_0x5f1d_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f1d_51_def P_0x5f1d_51_regions_def post: Q_mmap64_addr_0x5f1d_51_def regionset: P_0x5f1d_51_regions_set_def)

definition P_0x5f22_52 :: state_pred where
  \<open>P_0x5f22_52 \<sigma> \<equiv> RIP \<sigma> = 0x5f22 \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f22_52_def[Ps]

definition P_0x5f22_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f22_52_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (15, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f22_52_regions :: state_pred where
  \<open>P_0x5f22_52_regions \<sigma> \<equiv> \<exists>regions. P_0x5f22_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f2a_52 :: state_pred where
  \<open>Q_0x5f2a_52 \<sigma> \<equiv> RIP \<sigma> = 0x5f2a \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5f2a_52_def[Qs]

schematic_goal cow_open_0_2_0x5f22_0x5f26_52[blocks]:
  assumes \<open>(P_0x5f22_52 && P_0x5f22_52_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f26 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f2a_52 ?\<sigma> \<and> block_usage P_0x5f22_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f22_52_def P_0x5f22_52_regions_def post: Q_0x5f2a_52_def regionset: P_0x5f22_52_regions_set_def)

definition P_0x5f2a_true_53 :: state_pred where
  \<open>P_0x5f2a_true_53 \<sigma> \<equiv> RIP \<sigma> = 0x5f2a \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f2a_true_53_def[Ps]

definition P_0x5f2a_true_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f2a_true_53_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f2a_true_53_regions :: state_pred where
  \<open>P_0x5f2a_true_53_regions \<sigma> \<equiv> \<exists>regions. P_0x5f2a_true_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f93_53 :: state_pred where
  \<open>Q_0x5f93_53 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5f93_53_def[Qs]

schematic_goal cow_open_0_2_0x5f2a_0x5f90_53[blocks]:
  assumes \<open>(P_0x5f2a_true_53 && P_0x5f2a_true_53_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f90 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f93_53 ?\<sigma> \<and> block_usage P_0x5f2a_true_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f2a_true_53_def P_0x5f2a_true_53_regions_def post: Q_0x5f93_53_def regionset: P_0x5f2a_true_53_regions_set_def)

definition P_0x5f93_54 :: state_pred where
  \<open>P_0x5f93_54 \<sigma> \<equiv> RIP \<sigma> = 0x5f93 \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f93_54_def[Ps]

definition P_0x5f93_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f93_54_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f93_54_regions :: state_pred where
  \<open>P_0x5f93_54_regions \<sigma> \<equiv> \<exists>regions. P_0x5f93_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x5f93_54 :: state_pred where
  \<open>Q_close_addr_0x5f93_54 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_close_addr_0x5f93_54_def[Qs]

schematic_goal cow_open_0_1_0x5f93_0x5f93_54[blocks]:
  assumes \<open>(P_0x5f93_54 && P_0x5f93_54_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f93 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x5f93_54 ?\<sigma> \<and> block_usage P_0x5f93_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f93_54_def P_0x5f93_54_regions_def post: Q_close_addr_0x5f93_54_def regionset: P_0x5f93_54_regions_set_def)

definition P_0x5f98_55 :: state_pred where
  \<open>P_0x5f98_55 \<sigma> \<equiv> RIP \<sigma> = 0x5f98 \<and> RAX \<sigma> = close_0x5f93_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f98 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f98_55_def[Ps]

definition P_0x5f98_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f98_55_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (14, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f98_55_regions :: state_pred where
  \<open>P_0x5f98_55_regions \<sigma> \<equiv> \<exists>regions. P_0x5f98_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_55 :: state_pred where
  \<open>Q_0x5f4b_55 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_55_def[Qs]

schematic_goal cow_open_0_2_0x5f98_0x5f9d_55[blocks]:
  assumes \<open>(P_0x5f98_55 && P_0x5f98_55_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f9d 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_55 ?\<sigma> \<and> block_usage P_0x5f98_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f98_55_def P_0x5f98_55_regions_def post: Q_0x5f4b_55_def regionset: P_0x5f98_55_regions_set_def)

definition P_0x5f2a_false_56 :: state_pred where
  \<open>P_0x5f2a_false_56 \<sigma> \<equiv> RIP \<sigma> = 0x5f2a \<and> RAX \<sigma> = mmap64_0x5f1d_retval \<and> RBX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x3 \<and> RDI \<sigma> = get_mmap_addr_0x5f02_retval \<and> RSI \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x5e62_retval::32 word)) \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((((if' ((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then (bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64) else ((((bswap((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word)) 64)::64 word) + 0x1ff)::64 word)) >>> 9)::64 word) + 0x7) >>> 3)::32 word)::32 word) + 0x420)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x454),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x458),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0x5f22 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5f2a_false_56_def[Ps]

definition P_0x5f2a_false_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f2a_false_56_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x18), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x454), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x458), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x460), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5f2a_false_56_regions :: state_pred where
  \<open>P_0x5f2a_false_56_regions \<sigma> \<equiv> \<exists>regions. P_0x5f2a_false_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f4b_56 :: state_pred where
  \<open>Q_0x5f4b_56 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f4b_56_def[Qs]

schematic_goal cow_open_0_9_0x5f2a_0x5f49_56[blocks]:
  assumes \<open>(P_0x5f2a_false_56 && P_0x5f2a_false_56_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x5f49 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f4b_56 ?\<sigma> \<and> block_usage P_0x5f2a_false_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f2a_false_56_def P_0x5f2a_false_56_regions_def post: Q_0x5f4b_56_def regionset: P_0x5f2a_false_56_regions_set_def)

definition P_0x5f4b_57 :: state_pred where
  \<open>P_0x5f4b_57 \<sigma> \<equiv> RIP \<sigma> = 0x5f4b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x5f4b_57_def[Ps]

definition P_0x5f4b_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f4b_57_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5f4b_57_regions :: state_pred where
  \<open>P_0x5f4b_57_regions \<sigma> \<equiv> \<exists>regions. P_0x5f4b_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f5c_57 :: state_pred where
  \<open>Q_0x5f5c_57 \<sigma> \<equiv> RIP \<sigma> = 0x5f5c \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f5c_57_def[Qs]

schematic_goal cow_open_0_2_0x5f4b_0x5f53_57[blocks]:
  assumes \<open>(P_0x5f4b_57 && P_0x5f4b_57_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5f53 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f5c_57 ?\<sigma> \<and> block_usage P_0x5f4b_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f4b_57_def P_0x5f4b_57_regions_def post: Q_0x5f5c_57_def regionset: P_0x5f4b_57_regions_set_def)

definition P_0x5f5c_true_58 :: state_pred where
  \<open>P_0x5f5c_true_58 \<sigma> \<equiv> RIP \<sigma> = 0x5f5c \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x5f5c_true_58_def[Ps]

definition P_0x5f5c_true_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f5c_true_58_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5f5c_true_58_regions :: state_pred where
  \<open>P_0x5f5c_true_58_regions \<sigma> \<equiv> \<exists>regions. P_0x5f5c_true_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5f9f_58 :: state_pred where
  \<open>Q_0x5f9f_58 \<sigma> \<equiv> RIP \<sigma> = 0x5f9f \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x5f9f_58_def[Qs]

schematic_goal cow_open_0_1_0x5f5c_0x5f5c_58[blocks]:
  assumes \<open>(P_0x5f5c_true_58 && P_0x5f5c_true_58_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f5c 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5f9f_58 ?\<sigma> \<and> block_usage P_0x5f5c_true_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f5c_true_58_def P_0x5f5c_true_58_regions_def post: Q_0x5f9f_58_def regionset: P_0x5f5c_true_58_regions_set_def)

definition P_0x5f9f_59 :: state_pred where
  \<open>P_0x5f9f_59 \<sigma> \<equiv> RIP \<sigma> = 0x5f9f \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x5f9f_59_def[Ps]

definition P_0x5f9f_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f9f_59_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0x5f9f_59_regions :: state_pred where
  \<open>P_0x5f9f_59_regions \<sigma> \<equiv> \<exists>regions. P_0x5f9f_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x5f9f_59 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x5f9f_59 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RCX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x5f9f_59_def[Qs]

schematic_goal cow_open_0_1_0x5f9f_0x5f9f_59[blocks]:
  assumes \<open>(P_0x5f9f_59 && P_0x5f9f_59_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5f9f 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x5f9f_59 ?\<sigma> \<and> block_usage P_0x5f9f_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f9f_59_def P_0x5f9f_59_regions_def post: Q_stack_chk_fail_addr_0x5f9f_59_def regionset: P_0x5f9f_59_regions_set_def)

definition P_0x5f5c_false_60 :: state_pred where
  \<open>P_0x5f5c_false_60 \<sigma> \<equiv> RIP \<sigma> = 0x5f5c \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x5f5c_false_60_def[Ps]

definition P_0x5f5c_false_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5f5c_false_60_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5f5c_false_60_regions :: state_pred where
  \<open>P_0x5f5c_false_60_regions \<sigma> \<equiv> \<exists>regions. P_0x5f5c_false_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_60 :: state_pred where
  \<open>Q_ret_address_60 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RCX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_60_def[Qs]

schematic_goal cow_open_0_7_0x5f5c_0x5f6b_60[blocks]:
  assumes \<open>(P_0x5f5c_false_60 && P_0x5f5c_false_60_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x5f6b 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_60 ?\<sigma> \<and> block_usage P_0x5f5c_false_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5f5c_false_60_def P_0x5f5c_false_60_regions_def post: Q_ret_address_60_def regionset: P_0x5f5c_false_60_regions_set_def)

definition cow_open_acode :: ACode where
  \<open>cow_open_acode =
    Block 13 0x5e60 0;
    Block (Suc 0) 0x5e62 (Suc 0);
    CALL open64_acode;
    Block 2 0x5e6a 2;
    IF SF THEN
      Block 4 0x5f75 3;
      Block (Suc 0) 0x5f77 4;
      CALL open64_acode;
      Block 2 0x5f7f 5;
      IF !SF THEN
        Block 6 0x5e81 6;
        Block (Suc 0) 0x5e84 7;
        CALL qemu_read_ok_acode;
        Block (Suc 0) 0x5e89 8;
        IF SF THEN
          Block 2 0x5f90 9;
          Block (Suc 0) 0x5f93 10;
          CALL close_acode;
          Block 2 0x5f9d 11
        ELSE
          Block 2 0x5e91 12;
          IF !ZF THEN
            Block 2 0x5f90 13;
            Block (Suc 0) 0x5f93 14;
            CALL close_acode;
            Block 2 0x5f9d 15
          ELSE
            Block 2 0x5e9e 16;
            IF !ZF THEN
              Block 2 0x5f90 17;
              Block (Suc 0) 0x5f93 18;
              CALL close_acode;
              Block 2 0x5f9d 19
            ELSE
              Block 12 0x5edc 20;
              Block (Suc 0) 0x5edf 21;
              CALL pstrcpy_acode;
              Block 8 0x5eff 22;
              Block (Suc 0) 0x5f02 23;
              CALL get_mmap_addr_acode;
              Block 6 0x5f1a 24;
              Block (Suc 0) 0x5f1d 25;
              CALL mmap64_acode;
              Block 2 0x5f26 26;
              IF ZF THEN
                Block 2 0x5f90 27;
                Block (Suc 0) 0x5f93 28;
                CALL close_acode;
                Block 2 0x5f9d 29
              ELSE
                Block 9 0x5f49 30
              FI
            FI
          FI
        FI
      ELSE
        Block 3 0x5f8c 31
      FI
    ELSE
      Block 6 0x5e81 32;
      Block (Suc 0) 0x5e84 33;
      CALL qemu_read_ok_acode;
      Block (Suc 0) 0x5e89 34;
      IF SF THEN
        Block 2 0x5f90 35;
        Block (Suc 0) 0x5f93 36;
        CALL close_acode;
        Block 2 0x5f9d 37
      ELSE
        Block 2 0x5e91 38;
        IF !ZF THEN
          Block 2 0x5f90 39;
          Block (Suc 0) 0x5f93 40;
          CALL close_acode;
          Block 2 0x5f9d 41
        ELSE
          Block 2 0x5e9e 42;
          IF !ZF THEN
            Block 2 0x5f90 43;
            Block (Suc 0) 0x5f93 44;
            CALL close_acode;
            Block 2 0x5f9d 45
          ELSE
            Block 12 0x5edc 46;
            Block (Suc 0) 0x5edf 47;
            CALL pstrcpy_acode;
            Block 8 0x5eff 48;
            Block (Suc 0) 0x5f02 49;
            CALL get_mmap_addr_acode;
            Block 6 0x5f1a 50;
            Block (Suc 0) 0x5f1d 51;
            CALL mmap64_acode;
            Block 2 0x5f26 52;
            IF ZF THEN
              Block 2 0x5f90 53;
              Block (Suc 0) 0x5f93 54;
              CALL close_acode;
              Block 2 0x5f9d 55
            ELSE
              Block 9 0x5f49 56
            FI
          FI
        FI
      FI
    FI;
    Block 2 0x5f53 57;
    IF !ZF THEN
      Block (Suc 0) 0x5f5c 58;
      Block (Suc 0) 0x5f9f 59;
      CALL stack_chk_fail_acode
    ELSE
      Block 7 0x5f6b 60
    FI
  \<close>

schematic_goal "cow_open":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e62 \<longrightarrow> P_0x5e62_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e67 \<longrightarrow> P_0x5e67_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e6c \<longrightarrow> P_0x5e6c_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f77 \<longrightarrow> P_0x5f77_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f7c \<longrightarrow> P_0x5f7c_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f81 \<longrightarrow> P_0x5f81_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e84 \<longrightarrow> P_0x5e84_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e89 \<longrightarrow> P_0x5e89_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e8b \<longrightarrow> P_0x5e8b_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f93 \<longrightarrow> P_0x5f93_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f98 \<longrightarrow> P_0x5f98_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e8b \<longrightarrow> P_0x5e8b_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e98 \<longrightarrow> P_0x5e98_true_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f93 \<longrightarrow> P_0x5f93_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f98 \<longrightarrow> P_0x5f98_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e98 \<longrightarrow> P_0x5e98_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5ea6 \<longrightarrow> P_0x5ea6_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f93 \<longrightarrow> P_0x5f93_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f98 \<longrightarrow> P_0x5f98_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5ea6 \<longrightarrow> P_0x5ea6_false_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5edf \<longrightarrow> P_0x5edf_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5ee4 \<longrightarrow> P_0x5ee4_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f02 \<longrightarrow> P_0x5f02_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f07 \<longrightarrow> P_0x5f07_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f1d \<longrightarrow> P_0x5f1d_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f22 \<longrightarrow> P_0x5f22_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f2a \<longrightarrow> P_0x5f2a_true_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f93 \<longrightarrow> P_0x5f93_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f98 \<longrightarrow> P_0x5f98_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f2a \<longrightarrow> P_0x5f2a_false_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f81 \<longrightarrow> P_0x5f81_false_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e6c \<longrightarrow> P_0x5e6c_false_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e84 \<longrightarrow> P_0x5e84_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e89 \<longrightarrow> P_0x5e89_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e8b \<longrightarrow> P_0x5e8b_true_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f93 \<longrightarrow> P_0x5f93_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f98 \<longrightarrow> P_0x5f98_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e8b \<longrightarrow> P_0x5e8b_false_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e98 \<longrightarrow> P_0x5e98_true_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f93 \<longrightarrow> P_0x5f93_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f98 \<longrightarrow> P_0x5f98_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e98 \<longrightarrow> P_0x5e98_false_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5ea6 \<longrightarrow> P_0x5ea6_true_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f93 \<longrightarrow> P_0x5f93_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f98 \<longrightarrow> P_0x5f98_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5ea6 \<longrightarrow> P_0x5ea6_false_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5edf \<longrightarrow> P_0x5edf_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5ee4 \<longrightarrow> P_0x5ee4_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f02 \<longrightarrow> P_0x5f02_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f07 \<longrightarrow> P_0x5f07_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f1d \<longrightarrow> P_0x5f1d_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f22 \<longrightarrow> P_0x5f22_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f2a \<longrightarrow> P_0x5f2a_true_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f93 \<longrightarrow> P_0x5f93_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f98 \<longrightarrow> P_0x5f98_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f2a \<longrightarrow> P_0x5f2a_false_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f4b \<longrightarrow> P_0x5f4b_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f5c \<longrightarrow> P_0x5f5c_true_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f9f \<longrightarrow> P_0x5f9f_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5f5c \<longrightarrow> P_0x5f5c_false_60_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_open64_addr_0x5e62_1}} \<box>open64_acode {{P_0x5e67_2;M_0x5e62}}\<close>
    and [blocks]: \<open>{{Q_open64_addr_0x5f77_4}} \<box>open64_acode {{P_0x5f7c_5;M_0x5f77}}\<close>
    and [blocks]: \<open>{{Q_qemu_read_ok_addr_0x5e84_7}} \<box>qemu_read_ok_acode {{P_0x5e89_8;M_0x5e84}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x5f93_10}} \<box>close_acode {{P_0x5f98_11;M_0x5f93}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x5f93_14}} \<box>close_acode {{P_0x5f98_15;M_0x5f93}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x5f93_18}} \<box>close_acode {{P_0x5f98_19;M_0x5f93}}\<close>
    and [blocks]: \<open>{{Q_pstrcpy_addr_0x5edf_21}} \<box>pstrcpy_acode {{P_0x5ee4_22;M_0x5edf}}\<close>
    and [blocks]: \<open>{{Q_get_mmap_addr_addr_0x5f02_23}} \<box>get_mmap_addr_acode {{P_0x5f07_24;M_0x5f02}}\<close>
    and [blocks]: \<open>{{Q_mmap64_addr_0x5f1d_25}} \<box>mmap64_acode {{P_0x5f22_26;M_0x5f1d}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x5f93_28}} \<box>close_acode {{P_0x5f98_29;M_0x5f93}}\<close>
    and [blocks]: \<open>{{Q_qemu_read_ok_addr_0x5e84_33}} \<box>qemu_read_ok_acode {{P_0x5e89_34;M_0x5e84}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x5f93_36}} \<box>close_acode {{P_0x5f98_37;M_0x5f93}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x5f93_40}} \<box>close_acode {{P_0x5f98_41;M_0x5f93}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x5f93_44}} \<box>close_acode {{P_0x5f98_45;M_0x5f93}}\<close>
    and [blocks]: \<open>{{Q_pstrcpy_addr_0x5edf_47}} \<box>pstrcpy_acode {{P_0x5ee4_48;M_0x5edf}}\<close>
    and [blocks]: \<open>{{Q_get_mmap_addr_addr_0x5f02_49}} \<box>get_mmap_addr_acode {{P_0x5f07_50;M_0x5f02}}\<close>
    and [blocks]: \<open>{{Q_mmap64_addr_0x5f1d_51}} \<box>mmap64_acode {{P_0x5f22_52;M_0x5f1d}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x5f93_54}} \<box>close_acode {{P_0x5f98_55;M_0x5f93}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x5f9f_59}} \<box>stack_chk_fail_acode {{Q_fail;M_0x5f9f}}\<close>
  shows \<open>{{?P}} cow_open_acode {{?Q;?M}}\<close>
  by (vcg acode: cow_open_acode_def assms: assms)

end
