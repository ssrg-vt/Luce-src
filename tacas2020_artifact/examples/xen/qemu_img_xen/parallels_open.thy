theory parallels_open
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes open64_0x167cc_retval\<^sub>v qemu_read_ok_0x167ef_retval\<^sub>v lseek64_0x16841_retval\<^sub>v qemu_malloc_0x16864_retval\<^sub>v read_0x16884_retval\<^sub>v open64_0x168c7_retval\<^sub>v qemu_free_0x168e9_retval\<^sub>v close_0x168f6_retval\<^sub>v stack_chk_fail_0x168fd_retval\<^sub>v stack_chk_fail_addr close_addr lseek64_addr open64_addr qemu_free_addr qemu_malloc_addr qemu_read_ok_addr read_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode close_acode lseek64_acode open64_acode qemu_free_acode qemu_malloc_acode qemu_read_ok_acode read_acode :: ACode
  assumes fetch:
    "fetch 0x167a0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x167a2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x167a5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x167a7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x167aa \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 2)), 5)"
    "fetch 0x167af \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x167b0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x167b1 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 88)), 4)"
    "fetch 0x167b5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x167b9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x167bc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x167c5 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 72)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x167ca \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x167cc \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''open64'')), 5)"
    "fetch 0x167d1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x167d3 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x167d5 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 92352)), 6)"
    "fetch 0x167db \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 8)))) (Immediate SixtyFour (ImmVal 1)), 8)"
    "fetch 0x167e3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x167e6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 64)), 5)"
    "fetch 0x167eb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x167ed \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx)))) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x167ef \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_read_ok'')), 5)"
    "fetch 0x167f4 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x167f6 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 92384)), 6)"
    "fetch 0x167fc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 7305790155588461938)), 10)"
    "fetch 0x16806 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1680b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 5076811801307670871)), 10)"
    "fetch 0x16815 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x16819 \<equiv> (Binary (IS_8088 Or) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1681c \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 92384)), 6)"
    "fetch 0x16822 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x16825 \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Immediate SixtyFour (ImmVal 2)), 5)"
    "fetch 0x1682a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 92384)), 6)"
    "fetch 0x16830 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 36))))), 4)"
    "fetch 0x16834 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x16836 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 64)), 5)"
    "fetch 0x1683b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 0)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1683f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x16841 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''lseek64'')), 5)"
    "fetch 0x16846 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 64)), 4)"
    "fetch 0x1684a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 92384)), 6)"
    "fetch 0x16850 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 28))))), 4)"
    "fetch 0x16854 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 20)))) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x16857 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32))))), 4)"
    "fetch 0x1685b \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 16)))) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x1685e \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x16861 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdi)) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x16864 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_malloc'')), 5)"
    "fetch 0x16869 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1686d \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x16870 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 92398)), 2)"
    "fetch 0x16872 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 16))))), 3)"
    "fetch 0x16875 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x16877 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1687a \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Plus (A_Mult 4 (A_FromReg (General SixtyFour rcx))) (A_WordConstant 0)))), 7)"
    "fetch 0x16881 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x16884 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''read'')), 5)"
    "fetch 0x16889 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 16))))), 3)"
    "fetch 0x1688c \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Plus (A_Mult 4 (A_FromReg (General SixtyFour rcx))) (A_WordConstant 0)))), 7)"
    "fetch 0x16893 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x16896 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x16899 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 92384)), 2)"
    "fetch 0x1689b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 72))))), 5)"
    "fetch 0x168a0 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x168a9 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x168ac \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 92413)), 2)"
    "fetch 0x168ae \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 88)), 4)"
    "fetch 0x168b2 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x168b3 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x168b4 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x168b6 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x168b8 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x168b9 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x168c0 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x168c2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x168c5 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x168c7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''open64'')), 5)"
    "fetch 0x168cc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x168ce \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x168d0 \<equiv> (Unary (IS_8088 Jns) (Immediate SixtyFour (ImmVal 92123)), 6)"
    "fetch 0x168d6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 4294967295)), 6)"
    "fetch 0x168dc \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 92315)), 2)"
    "fetch 0x168de \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x168e0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8))))), 4)"
    "fetch 0x168e4 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x168e7 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 92398)), 2)"
    "fetch 0x168e9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x168ee \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x168f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 4294967295)), 6)"
    "fetch 0x168f6 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''close'')), 5)"
    "fetch 0x168fb \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 92315)), 2)"
    "fetch 0x168fd \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x16902 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and close\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''close'') = close_addr\<close>
    and lseek64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''lseek64'') = lseek64_addr\<close>
    and open64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''open64'') = open64_addr\<close>
    and qemu_free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_free'') = qemu_free_addr\<close>
    and qemu_malloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_malloc'') = qemu_malloc_addr\<close>
    and qemu_read_ok\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_read_ok'') = qemu_read_ok_addr\<close>
    and read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''read'') = read_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>open64_0x167cc_retval \<equiv> open64_0x167cc_retval\<^sub>v\<close>
definition \<open>qemu_read_ok_0x167ef_retval \<equiv> qemu_read_ok_0x167ef_retval\<^sub>v\<close>
definition \<open>lseek64_0x16841_retval \<equiv> lseek64_0x16841_retval\<^sub>v\<close>
definition \<open>qemu_malloc_0x16864_retval \<equiv> qemu_malloc_0x16864_retval\<^sub>v\<close>
definition \<open>read_0x16884_retval \<equiv> read_0x16884_retval\<^sub>v\<close>
definition \<open>open64_0x168c7_retval \<equiv> open64_0x168c7_retval\<^sub>v\<close>
definition \<open>qemu_free_0x168e9_retval \<equiv> qemu_free_0x168e9_retval\<^sub>v\<close>
definition \<open>close_0x168f6_retval \<equiv> close_0x168f6_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x168fd_retval \<equiv> stack_chk_fail_0x168fd_retval\<^sub>v\<close>

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

locale "parallels_open" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x167a0_0 :: state_pred where
  \<open>P_0x167a0_0 \<sigma> \<equiv> RIP \<sigma> = 0x167a0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x167a0_0_def[Ps]

definition P_0x167a0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167a0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x167a0_0_regions :: state_pred where
  \<open>P_0x167a0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x167a0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x167cc_0 :: state_pred where
  \<open>Q_0x167cc_0 \<sigma> \<equiv> RIP \<sigma> = 0x167cc \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x167cc_0_def[Qs]

schematic_goal parallels_open_0_13_0x167a0_0x167ca_0[blocks]:
  assumes \<open>(P_0x167a0_0 && P_0x167a0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 13 0x167ca 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x167cc_0 ?\<sigma> \<and> block_usage P_0x167a0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167a0_0_def P_0x167a0_0_regions_def post: Q_0x167cc_0_def regionset: P_0x167a0_0_regions_set_def)

definition P_0x167cc_1 :: state_pred where
  \<open>P_0x167cc_1 \<sigma> \<equiv> RIP \<sigma> = 0x167cc \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x167cc_1_def[Ps]

definition P_0x167cc_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167cc_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167cc_1_regions :: state_pred where
  \<open>P_0x167cc_1_regions \<sigma> \<equiv> \<exists>regions. P_0x167cc_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_open64_addr_0x167cc_1 :: state_pred where
  \<open>Q_open64_addr_0x167cc_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = open64_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167d1\<close>
declare Q_open64_addr_0x167cc_1_def[Qs]

schematic_goal parallels_open_0_1_0x167cc_0x167cc_1[blocks]:
  assumes \<open>(P_0x167cc_1 && P_0x167cc_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x167cc (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_open64_addr_0x167cc_1 ?\<sigma> \<and> block_usage P_0x167cc_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167cc_1_def P_0x167cc_1_regions_def post: Q_open64_addr_0x167cc_1_def regionset: P_0x167cc_1_regions_set_def)

definition P_0x167d1_2 :: state_pred where
  \<open>P_0x167d1_2 \<sigma> \<equiv> RIP \<sigma> = 0x167d1 \<and> RAX \<sigma> = open64_0x167cc_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167d1\<close>
declare P_0x167d1_2_def[Ps]

definition P_0x167d1_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167d1_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167d1_2_regions :: state_pred where
  \<open>P_0x167d1_2_regions \<sigma> \<equiv> \<exists>regions. P_0x167d1_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x167d5_2 :: state_pred where
  \<open>Q_0x167d5_2 \<sigma> \<equiv> RIP \<sigma> = 0x167d5 \<and> RAX \<sigma> = open64_0x167cc_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167d1\<close>
declare Q_0x167d5_2_def[Qs]

schematic_goal parallels_open_0_2_0x167d1_0x167d3_2[blocks]:
  assumes \<open>(P_0x167d1_2 && P_0x167d1_2_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x167d3 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x167d5_2 ?\<sigma> \<and> block_usage P_0x167d1_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167d1_2_def P_0x167d1_2_regions_def post: Q_0x167d5_2_def regionset: P_0x167d1_2_regions_set_def)

definition P_0x167d5_true_3 :: state_pred where
  \<open>P_0x167d5_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x167d5 \<and> RAX \<sigma> = open64_0x167cc_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167d1\<close>
declare P_0x167d5_true_3_def[Ps]

definition P_0x167d5_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167d5_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167d5_true_3_regions :: state_pred where
  \<open>P_0x167d5_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x167d5_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168c7_3 :: state_pred where
  \<open>Q_0x168c7_3 \<sigma> \<equiv> RIP \<sigma> = 0x168c7 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167d1\<close>
declare Q_0x168c7_3_def[Qs]

schematic_goal parallels_open_0_4_0x167d5_0x168c5_3[blocks]:
  assumes \<open>(P_0x167d5_true_3 && P_0x167d5_true_3_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x168c5 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168c7_3 ?\<sigma> \<and> block_usage P_0x167d5_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167d5_true_3_def P_0x167d5_true_3_regions_def post: Q_0x168c7_3_def regionset: P_0x167d5_true_3_regions_set_def)

definition P_0x168c7_4 :: state_pred where
  \<open>P_0x168c7_4 \<sigma> \<equiv> RIP \<sigma> = 0x168c7 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167d1\<close>
declare P_0x168c7_4_def[Ps]

definition P_0x168c7_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168c7_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168c7_4_regions :: state_pred where
  \<open>P_0x168c7_4_regions \<sigma> \<equiv> \<exists>regions. P_0x168c7_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_open64_addr_0x168c7_4 :: state_pred where
  \<open>Q_open64_addr_0x168c7_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = open64_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168cc\<close>
declare Q_open64_addr_0x168c7_4_def[Qs]

schematic_goal parallels_open_0_1_0x168c7_0x168c7_4[blocks]:
  assumes \<open>(P_0x168c7_4 && P_0x168c7_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168c7 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_open64_addr_0x168c7_4 ?\<sigma> \<and> block_usage P_0x168c7_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168c7_4_def P_0x168c7_4_regions_def post: Q_open64_addr_0x168c7_4_def regionset: P_0x168c7_4_regions_set_def)

definition P_0x168cc_5 :: state_pred where
  \<open>P_0x168cc_5 \<sigma> \<equiv> RIP \<sigma> = 0x168cc \<and> RAX \<sigma> = open64_0x168c7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168cc\<close>
declare P_0x168cc_5_def[Ps]

definition P_0x168cc_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168cc_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168cc_5_regions :: state_pred where
  \<open>P_0x168cc_5_regions \<sigma> \<equiv> \<exists>regions. P_0x168cc_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168d0_5 :: state_pred where
  \<open>Q_0x168d0_5 \<sigma> \<equiv> RIP \<sigma> = 0x168d0 \<and> RAX \<sigma> = open64_0x168c7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168cc\<close>
declare Q_0x168d0_5_def[Qs]

schematic_goal parallels_open_0_2_0x168cc_0x168ce_5[blocks]:
  assumes \<open>(P_0x168cc_5 && P_0x168cc_5_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168ce 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168d0_5 ?\<sigma> \<and> block_usage P_0x168cc_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168cc_5_def P_0x168cc_5_regions_def post: Q_0x168d0_5_def regionset: P_0x168cc_5_regions_set_def)

definition P_0x168d0_true_6 :: state_pred where
  \<open>P_0x168d0_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x168d0 \<and> RAX \<sigma> = open64_0x168c7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168cc\<close>
declare P_0x168d0_true_6_def[Ps]

definition P_0x168d0_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168d0_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (10, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168d0_true_6_regions :: state_pred where
  \<open>P_0x168d0_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x168d0_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x167ef_6 :: state_pred where
  \<open>Q_0x167ef_6 \<sigma> \<equiv> RIP \<sigma> = 0x167ef \<and> RAX \<sigma> = open64_0x168c7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168cc\<close>
declare Q_0x167ef_6_def[Qs]

schematic_goal parallels_open_0_6_0x168d0_0x167ed_6[blocks]:
  assumes \<open>(P_0x168d0_true_6 && P_0x168d0_true_6_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 6 0x167ed 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x167ef_6 ?\<sigma> \<and> block_usage P_0x168d0_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168d0_true_6_def P_0x168d0_true_6_regions_def post: Q_0x167ef_6_def regionset: P_0x168d0_true_6_regions_set_def)

definition P_0x167ef_7 :: state_pred where
  \<open>P_0x167ef_7 \<sigma> \<equiv> RIP \<sigma> = 0x167ef \<and> RAX \<sigma> = open64_0x168c7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168cc\<close>
declare P_0x167ef_7_def[Ps]

definition P_0x167ef_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167ef_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167ef_7_regions :: state_pred where
  \<open>P_0x167ef_7_regions \<sigma> \<equiv> \<exists>regions. P_0x167ef_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_read_ok_addr_0x167ef_7 :: state_pred where
  \<open>Q_qemu_read_ok_addr_0x167ef_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_read_ok_addr \<and> RAX \<sigma> = open64_0x168c7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_qemu_read_ok_addr_0x167ef_7_def[Qs]

schematic_goal parallels_open_0_1_0x167ef_0x167ef_7[blocks]:
  assumes \<open>(P_0x167ef_7 && P_0x167ef_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x167ef 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_read_ok_addr_0x167ef_7 ?\<sigma> \<and> block_usage P_0x167ef_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167ef_7_def P_0x167ef_7_regions_def post: Q_qemu_read_ok_addr_0x167ef_7_def regionset: P_0x167ef_7_regions_set_def)

definition P_0x167f4_8 :: state_pred where
  \<open>P_0x167f4_8 \<sigma> \<equiv> RIP \<sigma> = 0x167f4 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x167f4_8_def[Ps]

definition P_0x167f4_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167f4_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167f4_8_regions :: state_pred where
  \<open>P_0x167f4_8_regions \<sigma> \<equiv> \<exists>regions. P_0x167f4_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x167f6_8 :: state_pred where
  \<open>Q_0x167f6_8 \<sigma> \<equiv> RIP \<sigma> = 0x167f6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x167f6_8_def[Qs]

schematic_goal parallels_open_0_1_0x167f4_0x167f4_8[blocks]:
  assumes \<open>(P_0x167f4_8 && P_0x167f4_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x167f4 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x167f6_8 ?\<sigma> \<and> block_usage P_0x167f4_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167f4_8_def P_0x167f4_8_regions_def post: Q_0x167f6_8_def regionset: P_0x167f4_8_regions_set_def)

definition P_0x167f6_true_9 :: state_pred where
  \<open>P_0x167f6_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x167f6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x167f6_true_9_def[Ps]

definition P_0x167f6_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167f6_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167f6_true_9_regions :: state_pred where
  \<open>P_0x167f6_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x167f6_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e7_9 :: state_pred where
  \<open>Q_0x168e7_9 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e7_9_def[Qs]

schematic_goal parallels_open_0_3_0x167f6_0x168e4_9[blocks]:
  assumes \<open>(P_0x167f6_true_9 && P_0x167f6_true_9_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168e4 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e7_9 ?\<sigma> \<and> block_usage P_0x167f6_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167f6_true_9_def P_0x167f6_true_9_regions_def post: Q_0x168e7_9_def regionset: P_0x167f6_true_9_regions_set_def)

definition P_0x168e7_true_10 :: state_pred where
  \<open>P_0x168e7_true_10 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_true_10_def[Ps]

definition P_0x168e7_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_true_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_true_10_regions :: state_pred where
  \<open>P_0x168e7_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ee_10 :: state_pred where
  \<open>Q_0x168ee_10 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x168ee_10_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_10[blocks]:
  assumes \<open>(P_0x168e7_true_10 && P_0x168e7_true_10_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ee_10 ?\<sigma> \<and> block_usage P_0x168e7_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_true_10_def P_0x168e7_true_10_regions_def post: Q_0x168ee_10_def regionset: P_0x168e7_true_10_regions_set_def)

definition P_0x168e7_false_11 :: state_pred where
  \<open>P_0x168e7_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_false_11_def[Ps]

definition P_0x168e7_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_false_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_false_11_regions :: state_pred where
  \<open>P_0x168e7_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e9_11 :: state_pred where
  \<open>Q_0x168e9_11 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e9_11_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_11[blocks]:
  assumes \<open>(P_0x168e7_false_11 && P_0x168e7_false_11_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e9_11 ?\<sigma> \<and> block_usage P_0x168e7_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_false_11_def P_0x168e7_false_11_regions_def post: Q_0x168e9_11_def regionset: P_0x168e7_false_11_regions_set_def)

definition P_0x168e9_12 :: state_pred where
  \<open>P_0x168e9_12 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e9_12_def[Ps]

definition P_0x168e9_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e9_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e9_12_regions :: state_pred where
  \<open>P_0x168e9_12_regions \<sigma> \<equiv> \<exists>regions. P_0x168e9_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x168e9_12 :: state_pred where
  \<open>Q_qemu_free_addr_0x168e9_12 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_qemu_free_addr_0x168e9_12_def[Qs]

schematic_goal parallels_open_0_1_0x168e9_0x168e9_12[blocks]:
  assumes \<open>(P_0x168e9_12 && P_0x168e9_12_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e9 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x168e9_12 ?\<sigma> \<and> block_usage P_0x168e9_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e9_12_def P_0x168e9_12_regions_def post: Q_qemu_free_addr_0x168e9_12_def regionset: P_0x168e9_12_regions_set_def)

definition P_0x168ee_13 :: state_pred where
  \<open>P_0x168ee_13 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x168ee_13_def[Ps]

definition P_0x168ee_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ee_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x168ee_13_regions :: state_pred where
  \<open>P_0x168ee_13_regions \<sigma> \<equiv> \<exists>regions. P_0x168ee_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_13 :: state_pred where
  \<open>Q_0x168f6_13 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x168f6_13_def[Qs]

schematic_goal parallels_open_0_2_0x168ee_0x168f0_13[blocks]:
  assumes \<open>(P_0x168ee_13 && P_0x168ee_13_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168f0 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_13 ?\<sigma> \<and> block_usage P_0x168ee_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ee_13_def P_0x168ee_13_regions_def post: Q_0x168f6_13_def regionset: P_0x168ee_13_regions_set_def)

definition P_0x168f6_14 :: state_pred where
  \<open>P_0x168f6_14 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x168f6_14_def[Ps]

definition P_0x168f6_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168f6_14_regions :: state_pred where
  \<open>P_0x168f6_14_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_14 :: state_pred where
  \<open>Q_close_addr_0x168f6_14 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare Q_close_addr_0x168f6_14_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_14[blocks]:
  assumes \<open>(P_0x168f6_14 && P_0x168f6_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_14 ?\<sigma> \<and> block_usage P_0x168f6_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_14_def P_0x168f6_14_regions_def post: Q_close_addr_0x168f6_14_def regionset: P_0x168f6_14_regions_set_def)

definition P_0x168fb_15 :: state_pred where
  \<open>P_0x168fb_15 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare P_0x168fb_15_def[Ps]

definition P_0x168fb_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168fb_15_regions :: state_pred where
  \<open>P_0x168fb_15_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_15 :: state_pred where
  \<open>Q_0x1689b_15 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_15_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_15[blocks]:
  assumes \<open>(P_0x168fb_15 && P_0x168fb_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_15 ?\<sigma> \<and> block_usage P_0x168fb_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_15_def P_0x168fb_15_regions_def post: Q_0x1689b_15_def regionset: P_0x168fb_15_regions_set_def)

definition P_0x167f6_false_16 :: state_pred where
  \<open>P_0x167f6_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x167f6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x167f6_false_16_def[Ps]

definition P_0x167f6_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167f6_false_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167f6_false_16_regions :: state_pred where
  \<open>P_0x167f6_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x167f6_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1681c_16 :: state_pred where
  \<open>Q_0x1681c_16 \<sigma> \<equiv> RIP \<sigma> = 0x1681c \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x1681c_16_def[Qs]

schematic_goal parallels_open_0_6_0x167f6_0x16819_16[blocks]:
  assumes \<open>(P_0x167f6_false_16 && P_0x167f6_false_16_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 6 0x16819 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1681c_16 ?\<sigma> \<and> block_usage P_0x167f6_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167f6_false_16_def P_0x167f6_false_16_regions_def post: Q_0x1681c_16_def regionset: P_0x167f6_false_16_regions_set_def)

definition P_0x1681c_true_17 :: state_pred where
  \<open>P_0x1681c_true_17 \<sigma> \<equiv> RIP \<sigma> = 0x1681c \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x1681c_true_17_def[Ps]

definition P_0x1681c_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1681c_true_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1681c_true_17_regions :: state_pred where
  \<open>P_0x1681c_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0x1681c_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e7_17 :: state_pred where
  \<open>Q_0x168e7_17 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e7_17_def[Qs]

schematic_goal parallels_open_0_3_0x1681c_0x168e4_17[blocks]:
  assumes \<open>(P_0x1681c_true_17 && P_0x1681c_true_17_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168e4 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e7_17 ?\<sigma> \<and> block_usage P_0x1681c_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1681c_true_17_def P_0x1681c_true_17_regions_def post: Q_0x168e7_17_def regionset: P_0x1681c_true_17_regions_set_def)

definition P_0x168e7_true_18 :: state_pred where
  \<open>P_0x168e7_true_18 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_true_18_def[Ps]

definition P_0x168e7_true_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_true_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_true_18_regions :: state_pred where
  \<open>P_0x168e7_true_18_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_true_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ee_18 :: state_pred where
  \<open>Q_0x168ee_18 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_0x168ee_18_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_18[blocks]:
  assumes \<open>(P_0x168e7_true_18 && P_0x168e7_true_18_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ee_18 ?\<sigma> \<and> block_usage P_0x168e7_true_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_true_18_def P_0x168e7_true_18_regions_def post: Q_0x168ee_18_def regionset: P_0x168e7_true_18_regions_set_def)

definition P_0x168e7_false_19 :: state_pred where
  \<open>P_0x168e7_false_19 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_false_19_def[Ps]

definition P_0x168e7_false_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_false_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_false_19_regions :: state_pred where
  \<open>P_0x168e7_false_19_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_false_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e9_19 :: state_pred where
  \<open>Q_0x168e9_19 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e9_19_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_19[blocks]:
  assumes \<open>(P_0x168e7_false_19 && P_0x168e7_false_19_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e9_19 ?\<sigma> \<and> block_usage P_0x168e7_false_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_false_19_def P_0x168e7_false_19_regions_def post: Q_0x168e9_19_def regionset: P_0x168e7_false_19_regions_set_def)

definition P_0x168e9_20 :: state_pred where
  \<open>P_0x168e9_20 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e9_20_def[Ps]

definition P_0x168e9_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e9_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e9_20_regions :: state_pred where
  \<open>P_0x168e9_20_regions \<sigma> \<equiv> \<exists>regions. P_0x168e9_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x168e9_20 :: state_pred where
  \<open>Q_qemu_free_addr_0x168e9_20 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_qemu_free_addr_0x168e9_20_def[Qs]

schematic_goal parallels_open_0_1_0x168e9_0x168e9_20[blocks]:
  assumes \<open>(P_0x168e9_20 && P_0x168e9_20_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e9 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x168e9_20 ?\<sigma> \<and> block_usage P_0x168e9_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e9_20_def P_0x168e9_20_regions_def post: Q_qemu_free_addr_0x168e9_20_def regionset: P_0x168e9_20_regions_set_def)

definition P_0x168ee_21 :: state_pred where
  \<open>P_0x168ee_21 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare P_0x168ee_21_def[Ps]

definition P_0x168ee_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ee_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x168ee_21_regions :: state_pred where
  \<open>P_0x168ee_21_regions \<sigma> \<equiv> \<exists>regions. P_0x168ee_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_21 :: state_pred where
  \<open>Q_0x168f6_21 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_0x168f6_21_def[Qs]

schematic_goal parallels_open_0_2_0x168ee_0x168f0_21[blocks]:
  assumes \<open>(P_0x168ee_21 && P_0x168ee_21_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168f0 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_21 ?\<sigma> \<and> block_usage P_0x168ee_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ee_21_def P_0x168ee_21_regions_def post: Q_0x168f6_21_def regionset: P_0x168ee_21_regions_set_def)

definition P_0x168f6_22 :: state_pred where
  \<open>P_0x168f6_22 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare P_0x168f6_22_def[Ps]

definition P_0x168f6_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168f6_22_regions :: state_pred where
  \<open>P_0x168f6_22_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_22 :: state_pred where
  \<open>Q_close_addr_0x168f6_22 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare Q_close_addr_0x168f6_22_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_22[blocks]:
  assumes \<open>(P_0x168f6_22 && P_0x168f6_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_22 ?\<sigma> \<and> block_usage P_0x168f6_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_22_def P_0x168f6_22_regions_def post: Q_close_addr_0x168f6_22_def regionset: P_0x168f6_22_regions_set_def)

definition P_0x168fb_23 :: state_pred where
  \<open>P_0x168fb_23 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare P_0x168fb_23_def[Ps]

definition P_0x168fb_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168fb_23_regions :: state_pred where
  \<open>P_0x168fb_23_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_23 :: state_pred where
  \<open>Q_0x1689b_23 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_23_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_23[blocks]:
  assumes \<open>(P_0x168fb_23 && P_0x168fb_23_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_23 ?\<sigma> \<and> block_usage P_0x168fb_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_23_def P_0x168fb_23_regions_def post: Q_0x1689b_23_def regionset: P_0x168fb_23_regions_set_def)

definition P_0x1681c_false_24 :: state_pred where
  \<open>P_0x1681c_false_24 \<sigma> \<equiv> RIP \<sigma> = 0x1681c \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x1681c_false_24_def[Ps]

definition P_0x1681c_false_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1681c_false_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1681c_false_24_regions :: state_pred where
  \<open>P_0x1681c_false_24_regions \<sigma> \<equiv> \<exists>regions. P_0x1681c_false_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1682a_24 :: state_pred where
  \<open>Q_0x1682a_24 \<sigma> \<equiv> RIP \<sigma> = 0x1682a \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x1682a_24_def[Qs]

schematic_goal parallels_open_0_3_0x1681c_0x16825_24[blocks]:
  assumes \<open>(P_0x1681c_false_24 && P_0x1681c_false_24_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x16825 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1682a_24 ?\<sigma> \<and> block_usage P_0x1681c_false_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1681c_false_24_def P_0x1681c_false_24_regions_def post: Q_0x1682a_24_def regionset: P_0x1681c_false_24_regions_set_def)

definition P_0x1682a_true_25 :: state_pred where
  \<open>P_0x1682a_true_25 \<sigma> \<equiv> RIP \<sigma> = 0x1682a \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x1682a_true_25_def[Ps]

definition P_0x1682a_true_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1682a_true_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1682a_true_25_regions :: state_pred where
  \<open>P_0x1682a_true_25_regions \<sigma> \<equiv> \<exists>regions. P_0x1682a_true_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e7_25 :: state_pred where
  \<open>Q_0x168e7_25 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e7_25_def[Qs]

schematic_goal parallels_open_0_3_0x1682a_0x168e4_25[blocks]:
  assumes \<open>(P_0x1682a_true_25 && P_0x1682a_true_25_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168e4 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e7_25 ?\<sigma> \<and> block_usage P_0x1682a_true_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1682a_true_25_def P_0x1682a_true_25_regions_def post: Q_0x168e7_25_def regionset: P_0x1682a_true_25_regions_set_def)

definition P_0x168e7_true_26 :: state_pred where
  \<open>P_0x168e7_true_26 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_true_26_def[Ps]

definition P_0x168e7_true_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_true_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_true_26_regions :: state_pred where
  \<open>P_0x168e7_true_26_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_true_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ee_26 :: state_pred where
  \<open>Q_0x168ee_26 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_0x168ee_26_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_26[blocks]:
  assumes \<open>(P_0x168e7_true_26 && P_0x168e7_true_26_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ee_26 ?\<sigma> \<and> block_usage P_0x168e7_true_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_true_26_def P_0x168e7_true_26_regions_def post: Q_0x168ee_26_def regionset: P_0x168e7_true_26_regions_set_def)

definition P_0x168e7_false_27 :: state_pred where
  \<open>P_0x168e7_false_27 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_false_27_def[Ps]

definition P_0x168e7_false_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_false_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_false_27_regions :: state_pred where
  \<open>P_0x168e7_false_27_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_false_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e9_27 :: state_pred where
  \<open>Q_0x168e9_27 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e9_27_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_27[blocks]:
  assumes \<open>(P_0x168e7_false_27 && P_0x168e7_false_27_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e9_27 ?\<sigma> \<and> block_usage P_0x168e7_false_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_false_27_def P_0x168e7_false_27_regions_def post: Q_0x168e9_27_def regionset: P_0x168e7_false_27_regions_set_def)

definition P_0x168e9_28 :: state_pred where
  \<open>P_0x168e9_28 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e9_28_def[Ps]

definition P_0x168e9_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e9_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e9_28_regions :: state_pred where
  \<open>P_0x168e9_28_regions \<sigma> \<equiv> \<exists>regions. P_0x168e9_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x168e9_28 :: state_pred where
  \<open>Q_qemu_free_addr_0x168e9_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_qemu_free_addr_0x168e9_28_def[Qs]

schematic_goal parallels_open_0_1_0x168e9_0x168e9_28[blocks]:
  assumes \<open>(P_0x168e9_28 && P_0x168e9_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e9 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x168e9_28 ?\<sigma> \<and> block_usage P_0x168e9_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e9_28_def P_0x168e9_28_regions_def post: Q_qemu_free_addr_0x168e9_28_def regionset: P_0x168e9_28_regions_set_def)

definition P_0x168ee_29 :: state_pred where
  \<open>P_0x168ee_29 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare P_0x168ee_29_def[Ps]

definition P_0x168ee_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ee_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x168ee_29_regions :: state_pred where
  \<open>P_0x168ee_29_regions \<sigma> \<equiv> \<exists>regions. P_0x168ee_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_29 :: state_pred where
  \<open>Q_0x168f6_29 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_0x168f6_29_def[Qs]

schematic_goal parallels_open_0_2_0x168ee_0x168f0_29[blocks]:
  assumes \<open>(P_0x168ee_29 && P_0x168ee_29_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168f0 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_29 ?\<sigma> \<and> block_usage P_0x168ee_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ee_29_def P_0x168ee_29_regions_def post: Q_0x168f6_29_def regionset: P_0x168ee_29_regions_set_def)

definition P_0x168f6_30 :: state_pred where
  \<open>P_0x168f6_30 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare P_0x168f6_30_def[Ps]

definition P_0x168f6_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168f6_30_regions :: state_pred where
  \<open>P_0x168f6_30_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_30 :: state_pred where
  \<open>Q_close_addr_0x168f6_30 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare Q_close_addr_0x168f6_30_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_30[blocks]:
  assumes \<open>(P_0x168f6_30 && P_0x168f6_30_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_30 ?\<sigma> \<and> block_usage P_0x168f6_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_30_def P_0x168f6_30_regions_def post: Q_close_addr_0x168f6_30_def regionset: P_0x168f6_30_regions_set_def)

definition P_0x168fb_31 :: state_pred where
  \<open>P_0x168fb_31 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare P_0x168fb_31_def[Ps]

definition P_0x168fb_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168fb_31_regions :: state_pred where
  \<open>P_0x168fb_31_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_31 :: state_pred where
  \<open>Q_0x1689b_31 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_31_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_31[blocks]:
  assumes \<open>(P_0x168fb_31 && P_0x168fb_31_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_31 ?\<sigma> \<and> block_usage P_0x168fb_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_31_def P_0x168fb_31_regions_def post: Q_0x1689b_31_def regionset: P_0x168fb_31_regions_set_def)

definition P_0x1682a_false_32 :: state_pred where
  \<open>P_0x1682a_false_32 \<sigma> \<equiv> RIP \<sigma> = 0x1682a \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x1682a_false_32_def[Ps]

definition P_0x1682a_false_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1682a_false_32_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (15, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x1682a_false_32_regions :: state_pred where
  \<open>P_0x1682a_false_32_regions \<sigma> \<equiv> \<exists>regions. P_0x1682a_false_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16841_32 :: state_pred where
  \<open>Q_0x16841_32 \<sigma> \<equiv> RIP \<sigma> = 0x16841 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x16841_32_def[Qs]

schematic_goal parallels_open_0_6_0x1682a_0x1683f_32[blocks]:
  assumes \<open>(P_0x1682a_false_32 && P_0x1682a_false_32_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x1683f 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16841_32 ?\<sigma> \<and> block_usage P_0x1682a_false_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1682a_false_32_def P_0x1682a_false_32_regions_def post: Q_0x16841_32_def regionset: P_0x1682a_false_32_regions_set_def)

definition P_0x16841_33 :: state_pred where
  \<open>P_0x16841_33 \<sigma> \<equiv> RIP \<sigma> = 0x16841 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16841_33_def[Ps]

definition P_0x16841_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16841_33_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (15, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16841_33_regions :: state_pred where
  \<open>P_0x16841_33_regions \<sigma> \<equiv> \<exists>regions. P_0x16841_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_lseek64_addr_0x16841_33 :: state_pred where
  \<open>Q_lseek64_addr_0x16841_33 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = lseek64_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_lseek64_addr_0x16841_33_def[Qs]

schematic_goal parallels_open_0_1_0x16841_0x16841_33[blocks]:
  assumes \<open>(P_0x16841_33 && P_0x16841_33_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16841 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_lseek64_addr_0x16841_33 ?\<sigma> \<and> block_usage P_0x16841_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16841_33_def P_0x16841_33_regions_def post: Q_lseek64_addr_0x16841_33_def regionset: P_0x16841_33_regions_set_def)

definition P_0x16846_34 :: state_pred where
  \<open>P_0x16846_34 \<sigma> \<equiv> RIP \<sigma> = 0x16846 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16846_34_def[Ps]

definition P_0x16846_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16846_34_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (15, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16846_34_regions :: state_pred where
  \<open>P_0x16846_34_regions \<sigma> \<equiv> \<exists>regions. P_0x16846_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1684a_34 :: state_pred where
  \<open>Q_0x1684a_34 \<sigma> \<equiv> RIP \<sigma> = 0x1684a \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x1684a_34_def[Qs]

schematic_goal parallels_open_0_1_0x16846_0x16846_34[blocks]:
  assumes \<open>(P_0x16846_34 && P_0x16846_34_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16846 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1684a_34 ?\<sigma> \<and> block_usage P_0x16846_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16846_34_def P_0x16846_34_regions_def post: Q_0x1684a_34_def regionset: P_0x16846_34_regions_set_def)

definition P_0x1684a_true_35 :: state_pred where
  \<open>P_0x1684a_true_35 \<sigma> \<equiv> RIP \<sigma> = 0x1684a \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x1684a_true_35_def[Ps]

definition P_0x1684a_true_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1684a_true_35_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x1684a_true_35_regions :: state_pred where
  \<open>P_0x1684a_true_35_regions \<sigma> \<equiv> \<exists>regions. P_0x1684a_true_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e7_35 :: state_pred where
  \<open>Q_0x168e7_35 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168e7_35_def[Qs]

schematic_goal parallels_open_0_3_0x1684a_0x168e4_35[blocks]:
  assumes \<open>(P_0x1684a_true_35 && P_0x1684a_true_35_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168e4 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e7_35 ?\<sigma> \<and> block_usage P_0x1684a_true_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1684a_true_35_def P_0x1684a_true_35_regions_def post: Q_0x168e7_35_def regionset: P_0x1684a_true_35_regions_set_def)

definition P_0x168e7_true_36 :: state_pred where
  \<open>P_0x168e7_true_36 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e7_true_36_def[Ps]

definition P_0x168e7_true_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_true_36_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e7_true_36_regions :: state_pred where
  \<open>P_0x168e7_true_36_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_true_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ee_36 :: state_pred where
  \<open>Q_0x168ee_36 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168ee_36_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_36[blocks]:
  assumes \<open>(P_0x168e7_true_36 && P_0x168e7_true_36_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ee_36 ?\<sigma> \<and> block_usage P_0x168e7_true_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_true_36_def P_0x168e7_true_36_regions_def post: Q_0x168ee_36_def regionset: P_0x168e7_true_36_regions_set_def)

definition P_0x168e7_false_37 :: state_pred where
  \<open>P_0x168e7_false_37 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e7_false_37_def[Ps]

definition P_0x168e7_false_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_false_37_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e7_false_37_regions :: state_pred where
  \<open>P_0x168e7_false_37_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_false_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e9_37 :: state_pred where
  \<open>Q_0x168e9_37 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168e9_37_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_37[blocks]:
  assumes \<open>(P_0x168e7_false_37 && P_0x168e7_false_37_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e9_37 ?\<sigma> \<and> block_usage P_0x168e7_false_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_false_37_def P_0x168e7_false_37_regions_def post: Q_0x168e9_37_def regionset: P_0x168e7_false_37_regions_set_def)

definition P_0x168e9_38 :: state_pred where
  \<open>P_0x168e9_38 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e9_38_def[Ps]

definition P_0x168e9_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e9_38_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e9_38_regions :: state_pred where
  \<open>P_0x168e9_38_regions \<sigma> \<equiv> \<exists>regions. P_0x168e9_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x168e9_38 :: state_pred where
  \<open>Q_qemu_free_addr_0x168e9_38 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_qemu_free_addr_0x168e9_38_def[Qs]

schematic_goal parallels_open_0_1_0x168e9_0x168e9_38[blocks]:
  assumes \<open>(P_0x168e9_38 && P_0x168e9_38_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e9 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x168e9_38 ?\<sigma> \<and> block_usage P_0x168e9_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e9_38_def P_0x168e9_38_regions_def post: Q_qemu_free_addr_0x168e9_38_def regionset: P_0x168e9_38_regions_set_def)

definition P_0x168ee_39 :: state_pred where
  \<open>P_0x168ee_39 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168ee_39_def[Ps]

definition P_0x168ee_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ee_39_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168ee_39_regions :: state_pred where
  \<open>P_0x168ee_39_regions \<sigma> \<equiv> \<exists>regions. P_0x168ee_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_39 :: state_pred where
  \<open>Q_0x168f6_39 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168f6_39_def[Qs]

schematic_goal parallels_open_0_2_0x168ee_0x168f0_39[blocks]:
  assumes \<open>(P_0x168ee_39 && P_0x168ee_39_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168f0 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_39 ?\<sigma> \<and> block_usage P_0x168ee_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ee_39_def P_0x168ee_39_regions_def post: Q_0x168f6_39_def regionset: P_0x168ee_39_regions_set_def)

definition P_0x168f6_40 :: state_pred where
  \<open>P_0x168f6_40 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168f6_40_def[Ps]

definition P_0x168f6_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_40_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168f6_40_regions :: state_pred where
  \<open>P_0x168f6_40_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_40 :: state_pred where
  \<open>Q_close_addr_0x168f6_40 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_close_addr_0x168f6_40_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_40[blocks]:
  assumes \<open>(P_0x168f6_40 && P_0x168f6_40_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_40 ?\<sigma> \<and> block_usage P_0x168f6_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_40_def P_0x168f6_40_regions_def post: Q_close_addr_0x168f6_40_def regionset: P_0x168f6_40_regions_set_def)

definition P_0x168fb_41 :: state_pred where
  \<open>P_0x168fb_41 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168fb_41_def[Ps]

definition P_0x168fb_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_41_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168fb_41_regions :: state_pred where
  \<open>P_0x168fb_41_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_41 :: state_pred where
  \<open>Q_0x1689b_41 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_41_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_41[blocks]:
  assumes \<open>(P_0x168fb_41 && P_0x168fb_41_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_41 ?\<sigma> \<and> block_usage P_0x168fb_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_41_def P_0x168fb_41_regions_def post: Q_0x1689b_41_def regionset: P_0x168fb_41_regions_set_def)

definition P_0x1684a_false_42 :: state_pred where
  \<open>P_0x1684a_false_42 \<sigma> \<equiv> RIP \<sigma> = 0x1684a \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x1684a_false_42_def[Ps]

definition P_0x1684a_false_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1684a_false_42_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x1684a_false_42_regions :: state_pred where
  \<open>P_0x1684a_false_42_regions \<sigma> \<equiv> \<exists>regions. P_0x1684a_false_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16864_42 :: state_pred where
  \<open>Q_0x16864_42 \<sigma> \<equiv> RIP \<sigma> = 0x16864 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x16864_42_def[Qs]

schematic_goal parallels_open_0_7_0x1684a_0x16861_42[blocks]:
  assumes \<open>(P_0x1684a_false_42 && P_0x1684a_false_42_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x16861 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16864_42 ?\<sigma> \<and> block_usage P_0x1684a_false_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1684a_false_42_def P_0x1684a_false_42_regions_def post: Q_0x16864_42_def regionset: P_0x1684a_false_42_regions_set_def)

definition P_0x16864_43 :: state_pred where
  \<open>P_0x16864_43 \<sigma> \<equiv> RIP \<sigma> = 0x16864 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16864_43_def[Ps]

definition P_0x16864_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16864_43_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16864_43_regions :: state_pred where
  \<open>P_0x16864_43_regions \<sigma> \<equiv> \<exists>regions. P_0x16864_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_malloc_addr_0x16864_43 :: state_pred where
  \<open>Q_qemu_malloc_addr_0x16864_43 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_malloc_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_qemu_malloc_addr_0x16864_43_def[Qs]

schematic_goal parallels_open_0_1_0x16864_0x16864_43[blocks]:
  assumes \<open>(P_0x16864_43 && P_0x16864_43_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16864 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_malloc_addr_0x16864_43 ?\<sigma> \<and> block_usage P_0x16864_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16864_43_def P_0x16864_43_regions_def post: Q_qemu_malloc_addr_0x16864_43_def regionset: P_0x16864_43_regions_set_def)

definition P_0x16869_44 :: state_pred where
  \<open>P_0x16869_44 \<sigma> \<equiv> RIP \<sigma> = 0x16869 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16869_44_def[Ps]

definition P_0x16869_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16869_44_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16869_44_regions :: state_pred where
  \<open>P_0x16869_44_regions \<sigma> \<equiv> \<exists>regions. P_0x16869_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16870_44 :: state_pred where
  \<open>Q_0x16870_44 \<sigma> \<equiv> RIP \<sigma> = 0x16870 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x16870_44_def[Qs]

schematic_goal parallels_open_0_2_0x16869_0x1686d_44[blocks]:
  assumes \<open>(P_0x16869_44 && P_0x16869_44_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1686d 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16870_44 ?\<sigma> \<and> block_usage P_0x16869_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16869_44_def P_0x16869_44_regions_def post: Q_0x16870_44_def regionset: P_0x16869_44_regions_set_def)

definition P_0x16870_true_45 :: state_pred where
  \<open>P_0x16870_true_45 \<sigma> \<equiv> RIP \<sigma> = 0x16870 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16870_true_45_def[Ps]

definition P_0x16870_true_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16870_true_45_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16870_true_45_regions :: state_pred where
  \<open>P_0x16870_true_45_regions \<sigma> \<equiv> \<exists>regions. P_0x16870_true_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_45 :: state_pred where
  \<open>Q_0x168f6_45 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168f6_45_def[Qs]

schematic_goal parallels_open_0_3_0x16870_0x168f0_45[blocks]:
  assumes \<open>(P_0x16870_true_45 && P_0x16870_true_45_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168f0 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_45 ?\<sigma> \<and> block_usage P_0x16870_true_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16870_true_45_def P_0x16870_true_45_regions_def post: Q_0x168f6_45_def regionset: P_0x16870_true_45_regions_set_def)

definition P_0x168f6_46 :: state_pred where
  \<open>P_0x168f6_46 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168f6_46_def[Ps]

definition P_0x168f6_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_46_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168f6_46_regions :: state_pred where
  \<open>P_0x168f6_46_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_46 :: state_pred where
  \<open>Q_close_addr_0x168f6_46 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_close_addr_0x168f6_46_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_46[blocks]:
  assumes \<open>(P_0x168f6_46 && P_0x168f6_46_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_46 ?\<sigma> \<and> block_usage P_0x168f6_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_46_def P_0x168f6_46_regions_def post: Q_close_addr_0x168f6_46_def regionset: P_0x168f6_46_regions_set_def)

definition P_0x168fb_47 :: state_pred where
  \<open>P_0x168fb_47 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RAX \<sigma> = close_0x168f6_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168fb_47_def[Ps]

definition P_0x168fb_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_47_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168fb_47_regions :: state_pred where
  \<open>P_0x168fb_47_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_47 :: state_pred where
  \<open>Q_0x1689b_47 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_47_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_47[blocks]:
  assumes \<open>(P_0x168fb_47 && P_0x168fb_47_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_47 ?\<sigma> \<and> block_usage P_0x168fb_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_47_def P_0x168fb_47_regions_def post: Q_0x1689b_47_def regionset: P_0x168fb_47_regions_set_def)

definition P_0x16870_false_48 :: state_pred where
  \<open>P_0x16870_false_48 \<sigma> \<equiv> RIP \<sigma> = 0x16870 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16870_false_48_def[Ps]

definition P_0x16870_false_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16870_false_48_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16870_false_48_regions :: state_pred where
  \<open>P_0x16870_false_48_regions \<sigma> \<equiv> \<exists>regions. P_0x16870_false_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16884_48 :: state_pred where
  \<open>Q_0x16884_48 \<sigma> \<equiv> RIP \<sigma> = 0x16884 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x16884_48_def[Qs]

schematic_goal parallels_open_0_6_0x16870_0x16881_48[blocks]:
  assumes \<open>(P_0x16870_false_48 && P_0x16870_false_48_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x16881 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16884_48 ?\<sigma> \<and> block_usage P_0x16870_false_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16870_false_48_def P_0x16870_false_48_regions_def post: Q_0x16884_48_def regionset: P_0x16870_false_48_regions_set_def)

definition P_0x16884_49 :: state_pred where
  \<open>P_0x16884_49 \<sigma> \<equiv> RIP \<sigma> = 0x16884 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16884_49_def[Ps]

definition P_0x16884_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16884_49_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16884_49_regions :: state_pred where
  \<open>P_0x16884_49_regions \<sigma> \<equiv> \<exists>regions. P_0x16884_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_read_addr_0x16884_49 :: state_pred where
  \<open>Q_read_addr_0x16884_49 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = read_addr \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_read_addr_0x16884_49_def[Qs]

schematic_goal parallels_open_0_1_0x16884_0x16884_49[blocks]:
  assumes \<open>(P_0x16884_49 && P_0x16884_49_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16884 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_read_addr_0x16884_49 ?\<sigma> \<and> block_usage P_0x16884_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16884_49_def P_0x16884_49_regions_def post: Q_read_addr_0x16884_49_def regionset: P_0x16884_49_regions_set_def)

definition P_0x16889_50 :: state_pred where
  \<open>P_0x16889_50 \<sigma> \<equiv> RIP \<sigma> = 0x16889 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16889_50_def[Ps]

definition P_0x16889_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16889_50_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16889_50_regions :: state_pred where
  \<open>P_0x16889_50_regions \<sigma> \<equiv> \<exists>regions. P_0x16889_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16899_50 :: state_pred where
  \<open>Q_0x16899_50 \<sigma> \<equiv> RIP \<sigma> = 0x16899 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x16899_50_def[Qs]

schematic_goal parallels_open_0_4_0x16889_0x16896_50[blocks]:
  assumes \<open>(P_0x16889_50 && P_0x16889_50_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x16896 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16899_50 ?\<sigma> \<and> block_usage P_0x16889_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16889_50_def P_0x16889_50_regions_def post: Q_0x16899_50_def regionset: P_0x16889_50_regions_set_def)

definition P_0x16899_true_51 :: state_pred where
  \<open>P_0x16899_true_51 \<sigma> \<equiv> RIP \<sigma> = 0x16899 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16899_true_51_def[Ps]

definition P_0x16899_true_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16899_true_51_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16899_true_51_regions :: state_pred where
  \<open>P_0x16899_true_51_regions \<sigma> \<equiv> \<exists>regions. P_0x16899_true_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e7_51 :: state_pred where
  \<open>Q_0x168e7_51 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168e7_51_def[Qs]

schematic_goal parallels_open_0_3_0x16899_0x168e4_51[blocks]:
  assumes \<open>(P_0x16899_true_51 && P_0x16899_true_51_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168e4 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e7_51 ?\<sigma> \<and> block_usage P_0x16899_true_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16899_true_51_def P_0x16899_true_51_regions_def post: Q_0x168e7_51_def regionset: P_0x16899_true_51_regions_set_def)

definition P_0x168e7_true_52 :: state_pred where
  \<open>P_0x168e7_true_52 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e7_true_52_def[Ps]

definition P_0x168e7_true_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_true_52_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e7_true_52_regions :: state_pred where
  \<open>P_0x168e7_true_52_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_true_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ee_52 :: state_pred where
  \<open>Q_0x168ee_52 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168ee_52_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_52[blocks]:
  assumes \<open>(P_0x168e7_true_52 && P_0x168e7_true_52_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ee_52 ?\<sigma> \<and> block_usage P_0x168e7_true_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_true_52_def P_0x168e7_true_52_regions_def post: Q_0x168ee_52_def regionset: P_0x168e7_true_52_regions_set_def)

definition P_0x168e7_false_53 :: state_pred where
  \<open>P_0x168e7_false_53 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e7_false_53_def[Ps]

definition P_0x168e7_false_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_false_53_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e7_false_53_regions :: state_pred where
  \<open>P_0x168e7_false_53_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_false_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e9_53 :: state_pred where
  \<open>Q_0x168e9_53 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168e9_53_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_53[blocks]:
  assumes \<open>(P_0x168e7_false_53 && P_0x168e7_false_53_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e9_53 ?\<sigma> \<and> block_usage P_0x168e7_false_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_false_53_def P_0x168e7_false_53_regions_def post: Q_0x168e9_53_def regionset: P_0x168e7_false_53_regions_set_def)

definition P_0x168e9_54 :: state_pred where
  \<open>P_0x168e9_54 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e9_54_def[Ps]

definition P_0x168e9_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e9_54_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e9_54_regions :: state_pred where
  \<open>P_0x168e9_54_regions \<sigma> \<equiv> \<exists>regions. P_0x168e9_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x168e9_54 :: state_pred where
  \<open>Q_qemu_free_addr_0x168e9_54 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_qemu_free_addr_0x168e9_54_def[Qs]

schematic_goal parallels_open_0_1_0x168e9_0x168e9_54[blocks]:
  assumes \<open>(P_0x168e9_54 && P_0x168e9_54_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e9 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x168e9_54 ?\<sigma> \<and> block_usage P_0x168e9_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e9_54_def P_0x168e9_54_regions_def post: Q_qemu_free_addr_0x168e9_54_def regionset: P_0x168e9_54_regions_set_def)

definition P_0x168ee_55 :: state_pred where
  \<open>P_0x168ee_55 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168ee_55_def[Ps]

definition P_0x168ee_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ee_55_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168ee_55_regions :: state_pred where
  \<open>P_0x168ee_55_regions \<sigma> \<equiv> \<exists>regions. P_0x168ee_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_55 :: state_pred where
  \<open>Q_0x168f6_55 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168f6_55_def[Qs]

schematic_goal parallels_open_0_2_0x168ee_0x168f0_55[blocks]:
  assumes \<open>(P_0x168ee_55 && P_0x168ee_55_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168f0 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_55 ?\<sigma> \<and> block_usage P_0x168ee_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ee_55_def P_0x168ee_55_regions_def post: Q_0x168f6_55_def regionset: P_0x168ee_55_regions_set_def)

definition P_0x168f6_56 :: state_pred where
  \<open>P_0x168f6_56 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168f6_56_def[Ps]

definition P_0x168f6_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_56_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168f6_56_regions :: state_pred where
  \<open>P_0x168f6_56_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_56 :: state_pred where
  \<open>Q_close_addr_0x168f6_56 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_close_addr_0x168f6_56_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_56[blocks]:
  assumes \<open>(P_0x168f6_56 && P_0x168f6_56_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_56 ?\<sigma> \<and> block_usage P_0x168f6_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_56_def P_0x168f6_56_regions_def post: Q_close_addr_0x168f6_56_def regionset: P_0x168f6_56_regions_set_def)

definition P_0x168fb_57 :: state_pred where
  \<open>P_0x168fb_57 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168fb_57_def[Ps]

definition P_0x168fb_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_57_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168fb_57_regions :: state_pred where
  \<open>P_0x168fb_57_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_57 :: state_pred where
  \<open>Q_0x1689b_57 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_57_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_57[blocks]:
  assumes \<open>(P_0x168fb_57 && P_0x168fb_57_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_57 ?\<sigma> \<and> block_usage P_0x168fb_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_57_def P_0x168fb_57_regions_def post: Q_0x1689b_57_def regionset: P_0x168fb_57_regions_set_def)

definition P_0x16899_false_58 :: state_pred where
  \<open>P_0x16899_false_58 \<sigma> \<equiv> RIP \<sigma> = 0x16899 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16899_false_58_def[Ps]

definition P_0x16899_false_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16899_false_58_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16899_false_58_regions :: state_pred where
  \<open>P_0x16899_false_58_regions \<sigma> \<equiv> \<exists>regions. P_0x16899_false_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_58 :: state_pred where
  \<open>Q_0x1689b_58 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_58_def[Qs]

schematic_goal parallels_open_0_1_0x16899_0x16899_58[blocks]:
  assumes \<open>(P_0x16899_false_58 && P_0x16899_false_58_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16899 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_58 ?\<sigma> \<and> block_usage P_0x16899_false_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16899_false_58_def P_0x16899_false_58_regions_def post: Q_0x1689b_58_def regionset: P_0x16899_false_58_regions_set_def)

definition P_0x168d0_false_59 :: state_pred where
  \<open>P_0x168d0_false_59 \<sigma> \<equiv> RIP \<sigma> = 0x168d0 \<and> RAX \<sigma> = open64_0x168c7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x168c7_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168cc\<close>
declare P_0x168d0_false_59_def[Ps]

definition P_0x168d0_false_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168d0_false_59_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168d0_false_59_regions :: state_pred where
  \<open>P_0x168d0_false_59_regions \<sigma> \<equiv> \<exists>regions. P_0x168d0_false_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_59 :: state_pred where
  \<open>Q_0x1689b_59 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_59_def[Qs]

schematic_goal parallels_open_0_3_0x168d0_0x168dc_59[blocks]:
  assumes \<open>(P_0x168d0_false_59 && P_0x168d0_false_59_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168dc 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_59 ?\<sigma> \<and> block_usage P_0x168d0_false_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168d0_false_59_def P_0x168d0_false_59_regions_def post: Q_0x1689b_59_def regionset: P_0x168d0_false_59_regions_set_def)

definition P_0x167d5_false_60 :: state_pred where
  \<open>P_0x167d5_false_60 \<sigma> \<equiv> RIP \<sigma> = 0x167d5 \<and> RAX \<sigma> = open64_0x167cc_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167d1\<close>
declare P_0x167d5_false_60_def[Ps]

definition P_0x167d5_false_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167d5_false_60_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (10, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x167d5_false_60_regions :: state_pred where
  \<open>P_0x167d5_false_60_regions \<sigma> \<equiv> \<exists>regions. P_0x167d5_false_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x167ef_60 :: state_pred where
  \<open>Q_0x167ef_60 \<sigma> \<equiv> RIP \<sigma> = 0x167ef \<and> RAX \<sigma> = open64_0x167cc_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167d1\<close>
declare Q_0x167ef_60_def[Qs]

schematic_goal parallels_open_0_6_0x167d5_0x167ed_60[blocks]:
  assumes \<open>(P_0x167d5_false_60 && P_0x167d5_false_60_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 6 0x167ed 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x167ef_60 ?\<sigma> \<and> block_usage P_0x167d5_false_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167d5_false_60_def P_0x167d5_false_60_regions_def post: Q_0x167ef_60_def regionset: P_0x167d5_false_60_regions_set_def)

definition P_0x167ef_61 :: state_pred where
  \<open>P_0x167ef_61 \<sigma> \<equiv> RIP \<sigma> = 0x167ef \<and> RAX \<sigma> = open64_0x167cc_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167d1\<close>
declare P_0x167ef_61_def[Ps]

definition P_0x167ef_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167ef_61_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167ef_61_regions :: state_pred where
  \<open>P_0x167ef_61_regions \<sigma> \<equiv> \<exists>regions. P_0x167ef_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_read_ok_addr_0x167ef_61 :: state_pred where
  \<open>Q_qemu_read_ok_addr_0x167ef_61 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_read_ok_addr \<and> RAX \<sigma> = open64_0x167cc_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_qemu_read_ok_addr_0x167ef_61_def[Qs]

schematic_goal parallels_open_0_1_0x167ef_0x167ef_61[blocks]:
  assumes \<open>(P_0x167ef_61 && P_0x167ef_61_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x167ef 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_read_ok_addr_0x167ef_61 ?\<sigma> \<and> block_usage P_0x167ef_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167ef_61_def P_0x167ef_61_regions_def post: Q_qemu_read_ok_addr_0x167ef_61_def regionset: P_0x167ef_61_regions_set_def)

definition P_0x167f4_62 :: state_pred where
  \<open>P_0x167f4_62 \<sigma> \<equiv> RIP \<sigma> = 0x167f4 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x167f4_62_def[Ps]

definition P_0x167f4_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167f4_62_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167f4_62_regions :: state_pred where
  \<open>P_0x167f4_62_regions \<sigma> \<equiv> \<exists>regions. P_0x167f4_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x167f6_62 :: state_pred where
  \<open>Q_0x167f6_62 \<sigma> \<equiv> RIP \<sigma> = 0x167f6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x167f6_62_def[Qs]

schematic_goal parallels_open_0_1_0x167f4_0x167f4_62[blocks]:
  assumes \<open>(P_0x167f4_62 && P_0x167f4_62_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x167f4 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x167f6_62 ?\<sigma> \<and> block_usage P_0x167f4_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167f4_62_def P_0x167f4_62_regions_def post: Q_0x167f6_62_def regionset: P_0x167f4_62_regions_set_def)

definition P_0x167f6_true_63 :: state_pred where
  \<open>P_0x167f6_true_63 \<sigma> \<equiv> RIP \<sigma> = 0x167f6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x167f6_true_63_def[Ps]

definition P_0x167f6_true_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167f6_true_63_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167f6_true_63_regions :: state_pred where
  \<open>P_0x167f6_true_63_regions \<sigma> \<equiv> \<exists>regions. P_0x167f6_true_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e7_63 :: state_pred where
  \<open>Q_0x168e7_63 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e7_63_def[Qs]

schematic_goal parallels_open_0_3_0x167f6_0x168e4_63[blocks]:
  assumes \<open>(P_0x167f6_true_63 && P_0x167f6_true_63_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168e4 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e7_63 ?\<sigma> \<and> block_usage P_0x167f6_true_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167f6_true_63_def P_0x167f6_true_63_regions_def post: Q_0x168e7_63_def regionset: P_0x167f6_true_63_regions_set_def)

definition P_0x168e7_true_64 :: state_pred where
  \<open>P_0x168e7_true_64 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_true_64_def[Ps]

definition P_0x168e7_true_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_true_64_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_true_64_regions :: state_pred where
  \<open>P_0x168e7_true_64_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_true_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ee_64 :: state_pred where
  \<open>Q_0x168ee_64 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x168ee_64_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_64[blocks]:
  assumes \<open>(P_0x168e7_true_64 && P_0x168e7_true_64_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ee_64 ?\<sigma> \<and> block_usage P_0x168e7_true_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_true_64_def P_0x168e7_true_64_regions_def post: Q_0x168ee_64_def regionset: P_0x168e7_true_64_regions_set_def)

definition P_0x168e7_false_65 :: state_pred where
  \<open>P_0x168e7_false_65 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_false_65_def[Ps]

definition P_0x168e7_false_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_false_65_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_false_65_regions :: state_pred where
  \<open>P_0x168e7_false_65_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_false_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e9_65 :: state_pred where
  \<open>Q_0x168e9_65 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e9_65_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_65[blocks]:
  assumes \<open>(P_0x168e7_false_65 && P_0x168e7_false_65_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e9_65 ?\<sigma> \<and> block_usage P_0x168e7_false_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_false_65_def P_0x168e7_false_65_regions_def post: Q_0x168e9_65_def regionset: P_0x168e7_false_65_regions_set_def)

definition P_0x168e9_66 :: state_pred where
  \<open>P_0x168e9_66 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e9_66_def[Ps]

definition P_0x168e9_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e9_66_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e9_66_regions :: state_pred where
  \<open>P_0x168e9_66_regions \<sigma> \<equiv> \<exists>regions. P_0x168e9_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x168e9_66 :: state_pred where
  \<open>Q_qemu_free_addr_0x168e9_66 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_qemu_free_addr_0x168e9_66_def[Qs]

schematic_goal parallels_open_0_1_0x168e9_0x168e9_66[blocks]:
  assumes \<open>(P_0x168e9_66 && P_0x168e9_66_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e9 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x168e9_66 ?\<sigma> \<and> block_usage P_0x168e9_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e9_66_def P_0x168e9_66_regions_def post: Q_qemu_free_addr_0x168e9_66_def regionset: P_0x168e9_66_regions_set_def)

definition P_0x168ee_67 :: state_pred where
  \<open>P_0x168ee_67 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x168ee_67_def[Ps]

definition P_0x168ee_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ee_67_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x168ee_67_regions :: state_pred where
  \<open>P_0x168ee_67_regions \<sigma> \<equiv> \<exists>regions. P_0x168ee_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_67 :: state_pred where
  \<open>Q_0x168f6_67 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x168f6_67_def[Qs]

schematic_goal parallels_open_0_2_0x168ee_0x168f0_67[blocks]:
  assumes \<open>(P_0x168ee_67 && P_0x168ee_67_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168f0 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_67 ?\<sigma> \<and> block_usage P_0x168ee_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ee_67_def P_0x168ee_67_regions_def post: Q_0x168f6_67_def regionset: P_0x168ee_67_regions_set_def)

definition P_0x168f6_68 :: state_pred where
  \<open>P_0x168f6_68 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x168f6_68_def[Ps]

definition P_0x168f6_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_68_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168f6_68_regions :: state_pred where
  \<open>P_0x168f6_68_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_68 :: state_pred where
  \<open>Q_close_addr_0x168f6_68 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare Q_close_addr_0x168f6_68_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_68[blocks]:
  assumes \<open>(P_0x168f6_68 && P_0x168f6_68_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_68 ?\<sigma> \<and> block_usage P_0x168f6_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_68_def P_0x168f6_68_regions_def post: Q_close_addr_0x168f6_68_def regionset: P_0x168f6_68_regions_set_def)

definition P_0x168fb_69 :: state_pred where
  \<open>P_0x168fb_69 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare P_0x168fb_69_def[Ps]

definition P_0x168fb_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_69_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168fb_69_regions :: state_pred where
  \<open>P_0x168fb_69_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_69 :: state_pred where
  \<open>Q_0x1689b_69 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_69_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_69[blocks]:
  assumes \<open>(P_0x168fb_69 && P_0x168fb_69_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_69 ?\<sigma> \<and> block_usage P_0x168fb_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_69_def P_0x168fb_69_regions_def post: Q_0x1689b_69_def regionset: P_0x168fb_69_regions_set_def)

definition P_0x167f6_false_70 :: state_pred where
  \<open>P_0x167f6_false_70 \<sigma> \<equiv> RIP \<sigma> = 0x167f6 \<and> RAX \<sigma> = ucast (qemu_read_ok_0x167ef_retval) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x167f6_false_70_def[Ps]

definition P_0x167f6_false_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x167f6_false_70_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x167f6_false_70_regions :: state_pred where
  \<open>P_0x167f6_false_70_regions \<sigma> \<equiv> \<exists>regions. P_0x167f6_false_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1681c_70 :: state_pred where
  \<open>Q_0x1681c_70 \<sigma> \<equiv> RIP \<sigma> = 0x1681c \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x1681c_70_def[Qs]

schematic_goal parallels_open_0_6_0x167f6_0x16819_70[blocks]:
  assumes \<open>(P_0x167f6_false_70 && P_0x167f6_false_70_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 6 0x16819 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1681c_70 ?\<sigma> \<and> block_usage P_0x167f6_false_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x167f6_false_70_def P_0x167f6_false_70_regions_def post: Q_0x1681c_70_def regionset: P_0x167f6_false_70_regions_set_def)

definition P_0x1681c_true_71 :: state_pred where
  \<open>P_0x1681c_true_71 \<sigma> \<equiv> RIP \<sigma> = 0x1681c \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x1681c_true_71_def[Ps]

definition P_0x1681c_true_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1681c_true_71_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1681c_true_71_regions :: state_pred where
  \<open>P_0x1681c_true_71_regions \<sigma> \<equiv> \<exists>regions. P_0x1681c_true_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e7_71 :: state_pred where
  \<open>Q_0x168e7_71 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e7_71_def[Qs]

schematic_goal parallels_open_0_3_0x1681c_0x168e4_71[blocks]:
  assumes \<open>(P_0x1681c_true_71 && P_0x1681c_true_71_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168e4 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e7_71 ?\<sigma> \<and> block_usage P_0x1681c_true_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1681c_true_71_def P_0x1681c_true_71_regions_def post: Q_0x168e7_71_def regionset: P_0x1681c_true_71_regions_set_def)

definition P_0x168e7_true_72 :: state_pred where
  \<open>P_0x168e7_true_72 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_true_72_def[Ps]

definition P_0x168e7_true_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_true_72_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_true_72_regions :: state_pred where
  \<open>P_0x168e7_true_72_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_true_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ee_72 :: state_pred where
  \<open>Q_0x168ee_72 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_0x168ee_72_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_72[blocks]:
  assumes \<open>(P_0x168e7_true_72 && P_0x168e7_true_72_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ee_72 ?\<sigma> \<and> block_usage P_0x168e7_true_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_true_72_def P_0x168e7_true_72_regions_def post: Q_0x168ee_72_def regionset: P_0x168e7_true_72_regions_set_def)

definition P_0x168e7_false_73 :: state_pred where
  \<open>P_0x168e7_false_73 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_false_73_def[Ps]

definition P_0x168e7_false_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_false_73_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_false_73_regions :: state_pred where
  \<open>P_0x168e7_false_73_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_false_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e9_73 :: state_pred where
  \<open>Q_0x168e9_73 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e9_73_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_73[blocks]:
  assumes \<open>(P_0x168e7_false_73 && P_0x168e7_false_73_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e9_73 ?\<sigma> \<and> block_usage P_0x168e7_false_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_false_73_def P_0x168e7_false_73_regions_def post: Q_0x168e9_73_def regionset: P_0x168e7_false_73_regions_set_def)

definition P_0x168e9_74 :: state_pred where
  \<open>P_0x168e9_74 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e9_74_def[Ps]

definition P_0x168e9_74_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e9_74_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e9_74_regions :: state_pred where
  \<open>P_0x168e9_74_regions \<sigma> \<equiv> \<exists>regions. P_0x168e9_74_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x168e9_74 :: state_pred where
  \<open>Q_qemu_free_addr_0x168e9_74 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_qemu_free_addr_0x168e9_74_def[Qs]

schematic_goal parallels_open_0_1_0x168e9_0x168e9_74[blocks]:
  assumes \<open>(P_0x168e9_74 && P_0x168e9_74_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e9 74 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x168e9_74 ?\<sigma> \<and> block_usage P_0x168e9_74_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e9_74_def P_0x168e9_74_regions_def post: Q_qemu_free_addr_0x168e9_74_def regionset: P_0x168e9_74_regions_set_def)

definition P_0x168ee_75 :: state_pred where
  \<open>P_0x168ee_75 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare P_0x168ee_75_def[Ps]

definition P_0x168ee_75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ee_75_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x168ee_75_regions :: state_pred where
  \<open>P_0x168ee_75_regions \<sigma> \<equiv> \<exists>regions. P_0x168ee_75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_75 :: state_pred where
  \<open>Q_0x168f6_75 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_0x168f6_75_def[Qs]

schematic_goal parallels_open_0_2_0x168ee_0x168f0_75[blocks]:
  assumes \<open>(P_0x168ee_75 && P_0x168ee_75_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168f0 75 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_75 ?\<sigma> \<and> block_usage P_0x168ee_75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ee_75_def P_0x168ee_75_regions_def post: Q_0x168f6_75_def regionset: P_0x168ee_75_regions_set_def)

definition P_0x168f6_76 :: state_pred where
  \<open>P_0x168f6_76 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare P_0x168f6_76_def[Ps]

definition P_0x168f6_76_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_76_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168f6_76_regions :: state_pred where
  \<open>P_0x168f6_76_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_76_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_76 :: state_pred where
  \<open>Q_close_addr_0x168f6_76 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare Q_close_addr_0x168f6_76_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_76[blocks]:
  assumes \<open>(P_0x168f6_76 && P_0x168f6_76_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 76 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_76 ?\<sigma> \<and> block_usage P_0x168f6_76_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_76_def P_0x168f6_76_regions_def post: Q_close_addr_0x168f6_76_def regionset: P_0x168f6_76_regions_set_def)

definition P_0x168fb_77 :: state_pred where
  \<open>P_0x168fb_77 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare P_0x168fb_77_def[Ps]

definition P_0x168fb_77_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_77_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168fb_77_regions :: state_pred where
  \<open>P_0x168fb_77_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_77_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_77 :: state_pred where
  \<open>Q_0x1689b_77 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_77_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_77[blocks]:
  assumes \<open>(P_0x168fb_77 && P_0x168fb_77_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 77 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_77 ?\<sigma> \<and> block_usage P_0x168fb_77_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_77_def P_0x168fb_77_regions_def post: Q_0x1689b_77_def regionset: P_0x168fb_77_regions_set_def)

definition P_0x1681c_false_78 :: state_pred where
  \<open>P_0x1681c_false_78 \<sigma> \<equiv> RIP \<sigma> = 0x1681c \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x1681c_false_78_def[Ps]

definition P_0x1681c_false_78_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1681c_false_78_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1681c_false_78_regions :: state_pred where
  \<open>P_0x1681c_false_78_regions \<sigma> \<equiv> \<exists>regions. P_0x1681c_false_78_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1682a_78 :: state_pred where
  \<open>Q_0x1682a_78 \<sigma> \<equiv> RIP \<sigma> = 0x1682a \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x1682a_78_def[Qs]

schematic_goal parallels_open_0_3_0x1681c_0x16825_78[blocks]:
  assumes \<open>(P_0x1681c_false_78 && P_0x1681c_false_78_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x16825 78 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1682a_78 ?\<sigma> \<and> block_usage P_0x1681c_false_78_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1681c_false_78_def P_0x1681c_false_78_regions_def post: Q_0x1682a_78_def regionset: P_0x1681c_false_78_regions_set_def)

definition P_0x1682a_true_79 :: state_pred where
  \<open>P_0x1682a_true_79 \<sigma> \<equiv> RIP \<sigma> = 0x1682a \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x1682a_true_79_def[Ps]

definition P_0x1682a_true_79_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1682a_true_79_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1682a_true_79_regions :: state_pred where
  \<open>P_0x1682a_true_79_regions \<sigma> \<equiv> \<exists>regions. P_0x1682a_true_79_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e7_79 :: state_pred where
  \<open>Q_0x168e7_79 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e7_79_def[Qs]

schematic_goal parallels_open_0_3_0x1682a_0x168e4_79[blocks]:
  assumes \<open>(P_0x1682a_true_79 && P_0x1682a_true_79_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168e4 79 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e7_79 ?\<sigma> \<and> block_usage P_0x1682a_true_79_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1682a_true_79_def P_0x1682a_true_79_regions_def post: Q_0x168e7_79_def regionset: P_0x1682a_true_79_regions_set_def)

definition P_0x168e7_true_80 :: state_pred where
  \<open>P_0x168e7_true_80 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_true_80_def[Ps]

definition P_0x168e7_true_80_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_true_80_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_true_80_regions :: state_pred where
  \<open>P_0x168e7_true_80_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_true_80_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ee_80 :: state_pred where
  \<open>Q_0x168ee_80 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_0x168ee_80_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_80[blocks]:
  assumes \<open>(P_0x168e7_true_80 && P_0x168e7_true_80_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 80 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ee_80 ?\<sigma> \<and> block_usage P_0x168e7_true_80_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_true_80_def P_0x168e7_true_80_regions_def post: Q_0x168ee_80_def regionset: P_0x168e7_true_80_regions_set_def)

definition P_0x168e7_false_81 :: state_pred where
  \<open>P_0x168e7_false_81 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e7_false_81_def[Ps]

definition P_0x168e7_false_81_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_false_81_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e7_false_81_regions :: state_pred where
  \<open>P_0x168e7_false_81_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_false_81_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e9_81 :: state_pred where
  \<open>Q_0x168e9_81 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare Q_0x168e9_81_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_81[blocks]:
  assumes \<open>(P_0x168e7_false_81 && P_0x168e7_false_81_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 81 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e9_81 ?\<sigma> \<and> block_usage P_0x168e7_false_81_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_false_81_def P_0x168e7_false_81_regions_def post: Q_0x168e9_81_def regionset: P_0x168e7_false_81_regions_set_def)

definition P_0x168e9_82 :: state_pred where
  \<open>P_0x168e9_82 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x168e9_82_def[Ps]

definition P_0x168e9_82_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e9_82_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168e9_82_regions :: state_pred where
  \<open>P_0x168e9_82_regions \<sigma> \<equiv> \<exists>regions. P_0x168e9_82_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x168e9_82 :: state_pred where
  \<open>Q_qemu_free_addr_0x168e9_82 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_qemu_free_addr_0x168e9_82_def[Qs]

schematic_goal parallels_open_0_1_0x168e9_0x168e9_82[blocks]:
  assumes \<open>(P_0x168e9_82 && P_0x168e9_82_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e9 82 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x168e9_82 ?\<sigma> \<and> block_usage P_0x168e9_82_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e9_82_def P_0x168e9_82_regions_def post: Q_qemu_free_addr_0x168e9_82_def regionset: P_0x168e9_82_regions_set_def)

definition P_0x168ee_83 :: state_pred where
  \<open>P_0x168ee_83 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare P_0x168ee_83_def[Ps]

definition P_0x168ee_83_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ee_83_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x168ee_83_regions :: state_pred where
  \<open>P_0x168ee_83_regions \<sigma> \<equiv> \<exists>regions. P_0x168ee_83_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_83 :: state_pred where
  \<open>Q_0x168f6_83 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare Q_0x168f6_83_def[Qs]

schematic_goal parallels_open_0_2_0x168ee_0x168f0_83[blocks]:
  assumes \<open>(P_0x168ee_83 && P_0x168ee_83_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168f0 83 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_83 ?\<sigma> \<and> block_usage P_0x168ee_83_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ee_83_def P_0x168ee_83_regions_def post: Q_0x168f6_83_def regionset: P_0x168ee_83_regions_set_def)

definition P_0x168f6_84 :: state_pred where
  \<open>P_0x168f6_84 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)\<close>
declare P_0x168f6_84_def[Ps]

definition P_0x168f6_84_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_84_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168f6_84_regions :: state_pred where
  \<open>P_0x168f6_84_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_84_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_84 :: state_pred where
  \<open>Q_close_addr_0x168f6_84 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare Q_close_addr_0x168f6_84_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_84[blocks]:
  assumes \<open>(P_0x168f6_84 && P_0x168f6_84_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 84 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_84 ?\<sigma> \<and> block_usage P_0x168f6_84_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_84_def P_0x168f6_84_regions_def post: Q_close_addr_0x168f6_84_def regionset: P_0x168f6_84_regions_set_def)

definition P_0x168fb_85 :: state_pred where
  \<open>P_0x168fb_85 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb\<close>
declare P_0x168fb_85_def[Ps]

definition P_0x168fb_85_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_85_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168fb_85_regions :: state_pred where
  \<open>P_0x168fb_85_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_85_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_85 :: state_pred where
  \<open>Q_0x1689b_85 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_85_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_85[blocks]:
  assumes \<open>(P_0x168fb_85 && P_0x168fb_85_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 85 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_85 ?\<sigma> \<and> block_usage P_0x168fb_85_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_85_def P_0x168fb_85_regions_def post: Q_0x1689b_85_def regionset: P_0x168fb_85_regions_set_def)

definition P_0x1682a_false_86 :: state_pred where
  \<open>P_0x1682a_false_86 \<sigma> \<equiv> RIP \<sigma> = 0x1682a \<and> RAX \<sigma> = ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((0x6563617053656572::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word))::64 word) OR ((0x4674756f68746957::64 word) XOR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4\<close>
declare P_0x1682a_false_86_def[Ps]

definition P_0x1682a_false_86_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1682a_false_86_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (15, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x1682a_false_86_regions :: state_pred where
  \<open>P_0x1682a_false_86_regions \<sigma> \<equiv> \<exists>regions. P_0x1682a_false_86_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16841_86 :: state_pred where
  \<open>Q_0x16841_86 \<sigma> \<equiv> RIP \<sigma> = 0x16841 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x16841_86_def[Qs]

schematic_goal parallels_open_0_6_0x1682a_0x1683f_86[blocks]:
  assumes \<open>(P_0x1682a_false_86 && P_0x1682a_false_86_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x1683f 86 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16841_86 ?\<sigma> \<and> block_usage P_0x1682a_false_86_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1682a_false_86_def P_0x1682a_false_86_regions_def post: Q_0x16841_86_def regionset: P_0x1682a_false_86_regions_set_def)

definition P_0x16841_87 :: state_pred where
  \<open>P_0x16841_87 \<sigma> \<equiv> RIP \<sigma> = 0x16841 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x167f4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16841_87_def[Ps]

definition P_0x16841_87_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16841_87_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (15, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16841_87_regions :: state_pred where
  \<open>P_0x16841_87_regions \<sigma> \<equiv> \<exists>regions. P_0x16841_87_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_lseek64_addr_0x16841_87 :: state_pred where
  \<open>Q_lseek64_addr_0x16841_87 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = lseek64_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_lseek64_addr_0x16841_87_def[Qs]

schematic_goal parallels_open_0_1_0x16841_0x16841_87[blocks]:
  assumes \<open>(P_0x16841_87 && P_0x16841_87_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16841 87 \<sigma> \<triangleq> ?\<sigma> \<and> Q_lseek64_addr_0x16841_87 ?\<sigma> \<and> block_usage P_0x16841_87_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16841_87_def P_0x16841_87_regions_def post: Q_lseek64_addr_0x16841_87_def regionset: P_0x16841_87_regions_set_def)

definition P_0x16846_88 :: state_pred where
  \<open>P_0x16846_88 \<sigma> \<equiv> RIP \<sigma> = 0x16846 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16846_88_def[Ps]

definition P_0x16846_88_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16846_88_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (15, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16846_88_regions :: state_pred where
  \<open>P_0x16846_88_regions \<sigma> \<equiv> \<exists>regions. P_0x16846_88_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1684a_88 :: state_pred where
  \<open>Q_0x1684a_88 \<sigma> \<equiv> RIP \<sigma> = 0x1684a \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x1684a_88_def[Qs]

schematic_goal parallels_open_0_1_0x16846_0x16846_88[blocks]:
  assumes \<open>(P_0x16846_88 && P_0x16846_88_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16846 88 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1684a_88 ?\<sigma> \<and> block_usage P_0x16846_88_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16846_88_def P_0x16846_88_regions_def post: Q_0x1684a_88_def regionset: P_0x16846_88_regions_set_def)

definition P_0x1684a_true_89 :: state_pred where
  \<open>P_0x1684a_true_89 \<sigma> \<equiv> RIP \<sigma> = 0x1684a \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x1684a_true_89_def[Ps]

definition P_0x1684a_true_89_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1684a_true_89_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x1684a_true_89_regions :: state_pred where
  \<open>P_0x1684a_true_89_regions \<sigma> \<equiv> \<exists>regions. P_0x1684a_true_89_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e7_89 :: state_pred where
  \<open>Q_0x168e7_89 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168e7_89_def[Qs]

schematic_goal parallels_open_0_3_0x1684a_0x168e4_89[blocks]:
  assumes \<open>(P_0x1684a_true_89 && P_0x1684a_true_89_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168e4 89 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e7_89 ?\<sigma> \<and> block_usage P_0x1684a_true_89_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1684a_true_89_def P_0x1684a_true_89_regions_def post: Q_0x168e7_89_def regionset: P_0x1684a_true_89_regions_set_def)

definition P_0x168e7_true_90 :: state_pred where
  \<open>P_0x168e7_true_90 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e7_true_90_def[Ps]

definition P_0x168e7_true_90_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_true_90_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e7_true_90_regions :: state_pred where
  \<open>P_0x168e7_true_90_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_true_90_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ee_90 :: state_pred where
  \<open>Q_0x168ee_90 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168ee_90_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_90[blocks]:
  assumes \<open>(P_0x168e7_true_90 && P_0x168e7_true_90_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 90 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ee_90 ?\<sigma> \<and> block_usage P_0x168e7_true_90_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_true_90_def P_0x168e7_true_90_regions_def post: Q_0x168ee_90_def regionset: P_0x168e7_true_90_regions_set_def)

definition P_0x168e7_false_91 :: state_pred where
  \<open>P_0x168e7_false_91 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e7_false_91_def[Ps]

definition P_0x168e7_false_91_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_false_91_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e7_false_91_regions :: state_pred where
  \<open>P_0x168e7_false_91_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_false_91_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e9_91 :: state_pred where
  \<open>Q_0x168e9_91 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168e9_91_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_91[blocks]:
  assumes \<open>(P_0x168e7_false_91 && P_0x168e7_false_91_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 91 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e9_91 ?\<sigma> \<and> block_usage P_0x168e7_false_91_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_false_91_def P_0x168e7_false_91_regions_def post: Q_0x168e9_91_def regionset: P_0x168e7_false_91_regions_set_def)

definition P_0x168e9_92 :: state_pred where
  \<open>P_0x168e9_92 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e9_92_def[Ps]

definition P_0x168e9_92_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e9_92_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e9_92_regions :: state_pred where
  \<open>P_0x168e9_92_regions \<sigma> \<equiv> \<exists>regions. P_0x168e9_92_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x168e9_92 :: state_pred where
  \<open>Q_qemu_free_addr_0x168e9_92 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_qemu_free_addr_0x168e9_92_def[Qs]

schematic_goal parallels_open_0_1_0x168e9_0x168e9_92[blocks]:
  assumes \<open>(P_0x168e9_92 && P_0x168e9_92_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e9 92 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x168e9_92 ?\<sigma> \<and> block_usage P_0x168e9_92_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e9_92_def P_0x168e9_92_regions_def post: Q_qemu_free_addr_0x168e9_92_def regionset: P_0x168e9_92_regions_set_def)

definition P_0x168ee_93 :: state_pred where
  \<open>P_0x168ee_93 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168ee_93_def[Ps]

definition P_0x168ee_93_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ee_93_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168ee_93_regions :: state_pred where
  \<open>P_0x168ee_93_regions \<sigma> \<equiv> \<exists>regions. P_0x168ee_93_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_93 :: state_pred where
  \<open>Q_0x168f6_93 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168f6_93_def[Qs]

schematic_goal parallels_open_0_2_0x168ee_0x168f0_93[blocks]:
  assumes \<open>(P_0x168ee_93 && P_0x168ee_93_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168f0 93 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_93 ?\<sigma> \<and> block_usage P_0x168ee_93_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ee_93_def P_0x168ee_93_regions_def post: Q_0x168f6_93_def regionset: P_0x168ee_93_regions_set_def)

definition P_0x168f6_94 :: state_pred where
  \<open>P_0x168f6_94 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168f6_94_def[Ps]

definition P_0x168f6_94_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_94_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168f6_94_regions :: state_pred where
  \<open>P_0x168f6_94_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_94_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_94 :: state_pred where
  \<open>Q_close_addr_0x168f6_94 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_close_addr_0x168f6_94_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_94[blocks]:
  assumes \<open>(P_0x168f6_94 && P_0x168f6_94_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 94 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_94 ?\<sigma> \<and> block_usage P_0x168f6_94_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_94_def P_0x168f6_94_regions_def post: Q_close_addr_0x168f6_94_def regionset: P_0x168f6_94_regions_set_def)

definition P_0x168fb_95 :: state_pred where
  \<open>P_0x168fb_95 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168fb_95_def[Ps]

definition P_0x168fb_95_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_95_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168fb_95_regions :: state_pred where
  \<open>P_0x168fb_95_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_95_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_95 :: state_pred where
  \<open>Q_0x1689b_95 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_95_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_95[blocks]:
  assumes \<open>(P_0x168fb_95 && P_0x168fb_95_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 95 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_95 ?\<sigma> \<and> block_usage P_0x168fb_95_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_95_def P_0x168fb_95_regions_def post: Q_0x1689b_95_def regionset: P_0x168fb_95_regions_set_def)

definition P_0x1684a_false_96 :: state_pred where
  \<open>P_0x1684a_false_96 \<sigma> \<equiv> RIP \<sigma> = 0x1684a \<and> RAX \<sigma> = lseek64_0x16841_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x1684a_false_96_def[Ps]

definition P_0x1684a_false_96_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1684a_false_96_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x1684a_false_96_regions :: state_pred where
  \<open>P_0x1684a_false_96_regions \<sigma> \<equiv> \<exists>regions. P_0x1684a_false_96_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16864_96 :: state_pred where
  \<open>Q_0x16864_96 \<sigma> \<equiv> RIP \<sigma> = 0x16864 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x16864_96_def[Qs]

schematic_goal parallels_open_0_7_0x1684a_0x16861_96[blocks]:
  assumes \<open>(P_0x1684a_false_96 && P_0x1684a_false_96_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x16861 96 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16864_96 ?\<sigma> \<and> block_usage P_0x1684a_false_96_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1684a_false_96_def P_0x1684a_false_96_regions_def post: Q_0x16864_96_def regionset: P_0x1684a_false_96_regions_set_def)

definition P_0x16864_97 :: state_pred where
  \<open>P_0x16864_97 \<sigma> \<equiv> RIP \<sigma> = 0x16864 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16846 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16864_97_def[Ps]

definition P_0x16864_97_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16864_97_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16864_97_regions :: state_pred where
  \<open>P_0x16864_97_regions \<sigma> \<equiv> \<exists>regions. P_0x16864_97_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_malloc_addr_0x16864_97 :: state_pred where
  \<open>Q_qemu_malloc_addr_0x16864_97 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_malloc_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_qemu_malloc_addr_0x16864_97_def[Qs]

schematic_goal parallels_open_0_1_0x16864_0x16864_97[blocks]:
  assumes \<open>(P_0x16864_97 && P_0x16864_97_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16864 97 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_malloc_addr_0x16864_97 ?\<sigma> \<and> block_usage P_0x16864_97_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16864_97_def P_0x16864_97_regions_def post: Q_qemu_malloc_addr_0x16864_97_def regionset: P_0x16864_97_regions_set_def)

definition P_0x16869_98 :: state_pred where
  \<open>P_0x16869_98 \<sigma> \<equiv> RIP \<sigma> = 0x16869 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16869_98_def[Ps]

definition P_0x16869_98_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16869_98_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16869_98_regions :: state_pred where
  \<open>P_0x16869_98_regions \<sigma> \<equiv> \<exists>regions. P_0x16869_98_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16870_98 :: state_pred where
  \<open>Q_0x16870_98 \<sigma> \<equiv> RIP \<sigma> = 0x16870 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x16870_98_def[Qs]

schematic_goal parallels_open_0_2_0x16869_0x1686d_98[blocks]:
  assumes \<open>(P_0x16869_98 && P_0x16869_98_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1686d 98 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16870_98 ?\<sigma> \<and> block_usage P_0x16869_98_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16869_98_def P_0x16869_98_regions_def post: Q_0x16870_98_def regionset: P_0x16869_98_regions_set_def)

definition P_0x16870_true_99 :: state_pred where
  \<open>P_0x16870_true_99 \<sigma> \<equiv> RIP \<sigma> = 0x16870 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16870_true_99_def[Ps]

definition P_0x16870_true_99_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16870_true_99_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16870_true_99_regions :: state_pred where
  \<open>P_0x16870_true_99_regions \<sigma> \<equiv> \<exists>regions. P_0x16870_true_99_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_99 :: state_pred where
  \<open>Q_0x168f6_99 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168f6_99_def[Qs]

schematic_goal parallels_open_0_3_0x16870_0x168f0_99[blocks]:
  assumes \<open>(P_0x16870_true_99 && P_0x16870_true_99_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168f0 99 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_99 ?\<sigma> \<and> block_usage P_0x16870_true_99_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16870_true_99_def P_0x16870_true_99_regions_def post: Q_0x168f6_99_def regionset: P_0x16870_true_99_regions_set_def)

definition P_0x168f6_100 :: state_pred where
  \<open>P_0x168f6_100 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168f6_100_def[Ps]

definition P_0x168f6_100_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_100_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168f6_100_regions :: state_pred where
  \<open>P_0x168f6_100_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_100_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_100 :: state_pred where
  \<open>Q_close_addr_0x168f6_100 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_close_addr_0x168f6_100_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_100[blocks]:
  assumes \<open>(P_0x168f6_100 && P_0x168f6_100_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 100 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_100 ?\<sigma> \<and> block_usage P_0x168f6_100_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_100_def P_0x168f6_100_regions_def post: Q_close_addr_0x168f6_100_def regionset: P_0x168f6_100_regions_set_def)

definition P_0x168fb_101 :: state_pred where
  \<open>P_0x168fb_101 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RAX \<sigma> = close_0x168f6_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168fb_101_def[Ps]

definition P_0x168fb_101_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_101_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168fb_101_regions :: state_pred where
  \<open>P_0x168fb_101_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_101_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_101 :: state_pred where
  \<open>Q_0x1689b_101 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_101_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_101[blocks]:
  assumes \<open>(P_0x168fb_101 && P_0x168fb_101_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 101 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_101 ?\<sigma> \<and> block_usage P_0x168fb_101_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_101_def P_0x168fb_101_regions_def post: Q_0x1689b_101_def regionset: P_0x168fb_101_regions_set_def)

definition P_0x16870_false_102 :: state_pred where
  \<open>P_0x16870_false_102 \<sigma> \<equiv> RIP \<sigma> = 0x16870 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (sextend (ucast (((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::32 word))::32 word) << 2))) 32 64::64 word) \<and> RSI \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16870_false_102_def[Ps]

definition P_0x16870_false_102_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16870_false_102_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16870_false_102_regions :: state_pred where
  \<open>P_0x16870_false_102_regions \<sigma> \<equiv> \<exists>regions. P_0x16870_false_102_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16884_102 :: state_pred where
  \<open>Q_0x16884_102 \<sigma> \<equiv> RIP \<sigma> = 0x16884 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x16884_102_def[Qs]

schematic_goal parallels_open_0_6_0x16870_0x16881_102[blocks]:
  assumes \<open>(P_0x16870_false_102 && P_0x16870_false_102_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x16881 102 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16884_102 ?\<sigma> \<and> block_usage P_0x16870_false_102_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16870_false_102_def P_0x16870_false_102_regions_def post: Q_0x16884_102_def regionset: P_0x16870_false_102_regions_set_def)

definition P_0x16884_103 :: state_pred where
  \<open>P_0x16884_103 \<sigma> \<equiv> RIP \<sigma> = 0x16884 \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16869 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16884_103_def[Ps]

definition P_0x16884_103_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16884_103_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16884_103_regions :: state_pred where
  \<open>P_0x16884_103_regions \<sigma> \<equiv> \<exists>regions. P_0x16884_103_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_read_addr_0x16884_103 :: state_pred where
  \<open>Q_read_addr_0x16884_103 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = read_addr \<and> RAX \<sigma> = qemu_malloc_0x16864_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_read_addr_0x16884_103_def[Qs]

schematic_goal parallels_open_0_1_0x16884_0x16884_103[blocks]:
  assumes \<open>(P_0x16884_103 && P_0x16884_103_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16884 103 \<sigma> \<triangleq> ?\<sigma> \<and> Q_read_addr_0x16884_103 ?\<sigma> \<and> block_usage P_0x16884_103_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16884_103_def P_0x16884_103_regions_def post: Q_read_addr_0x16884_103_def regionset: P_0x16884_103_regions_set_def)

definition P_0x16889_104 :: state_pred where
  \<open>P_0x16889_104 \<sigma> \<equiv> RIP \<sigma> = 0x16889 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16889_104_def[Ps]

definition P_0x16889_104_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16889_104_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16889_104_regions :: state_pred where
  \<open>P_0x16889_104_regions \<sigma> \<equiv> \<exists>regions. P_0x16889_104_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16899_104 :: state_pred where
  \<open>Q_0x16899_104 \<sigma> \<equiv> RIP \<sigma> = 0x16899 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x16899_104_def[Qs]

schematic_goal parallels_open_0_4_0x16889_0x16896_104[blocks]:
  assumes \<open>(P_0x16889_104 && P_0x16889_104_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x16896 104 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16899_104 ?\<sigma> \<and> block_usage P_0x16889_104_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16889_104_def P_0x16889_104_regions_def post: Q_0x16899_104_def regionset: P_0x16889_104_regions_set_def)

definition P_0x16899_true_105 :: state_pred where
  \<open>P_0x16899_true_105 \<sigma> \<equiv> RIP \<sigma> = 0x16899 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16899_true_105_def[Ps]

definition P_0x16899_true_105_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16899_true_105_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16899_true_105_regions :: state_pred where
  \<open>P_0x16899_true_105_regions \<sigma> \<equiv> \<exists>regions. P_0x16899_true_105_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e7_105 :: state_pred where
  \<open>Q_0x168e7_105 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168e7_105_def[Qs]

schematic_goal parallels_open_0_3_0x16899_0x168e4_105[blocks]:
  assumes \<open>(P_0x16899_true_105 && P_0x16899_true_105_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x168e4 105 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e7_105 ?\<sigma> \<and> block_usage P_0x16899_true_105_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16899_true_105_def P_0x16899_true_105_regions_def post: Q_0x168e7_105_def regionset: P_0x16899_true_105_regions_set_def)

definition P_0x168e7_true_106 :: state_pred where
  \<open>P_0x168e7_true_106 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e7_true_106_def[Ps]

definition P_0x168e7_true_106_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_true_106_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e7_true_106_regions :: state_pred where
  \<open>P_0x168e7_true_106_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_true_106_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ee_106 :: state_pred where
  \<open>Q_0x168ee_106 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168ee_106_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_106[blocks]:
  assumes \<open>(P_0x168e7_true_106 && P_0x168e7_true_106_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 106 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ee_106 ?\<sigma> \<and> block_usage P_0x168e7_true_106_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_true_106_def P_0x168e7_true_106_regions_def post: Q_0x168ee_106_def regionset: P_0x168e7_true_106_regions_set_def)

definition P_0x168e7_false_107 :: state_pred where
  \<open>P_0x168e7_false_107 \<sigma> \<equiv> RIP \<sigma> = 0x168e7 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e7_false_107_def[Ps]

definition P_0x168e7_false_107_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e7_false_107_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e7_false_107_regions :: state_pred where
  \<open>P_0x168e7_false_107_regions \<sigma> \<equiv> \<exists>regions. P_0x168e7_false_107_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168e9_107 :: state_pred where
  \<open>Q_0x168e9_107 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168e9_107_def[Qs]

schematic_goal parallels_open_0_1_0x168e7_0x168e7_107[blocks]:
  assumes \<open>(P_0x168e7_false_107 && P_0x168e7_false_107_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e7 107 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168e9_107 ?\<sigma> \<and> block_usage P_0x168e7_false_107_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e7_false_107_def P_0x168e7_false_107_regions_def post: Q_0x168e9_107_def regionset: P_0x168e7_false_107_regions_set_def)

definition P_0x168e9_108 :: state_pred where
  \<open>P_0x168e9_108 \<sigma> \<equiv> RIP \<sigma> = 0x168e9 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168e9_108_def[Ps]

definition P_0x168e9_108_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168e9_108_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168e9_108_regions :: state_pred where
  \<open>P_0x168e9_108_regions \<sigma> \<equiv> \<exists>regions. P_0x168e9_108_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x168e9_108 :: state_pred where
  \<open>Q_qemu_free_addr_0x168e9_108 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_qemu_free_addr_0x168e9_108_def[Qs]

schematic_goal parallels_open_0_1_0x168e9_0x168e9_108[blocks]:
  assumes \<open>(P_0x168e9_108 && P_0x168e9_108_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168e9 108 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x168e9_108 ?\<sigma> \<and> block_usage P_0x168e9_108_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168e9_108_def P_0x168e9_108_regions_def post: Q_qemu_free_addr_0x168e9_108_def regionset: P_0x168e9_108_regions_set_def)

definition P_0x168ee_109 :: state_pred where
  \<open>P_0x168ee_109 \<sigma> \<equiv> RIP \<sigma> = 0x168ee \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168ee_109_def[Ps]

definition P_0x168ee_109_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ee_109_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168ee_109_regions :: state_pred where
  \<open>P_0x168ee_109_regions \<sigma> \<equiv> \<exists>regions. P_0x168ee_109_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168f6_109 :: state_pred where
  \<open>Q_0x168f6_109 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x168f6_109_def[Qs]

schematic_goal parallels_open_0_2_0x168ee_0x168f0_109[blocks]:
  assumes \<open>(P_0x168ee_109 && P_0x168ee_109_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x168f0 109 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168f6_109 ?\<sigma> \<and> block_usage P_0x168ee_109_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ee_109_def P_0x168ee_109_regions_def post: Q_0x168f6_109_def regionset: P_0x168ee_109_regions_set_def)

definition P_0x168f6_110 :: state_pred where
  \<open>P_0x168f6_110 \<sigma> \<equiv> RIP \<sigma> = 0x168f6 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168f6_110_def[Ps]

definition P_0x168f6_110_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168f6_110_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168f6_110_regions :: state_pred where
  \<open>P_0x168f6_110_regions \<sigma> \<equiv> \<exists>regions. P_0x168f6_110_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x168f6_110 :: state_pred where
  \<open>Q_close_addr_0x168f6_110 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = close_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_close_addr_0x168f6_110_def[Qs]

schematic_goal parallels_open_0_1_0x168f6_0x168f6_110[blocks]:
  assumes \<open>(P_0x168f6_110 && P_0x168f6_110_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168f6 110 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x168f6_110 ?\<sigma> \<and> block_usage P_0x168f6_110_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168f6_110_def P_0x168f6_110_regions_def post: Q_close_addr_0x168f6_110_def regionset: P_0x168f6_110_regions_set_def)

definition P_0x168fb_111 :: state_pred where
  \<open>P_0x168fb_111 \<sigma> \<equiv> RIP \<sigma> = 0x168fb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x168fb \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x168fb_111_def[Ps]

definition P_0x168fb_111_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fb_111_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x168fb_111_regions :: state_pred where
  \<open>P_0x168fb_111_regions \<sigma> \<equiv> \<exists>regions. P_0x168fb_111_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_111 :: state_pred where
  \<open>Q_0x1689b_111 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_111_def[Qs]

schematic_goal parallels_open_0_1_0x168fb_0x168fb_111[blocks]:
  assumes \<open>(P_0x168fb_111 && P_0x168fb_111_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fb 111 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_111 ?\<sigma> \<and> block_usage P_0x168fb_111_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fb_111_def P_0x168fb_111_regions_def post: Q_0x1689b_111_def regionset: P_0x168fb_111_regions_set_def)

definition P_0x16899_false_112 :: state_pred where
  \<open>P_0x16899_false_112 \<sigma> \<equiv> RIP \<sigma> = 0x16899 \<and> RAX \<sigma> = read_0x16884_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::32 word))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = qemu_malloc_0x16864_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x167cc_retval::32 word)) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16889 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x16899_false_112_def[Ps]

definition P_0x16899_false_112_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16899_false_112_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x16899_false_112_regions :: state_pred where
  \<open>P_0x16899_false_112_regions \<sigma> \<equiv> \<exists>regions. P_0x16899_false_112_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1689b_112 :: state_pred where
  \<open>Q_0x1689b_112 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1689b_112_def[Qs]

schematic_goal parallels_open_0_1_0x16899_0x16899_112[blocks]:
  assumes \<open>(P_0x16899_false_112 && P_0x16899_false_112_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16899 112 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1689b_112 ?\<sigma> \<and> block_usage P_0x16899_false_112_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16899_false_112_def P_0x16899_false_112_regions_def post: Q_0x1689b_112_def regionset: P_0x16899_false_112_regions_set_def)

definition P_0x1689b_113 :: state_pred where
  \<open>P_0x1689b_113 \<sigma> \<equiv> RIP \<sigma> = 0x1689b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x1689b_113_def[Ps]

definition P_0x1689b_113_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1689b_113_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1689b_113_regions :: state_pred where
  \<open>P_0x1689b_113_regions \<sigma> \<equiv> \<exists>regions. P_0x1689b_113_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168ac_113 :: state_pred where
  \<open>Q_0x168ac_113 \<sigma> \<equiv> RIP \<sigma> = 0x168ac \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x168ac_113_def[Qs]

schematic_goal parallels_open_0_3_0x1689b_0x168a9_113[blocks]:
  assumes \<open>(P_0x1689b_113 && P_0x1689b_113_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x168a9 113 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168ac_113 ?\<sigma> \<and> block_usage P_0x1689b_113_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1689b_113_def P_0x1689b_113_regions_def post: Q_0x168ac_113_def regionset: P_0x1689b_113_regions_set_def)

definition P_0x168ac_true_114 :: state_pred where
  \<open>P_0x168ac_true_114 \<sigma> \<equiv> RIP \<sigma> = 0x168ac \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x168ac_true_114_def[Ps]

definition P_0x168ac_true_114_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ac_true_114_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x168ac_true_114_regions :: state_pred where
  \<open>P_0x168ac_true_114_regions \<sigma> \<equiv> \<exists>regions. P_0x168ac_true_114_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x168fd_114 :: state_pred where
  \<open>Q_0x168fd_114 \<sigma> \<equiv> RIP \<sigma> = 0x168fd \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x168fd_114_def[Qs]

schematic_goal parallels_open_0_1_0x168ac_0x168ac_114[blocks]:
  assumes \<open>(P_0x168ac_true_114 && P_0x168ac_true_114_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168ac 114 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x168fd_114 ?\<sigma> \<and> block_usage P_0x168ac_true_114_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ac_true_114_def P_0x168ac_true_114_regions_def post: Q_0x168fd_114_def regionset: P_0x168ac_true_114_regions_set_def)

definition P_0x168fd_115 :: state_pred where
  \<open>P_0x168fd_115 \<sigma> \<equiv> RIP \<sigma> = 0x168fd \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x168fd_115_def[Ps]

definition P_0x168fd_115_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168fd_115_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x168fd_115_regions :: state_pred where
  \<open>P_0x168fd_115_regions \<sigma> \<equiv> \<exists>regions. P_0x168fd_115_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x168fd_115 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x168fd_115 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RCX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x168fd_115_def[Qs]

schematic_goal parallels_open_0_1_0x168fd_0x168fd_115[blocks]:
  assumes \<open>(P_0x168fd_115 && P_0x168fd_115_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x168fd 115 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x168fd_115 ?\<sigma> \<and> block_usage P_0x168fd_115_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168fd_115_def P_0x168fd_115_regions_def post: Q_stack_chk_fail_addr_0x168fd_115_def regionset: P_0x168fd_115_regions_set_def)

definition P_0x168ac_false_116 :: state_pred where
  \<open>P_0x168ac_false_116 \<sigma> \<equiv> RIP \<sigma> = 0x168ac \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x168ac_false_116_def[Ps]

definition P_0x168ac_false_116_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x168ac_false_116_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x168ac_false_116_regions :: state_pred where
  \<open>P_0x168ac_false_116_regions \<sigma> \<equiv> \<exists>regions. P_0x168ac_false_116_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_116 :: state_pred where
  \<open>Q_ret_address_116 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RCX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_116_def[Qs]

schematic_goal parallels_open_0_7_0x168ac_0x168b8_116[blocks]:
  assumes \<open>(P_0x168ac_false_116 && P_0x168ac_false_116_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x168b8 116 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_116 ?\<sigma> \<and> block_usage P_0x168ac_false_116_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x168ac_false_116_def P_0x168ac_false_116_regions_def post: Q_ret_address_116_def regionset: P_0x168ac_false_116_regions_set_def)

definition parallels_open_acode :: ACode where
  \<open>parallels_open_acode =
    Block 13 0x167ca 0;
    Block (Suc 0) 0x167cc (Suc 0);
    CALL open64_acode;
    Block 2 0x167d3 2;
    IF SF THEN
      Block 4 0x168c5 3;
      Block (Suc 0) 0x168c7 4;
      CALL open64_acode;
      Block 2 0x168ce 5;
      IF !SF THEN
        Block 6 0x167ed 6;
        Block (Suc 0) 0x167ef 7;
        CALL qemu_read_ok_acode;
        Block (Suc 0) 0x167f4 8;
        IF SF THEN
          Block 3 0x168e4 9;
          IF ZF THEN
            Block (Suc 0) 0x168e7 10
          ELSE
            Block (Suc 0) 0x168e7 11;
            Block (Suc 0) 0x168e9 12;
            CALL qemu_free_acode
          FI;
          Block 2 0x168f0 13;
          Block (Suc 0) 0x168f6 14;
          CALL close_acode;
          Block (Suc 0) 0x168fb 15
        ELSE
          Block 6 0x16819 16;
          IF !ZF THEN
            Block 3 0x168e4 17;
            IF ZF THEN
              Block (Suc 0) 0x168e7 18
            ELSE
              Block (Suc 0) 0x168e7 19;
              Block (Suc 0) 0x168e9 20;
              CALL qemu_free_acode
            FI;
            Block 2 0x168f0 21;
            Block (Suc 0) 0x168f6 22;
            CALL close_acode;
            Block (Suc 0) 0x168fb 23
          ELSE
            Block 3 0x16825 24;
            IF !ZF THEN
              Block 3 0x168e4 25;
              IF ZF THEN
                Block (Suc 0) 0x168e7 26
              ELSE
                Block (Suc 0) 0x168e7 27;
                Block (Suc 0) 0x168e9 28;
                CALL qemu_free_acode
              FI;
              Block 2 0x168f0 29;
              Block (Suc 0) 0x168f6 30;
              CALL close_acode;
              Block (Suc 0) 0x168fb 31
            ELSE
              Block 6 0x1683f 32;
              Block (Suc 0) 0x16841 33;
              CALL lseek64_acode;
              Block (Suc 0) 0x16846 34;
              IF !ZF THEN
                Block 3 0x168e4 35;
                IF ZF THEN
                  Block (Suc 0) 0x168e7 36
                ELSE
                  Block (Suc 0) 0x168e7 37;
                  Block (Suc 0) 0x168e9 38;
                  CALL qemu_free_acode
                FI;
                Block 2 0x168f0 39;
                Block (Suc 0) 0x168f6 40;
                CALL close_acode;
                Block (Suc 0) 0x168fb 41
              ELSE
                Block 7 0x16861 42;
                Block (Suc 0) 0x16864 43;
                CALL qemu_malloc_acode;
                Block 2 0x1686d 44;
                IF ZF THEN
                  Block 3 0x168f0 45;
                  Block (Suc 0) 0x168f6 46;
                  CALL close_acode;
                  Block (Suc 0) 0x168fb 47
                ELSE
                  Block 6 0x16881 48;
                  Block (Suc 0) 0x16884 49;
                  CALL read_acode;
                  Block 4 0x16896 50;
                  IF !ZF THEN
                    Block 3 0x168e4 51;
                    IF ZF THEN
                      Block (Suc 0) 0x168e7 52
                    ELSE
                      Block (Suc 0) 0x168e7 53;
                      Block (Suc 0) 0x168e9 54;
                      CALL qemu_free_acode
                    FI;
                    Block 2 0x168f0 55;
                    Block (Suc 0) 0x168f6 56;
                    CALL close_acode;
                    Block (Suc 0) 0x168fb 57
                  ELSE
                    Block (Suc 0) 0x16899 58
                  FI
                FI
              FI
            FI
          FI
        FI
      ELSE
        Block 3 0x168dc 59
      FI
    ELSE
      Block 6 0x167ed 60;
      Block (Suc 0) 0x167ef 61;
      CALL qemu_read_ok_acode;
      Block (Suc 0) 0x167f4 62;
      IF SF THEN
        Block 3 0x168e4 63;
        IF ZF THEN
          Block (Suc 0) 0x168e7 64
        ELSE
          Block (Suc 0) 0x168e7 65;
          Block (Suc 0) 0x168e9 66;
          CALL qemu_free_acode
        FI;
        Block 2 0x168f0 67;
        Block (Suc 0) 0x168f6 68;
        CALL close_acode;
        Block (Suc 0) 0x168fb 69
      ELSE
        Block 6 0x16819 70;
        IF !ZF THEN
          Block 3 0x168e4 71;
          IF ZF THEN
            Block (Suc 0) 0x168e7 72
          ELSE
            Block (Suc 0) 0x168e7 73;
            Block (Suc 0) 0x168e9 74;
            CALL qemu_free_acode
          FI;
          Block 2 0x168f0 75;
          Block (Suc 0) 0x168f6 76;
          CALL close_acode;
          Block (Suc 0) 0x168fb 77
        ELSE
          Block 3 0x16825 78;
          IF !ZF THEN
            Block 3 0x168e4 79;
            IF ZF THEN
              Block (Suc 0) 0x168e7 80
            ELSE
              Block (Suc 0) 0x168e7 81;
              Block (Suc 0) 0x168e9 82;
              CALL qemu_free_acode
            FI;
            Block 2 0x168f0 83;
            Block (Suc 0) 0x168f6 84;
            CALL close_acode;
            Block (Suc 0) 0x168fb 85
          ELSE
            Block 6 0x1683f 86;
            Block (Suc 0) 0x16841 87;
            CALL lseek64_acode;
            Block (Suc 0) 0x16846 88;
            IF !ZF THEN
              Block 3 0x168e4 89;
              IF ZF THEN
                Block (Suc 0) 0x168e7 90
              ELSE
                Block (Suc 0) 0x168e7 91;
                Block (Suc 0) 0x168e9 92;
                CALL qemu_free_acode
              FI;
              Block 2 0x168f0 93;
              Block (Suc 0) 0x168f6 94;
              CALL close_acode;
              Block (Suc 0) 0x168fb 95
            ELSE
              Block 7 0x16861 96;
              Block (Suc 0) 0x16864 97;
              CALL qemu_malloc_acode;
              Block 2 0x1686d 98;
              IF ZF THEN
                Block 3 0x168f0 99;
                Block (Suc 0) 0x168f6 100;
                CALL close_acode;
                Block (Suc 0) 0x168fb 101
              ELSE
                Block 6 0x16881 102;
                Block (Suc 0) 0x16884 103;
                CALL read_acode;
                Block 4 0x16896 104;
                IF !ZF THEN
                  Block 3 0x168e4 105;
                  IF ZF THEN
                    Block (Suc 0) 0x168e7 106
                  ELSE
                    Block (Suc 0) 0x168e7 107;
                    Block (Suc 0) 0x168e9 108;
                    CALL qemu_free_acode
                  FI;
                  Block 2 0x168f0 109;
                  Block (Suc 0) 0x168f6 110;
                  CALL close_acode;
                  Block (Suc 0) 0x168fb 111
                ELSE
                  Block (Suc 0) 0x16899 112
                FI
              FI
            FI
          FI
        FI
      FI
    FI;
    Block 3 0x168a9 113;
    IF !ZF THEN
      Block (Suc 0) 0x168ac 114;
      Block (Suc 0) 0x168fd 115;
      CALL stack_chk_fail_acode
    ELSE
      Block 7 0x168b8 116
    FI
  \<close>

schematic_goal "parallels_open":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167cc \<longrightarrow> P_0x167cc_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167d1 \<longrightarrow> P_0x167d1_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167d5 \<longrightarrow> P_0x167d5_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168c7 \<longrightarrow> P_0x168c7_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168cc \<longrightarrow> P_0x168cc_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168d0 \<longrightarrow> P_0x168d0_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167ef \<longrightarrow> P_0x167ef_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167f4 \<longrightarrow> P_0x167f4_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167f6 \<longrightarrow> P_0x167f6_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e9 \<longrightarrow> P_0x168e9_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ee \<longrightarrow> P_0x168ee_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167f6 \<longrightarrow> P_0x167f6_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1681c \<longrightarrow> P_0x1681c_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_true_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_false_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e9 \<longrightarrow> P_0x168e9_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ee \<longrightarrow> P_0x168ee_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1681c \<longrightarrow> P_0x1681c_false_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1682a \<longrightarrow> P_0x1682a_true_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_true_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_false_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e9 \<longrightarrow> P_0x168e9_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ee \<longrightarrow> P_0x168ee_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1682a \<longrightarrow> P_0x1682a_false_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16841 \<longrightarrow> P_0x16841_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16846 \<longrightarrow> P_0x16846_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1684a \<longrightarrow> P_0x1684a_true_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_true_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_false_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e9 \<longrightarrow> P_0x168e9_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ee \<longrightarrow> P_0x168ee_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1684a \<longrightarrow> P_0x1684a_false_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16864 \<longrightarrow> P_0x16864_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16869 \<longrightarrow> P_0x16869_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16870 \<longrightarrow> P_0x16870_true_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16870 \<longrightarrow> P_0x16870_false_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16884 \<longrightarrow> P_0x16884_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16889 \<longrightarrow> P_0x16889_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16899 \<longrightarrow> P_0x16899_true_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_true_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_false_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e9 \<longrightarrow> P_0x168e9_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ee \<longrightarrow> P_0x168ee_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16899 \<longrightarrow> P_0x16899_false_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168d0 \<longrightarrow> P_0x168d0_false_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167d5 \<longrightarrow> P_0x167d5_false_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167ef \<longrightarrow> P_0x167ef_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167f4 \<longrightarrow> P_0x167f4_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167f6 \<longrightarrow> P_0x167f6_true_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_true_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_false_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e9 \<longrightarrow> P_0x168e9_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ee \<longrightarrow> P_0x168ee_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x167f6 \<longrightarrow> P_0x167f6_false_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1681c \<longrightarrow> P_0x1681c_true_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_true_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_false_73_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e9 \<longrightarrow> P_0x168e9_74_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ee \<longrightarrow> P_0x168ee_75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_76_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_77_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1681c \<longrightarrow> P_0x1681c_false_78_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1682a \<longrightarrow> P_0x1682a_true_79_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_true_80_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_false_81_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e9 \<longrightarrow> P_0x168e9_82_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ee \<longrightarrow> P_0x168ee_83_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_84_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_85_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1682a \<longrightarrow> P_0x1682a_false_86_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16841 \<longrightarrow> P_0x16841_87_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16846 \<longrightarrow> P_0x16846_88_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1684a \<longrightarrow> P_0x1684a_true_89_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_true_90_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_false_91_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e9 \<longrightarrow> P_0x168e9_92_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ee \<longrightarrow> P_0x168ee_93_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_94_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_95_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1684a \<longrightarrow> P_0x1684a_false_96_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16864 \<longrightarrow> P_0x16864_97_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16869 \<longrightarrow> P_0x16869_98_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16870 \<longrightarrow> P_0x16870_true_99_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_100_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_101_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16870 \<longrightarrow> P_0x16870_false_102_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16884 \<longrightarrow> P_0x16884_103_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16889 \<longrightarrow> P_0x16889_104_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16899 \<longrightarrow> P_0x16899_true_105_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_true_106_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e7 \<longrightarrow> P_0x168e7_false_107_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168e9 \<longrightarrow> P_0x168e9_108_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ee \<longrightarrow> P_0x168ee_109_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168f6 \<longrightarrow> P_0x168f6_110_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fb \<longrightarrow> P_0x168fb_111_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16899 \<longrightarrow> P_0x16899_false_112_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1689b \<longrightarrow> P_0x1689b_113_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ac \<longrightarrow> P_0x168ac_true_114_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168fd \<longrightarrow> P_0x168fd_115_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x168ac \<longrightarrow> P_0x168ac_false_116_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_open64_addr_0x167cc_1}} \<box>open64_acode {{P_0x167d1_2;M_0x167cc}}\<close>
    and [blocks]: \<open>{{Q_open64_addr_0x168c7_4}} \<box>open64_acode {{P_0x168cc_5;M_0x168c7}}\<close>
    and [blocks]: \<open>{{Q_qemu_read_ok_addr_0x167ef_7}} \<box>qemu_read_ok_acode {{P_0x167f4_8;M_0x167ef}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x168e9_12}} \<box>qemu_free_acode {{P_0x168ee_13;M_0x168e9}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_14}} \<box>close_acode {{P_0x168fb_15;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x168e9_20}} \<box>qemu_free_acode {{P_0x168ee_21;M_0x168e9}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_22}} \<box>close_acode {{P_0x168fb_23;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x168e9_28}} \<box>qemu_free_acode {{P_0x168ee_29;M_0x168e9}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_30}} \<box>close_acode {{P_0x168fb_31;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_lseek64_addr_0x16841_33}} \<box>lseek64_acode {{P_0x16846_34;M_0x16841}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x168e9_38}} \<box>qemu_free_acode {{P_0x168ee_39;M_0x168e9}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_40}} \<box>close_acode {{P_0x168fb_41;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_qemu_malloc_addr_0x16864_43}} \<box>qemu_malloc_acode {{P_0x16869_44;M_0x16864}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_46}} \<box>close_acode {{P_0x168fb_47;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_read_addr_0x16884_49}} \<box>read_acode {{P_0x16889_50;M_0x16884}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x168e9_54}} \<box>qemu_free_acode {{P_0x168ee_55;M_0x168e9}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_56}} \<box>close_acode {{P_0x168fb_57;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_qemu_read_ok_addr_0x167ef_61}} \<box>qemu_read_ok_acode {{P_0x167f4_62;M_0x167ef}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x168e9_66}} \<box>qemu_free_acode {{P_0x168ee_67;M_0x168e9}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_68}} \<box>close_acode {{P_0x168fb_69;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x168e9_74}} \<box>qemu_free_acode {{P_0x168ee_75;M_0x168e9}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_76}} \<box>close_acode {{P_0x168fb_77;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x168e9_82}} \<box>qemu_free_acode {{P_0x168ee_83;M_0x168e9}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_84}} \<box>close_acode {{P_0x168fb_85;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_lseek64_addr_0x16841_87}} \<box>lseek64_acode {{P_0x16846_88;M_0x16841}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x168e9_92}} \<box>qemu_free_acode {{P_0x168ee_93;M_0x168e9}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_94}} \<box>close_acode {{P_0x168fb_95;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_qemu_malloc_addr_0x16864_97}} \<box>qemu_malloc_acode {{P_0x16869_98;M_0x16864}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_100}} \<box>close_acode {{P_0x168fb_101;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_read_addr_0x16884_103}} \<box>read_acode {{P_0x16889_104;M_0x16884}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x168e9_108}} \<box>qemu_free_acode {{P_0x168ee_109;M_0x168e9}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x168f6_110}} \<box>close_acode {{P_0x168fb_111;M_0x168f6}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x168fd_115}} \<box>stack_chk_fail_acode {{Q_fail;M_0x168fd}}\<close>
  shows \<open>{{?P}} parallels_open_acode {{?Q;?M}}\<close>
  by (vcg acode: parallels_open_acode_def assms: assms)

end
