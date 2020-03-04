theory bdrv_aio_rw_vector
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes qemu_memalign_0x1a2b3_retval\<^sub>v bdrv_aio_read_0x1a2db_retval\<^sub>v qemu_iovec_to_buffer_0x1a307_retval\<^sub>v bdrv_aio_write_0x1a323_retval\<^sub>v qemu_mallocz_0x1a346_retval\<^sub>v qemu_vfree_0x1a379_retval\<^sub>v bdrv_aio_read_addr bdrv_aio_write_addr qemu_iovec_to_buffer_addr qemu_mallocz_addr qemu_memalign_addr qemu_vfree_addr :: \<open>64 word\<close>
    and bdrv_aio_read_acode bdrv_aio_write_acode qemu_iovec_to_buffer_acode qemu_mallocz_acode qemu_memalign_acode qemu_vfree_acode :: ACode
  assumes fetch:
    "fetch 0x1a260 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a262 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x1a265 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a267 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1a26a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a26c \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a26d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1a270 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a271 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x1a275 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 65828))))), 7)"
    "fetch 0x1a27c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 80))))), 5)"
    "fetch 0x1a281 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a284 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 107312)), 6)"
    "fetch 0x1a28a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32))))), 4)"
    "fetch 0x1a28e \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 65803)))) (Storage (Reg (General SixtyFour rax))), 7)"
    "fetch 0x1a295 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rbp))), 4)"
    "fetch 0x1a299 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1a29c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0x1a2a1 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour r8))), 4)"
    "fetch 0x1a2a5 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x1a2a8 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour r9))), 4)"
    "fetch 0x1a2ac \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rsi)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x1a2af \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x1a2b3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_memalign'')), 5)"
    "fetch 0x1a2b8 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 56)))) (Storage (Reg (General ThirtyTwo r12))), 4)"
    "fetch 0x1a2bc \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 48)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1a2c0 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1a2c3 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 107264)), 2)"
    "fetch 0x1a2c5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a2c8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-9615))))), 7)"
    "fetch 0x1a2cf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1a2d2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a2d5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1a2d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1a2db \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_aio_read'')), 5)"
    "fetch 0x1a2e0 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 64)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1a2e4 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a2e7 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 107376)), 6)"
    "fetch 0x1a2ed \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a2f0 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x1a2f4 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a2f5 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a2f6 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a2f8 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a2fa \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a2fc \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1a2fd \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x1a300 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40))))), 4)"
    "fetch 0x1a304 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a307 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_iovec_to_buffer'')), 5)"
    "fetch 0x1a30c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 48))))), 4)"
    "fetch 0x1a310 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a313 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1a316 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-9693))))), 7)"
    "fetch 0x1a31d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1a320 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1a323 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_aio_write'')), 5)"
    "fetch 0x1a328 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 64)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1a32c \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 107236)), 2)"
    "fetch 0x1a32e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x1a330 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 65633))))), 7)"
    "fetch 0x1a337 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour r9))), 5)"
    "fetch 0x1a33c \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour r8))), 5)"
    "fetch 0x1a341 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rdx))), 5)"
    "fetch 0x1a346 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_mallocz'')), 5)"
    "fetch 0x1a34b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x1a350 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x1a355 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a358 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 65585)))), 7)"
    "fetch 0x1a35f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1a364 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rbx)))) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a367 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 107157)), 5)"
    "fetch 0x1a36c \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x1a370 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 48))))), 4)"
    "fetch 0x1a374 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x1a379 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_vfree'')), 5)"
    "fetch 0x1a37e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rbx))))), 3)"
    "fetch 0x1a381 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1a386 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 16))))), 4)"
    "fetch 0x1a38a \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32)))) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x1a38e \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rbx))), 4)"
    "fetch 0x1a392 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 107248)), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and bdrv_aio_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_aio_read'') = bdrv_aio_read_addr\<close>
    and bdrv_aio_write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_aio_write'') = bdrv_aio_write_addr\<close>
    and qemu_iovec_to_buffer\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_iovec_to_buffer'') = qemu_iovec_to_buffer_addr\<close>
    and qemu_mallocz\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_mallocz'') = qemu_mallocz_addr\<close>
    and qemu_memalign\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_memalign'') = qemu_memalign_addr\<close>
    and qemu_vfree\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_vfree'') = qemu_vfree_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>qemu_memalign_0x1a2b3_retval \<equiv> qemu_memalign_0x1a2b3_retval\<^sub>v\<close>
definition \<open>bdrv_aio_read_0x1a2db_retval \<equiv> bdrv_aio_read_0x1a2db_retval\<^sub>v\<close>
definition \<open>qemu_iovec_to_buffer_0x1a307_retval \<equiv> qemu_iovec_to_buffer_0x1a307_retval\<^sub>v\<close>
definition \<open>bdrv_aio_write_0x1a323_retval \<equiv> bdrv_aio_write_0x1a323_retval\<^sub>v\<close>
definition \<open>qemu_mallocz_0x1a346_retval \<equiv> qemu_mallocz_0x1a346_retval\<^sub>v\<close>
definition \<open>qemu_vfree_0x1a379_retval \<equiv> qemu_vfree_0x1a379_retval\<^sub>v\<close>

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
  )

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "bdrv_aio_rw_vector" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R14\<^sub>0 \<equiv> R14\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1a260_0 :: state_pred where
  \<open>P_0x1a260_0 \<sigma> \<equiv> RIP \<sigma> = 0x1a260 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1a260_0_def[Ps]

definition P_0x1a260_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a260_0_regions_set \<sigma> \<equiv> {
    (0, 0x2a3a0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x1a260_0_regions :: state_pred where
  \<open>P_0x1a260_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1a260_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a284_0 :: state_pred where
  \<open>Q_0x1a284_0 \<sigma> \<equiv> RIP \<sigma> = 0x1a284 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1a284_0_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_12_0x1a260_0x1a281_0[blocks]:
  assumes \<open>(P_0x1a260_0 && P_0x1a260_0_regions) \<sigma>\<close>
  shows \<open>exec_block 12 0x1a281 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a284_0 ?\<sigma> \<and> block_usage P_0x1a260_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a260_0_def P_0x1a260_0_regions_def post: Q_0x1a284_0_def regionset: P_0x1a260_0_regions_set_def)

definition P_0x1a284_true_1 :: state_pred where
  \<open>P_0x1a284_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x1a284 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1a284_true_1_def[Ps]

definition P_0x1a284_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a284_true_1_regions_set \<sigma> \<equiv> {
    (0, 0x2a398, 4),
    (1, 0x2a3a0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1a284_true_1_regions :: state_pred where
  \<open>P_0x1a284_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1a284_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a346_1 :: state_pred where
  \<open>Q_0x1a346_1 \<sigma> \<equiv> RIP \<sigma> = 0x1a346 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[0x2a398,4]::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a398,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a398,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDX\<^sub>0\<close>
declare Q_0x1a346_1_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_5_0x1a284_0x1a341_1[blocks]:
  assumes \<open>(P_0x1a284_true_1 && P_0x1a284_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x1a341 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a346_1 ?\<sigma> \<and> block_usage P_0x1a284_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a284_true_1_def P_0x1a284_true_1_regions_def post: Q_0x1a346_1_def regionset: P_0x1a284_true_1_regions_set_def)

definition P_0x1a346_2 :: state_pred where
  \<open>P_0x1a346_2 \<sigma> \<equiv> RIP \<sigma> = 0x1a346 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[0x2a398,4]::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a398,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a398,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDX\<^sub>0\<close>
declare P_0x1a346_2_def[Ps]

definition P_0x1a346_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a346_2_regions_set \<sigma> \<equiv> {
    (0, 0x2a398, 4),
    (1, 0x2a3a0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a346_2_regions :: state_pred where
  \<open>P_0x1a346_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1a346_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_mallocz_addr_0x1a346_2 :: state_pred where
  \<open>Q_qemu_mallocz_addr_0x1a346_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = qemu_mallocz_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[0x2a398,4]::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a398,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a398,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a34b\<close>
declare Q_qemu_mallocz_addr_0x1a346_2_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_1_0x1a346_0x1a346_2[blocks]:
  assumes \<open>(P_0x1a346_2 && P_0x1a346_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a346 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_mallocz_addr_0x1a346_2 ?\<sigma> \<and> block_usage P_0x1a346_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a346_2_def P_0x1a346_2_regions_def post: Q_qemu_mallocz_addr_0x1a346_2_def regionset: P_0x1a346_2_regions_set_def)

definition P_0x1a34b_3 :: state_pred where
  \<open>P_0x1a34b_3 \<sigma> \<equiv> RIP \<sigma> = 0x1a34b \<and> RAX \<sigma> = qemu_mallocz_0x1a346_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[0x2a398,4]::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a398,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a398,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a34b\<close>
declare P_0x1a34b_3_def[Ps]

definition P_0x1a34b_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a34b_3_regions_set \<sigma> \<equiv> {
    (0, 0x2a398, 4),
    (1, 0x2a3a0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, qemu_mallocz_0x1a346_retval, 8)
  }\<close>

definition P_0x1a34b_3_regions :: state_pred where
  \<open>P_0x1a34b_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1a34b_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a295_3 :: state_pred where
  \<open>Q_0x1a295_3 \<sigma> \<equiv> RIP \<sigma> = 0x1a295 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1a295_3_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_7_0x1a34b_0x1a367_3[blocks]:
  assumes \<open>(P_0x1a34b_3 && P_0x1a34b_3_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1a367 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a295_3 ?\<sigma> \<and> block_usage P_0x1a34b_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a34b_3_def P_0x1a34b_3_regions_def post: Q_0x1a295_3_def regionset: P_0x1a34b_3_regions_set_def)

definition P_0x1a284_false_4 :: state_pred where
  \<open>P_0x1a284_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x1a284 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3a0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1a284_false_4_def[Ps]

definition P_0x1a284_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a284_false_4_regions_set \<sigma> \<equiv> {
    (0, 0x2a3a0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (3, (((\<sigma> \<turnstile> *[0x2a3a0,8]::64 word)::64 word) + 0x20), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x1a284_false_4_regions :: state_pred where
  \<open>P_0x1a284_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1a284_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a295_4 :: state_pred where
  \<open>Q_0x1a295_4 \<sigma> \<equiv> RIP \<sigma> = 0x1a295 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1a295_4_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_3_0x1a284_0x1a28e_4[blocks]:
  assumes \<open>(P_0x1a284_false_4 && P_0x1a284_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1a28e 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a295_4 ?\<sigma> \<and> block_usage P_0x1a284_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a284_false_4_def P_0x1a284_false_4_regions_def post: Q_0x1a295_4_def regionset: P_0x1a284_false_4_regions_set_def)

definition P_0x1a295_5 :: state_pred where
  \<open>P_0x1a295_5 \<sigma> \<equiv> RIP \<sigma> = 0x1a295 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1a295_5_def[Ps]

definition P_0x1a295_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a295_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x1a295_5_regions :: state_pred where
  \<open>P_0x1a295_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1a295_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a2b3_5 :: state_pred where
  \<open>Q_0x1a2b3_5 \<sigma> \<equiv> RIP \<sigma> = 0x1a2b3 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1a2b3_5_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_8_0x1a295_0x1a2af_5[blocks]:
  assumes \<open>(P_0x1a295_5 && P_0x1a295_5_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1a2af 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a2b3_5 ?\<sigma> \<and> block_usage P_0x1a295_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a295_5_def P_0x1a295_5_regions_def post: Q_0x1a2b3_5_def regionset: P_0x1a295_5_regions_set_def)

definition P_0x1a2b3_6 :: state_pred where
  \<open>P_0x1a2b3_6 \<sigma> \<equiv> RIP \<sigma> = 0x1a2b3 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1a2b3_6_def[Ps]

definition P_0x1a2b3_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a2b3_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a2b3_6_regions :: state_pred where
  \<open>P_0x1a2b3_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1a2b3_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_memalign_addr_0x1a2b3_6 :: state_pred where
  \<open>Q_qemu_memalign_addr_0x1a2b3_6 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = qemu_memalign_addr \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2b8\<close>
declare Q_qemu_memalign_addr_0x1a2b3_6_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_1_0x1a2b3_0x1a2b3_6[blocks]:
  assumes \<open>(P_0x1a2b3_6 && P_0x1a2b3_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a2b3 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_memalign_addr_0x1a2b3_6 ?\<sigma> \<and> block_usage P_0x1a2b3_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a2b3_6_def P_0x1a2b3_6_regions_def post: Q_qemu_memalign_addr_0x1a2b3_6_def regionset: P_0x1a2b3_6_regions_set_def)

definition P_0x1a2b8_7 :: state_pred where
  \<open>P_0x1a2b8_7 \<sigma> \<equiv> RIP \<sigma> = 0x1a2b8 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2b8\<close>
declare P_0x1a2b8_7_def[Ps]

definition P_0x1a2b8_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a2b8_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x30), 8),
    (6, ((RBX \<sigma>::64 word) + 0x38), 4),
    (7, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a2b8_7_regions :: state_pred where
  \<open>P_0x1a2b8_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1a2b8_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a2c3_7 :: state_pred where
  \<open>Q_0x1a2c3_7 \<sigma> \<equiv> RIP \<sigma> = 0x1a2c3 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2b8\<close>
declare Q_0x1a2c3_7_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_3_0x1a2b8_0x1a2c0_7[blocks]:
  assumes \<open>(P_0x1a2b8_7 && P_0x1a2b8_7_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1a2c0 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a2c3_7 ?\<sigma> \<and> block_usage P_0x1a2b8_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a2b8_7_def P_0x1a2b8_7_regions_def post: Q_0x1a2c3_7_def regionset: P_0x1a2b8_7_regions_set_def)

definition P_0x1a2c3_true_8 :: state_pred where
  \<open>P_0x1a2c3_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x1a2c3 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2b8\<close>
declare P_0x1a2c3_true_8_def[Ps]

definition P_0x1a2c3_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a2c3_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x30), 8),
    (6, ((RBX \<sigma>::64 word) + 0x38), 4),
    (7, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a2c3_true_8_regions :: state_pred where
  \<open>P_0x1a2c3_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1a2c3_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a307_8 :: state_pred where
  \<open>Q_0x1a307_8 \<sigma> \<equiv> RIP \<sigma> = 0x1a307 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RAX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2b8\<close>
declare Q_0x1a307_8_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_3_0x1a2c3_0x1a304_8[blocks]:
  assumes \<open>(P_0x1a2c3_true_8 && P_0x1a2c3_true_8_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1a304 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a307_8 ?\<sigma> \<and> block_usage P_0x1a2c3_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a2c3_true_8_def P_0x1a2c3_true_8_regions_def post: Q_0x1a307_8_def regionset: P_0x1a2c3_true_8_regions_set_def)

definition P_0x1a307_9 :: state_pred where
  \<open>P_0x1a307_9 \<sigma> \<equiv> RIP \<sigma> = 0x1a307 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RAX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2b8\<close>
declare P_0x1a307_9_def[Ps]

definition P_0x1a307_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a307_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x30), 8),
    (6, ((RBX \<sigma>::64 word) + 0x38), 4),
    (7, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a307_9_regions :: state_pred where
  \<open>P_0x1a307_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1a307_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_iovec_to_buffer_addr_0x1a307_9 :: state_pred where
  \<open>Q_qemu_iovec_to_buffer_addr_0x1a307_9 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = qemu_iovec_to_buffer_addr \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a30c\<close>
declare Q_qemu_iovec_to_buffer_addr_0x1a307_9_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_1_0x1a307_0x1a307_9[blocks]:
  assumes \<open>(P_0x1a307_9 && P_0x1a307_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a307 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_iovec_to_buffer_addr_0x1a307_9 ?\<sigma> \<and> block_usage P_0x1a307_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a307_9_def P_0x1a307_9_regions_def post: Q_qemu_iovec_to_buffer_addr_0x1a307_9_def regionset: P_0x1a307_9_regions_set_def)

definition P_0x1a30c_10 :: state_pred where
  \<open>P_0x1a30c_10 \<sigma> \<equiv> RIP \<sigma> = 0x1a30c \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a30c\<close>
declare P_0x1a30c_10_def[Ps]

definition P_0x1a30c_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a30c_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x30), 8),
    (6, ((RBX \<sigma>::64 word) + 0x38), 4),
    (7, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a30c_10_regions :: state_pred where
  \<open>P_0x1a30c_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1a30c_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a323_10 :: state_pred where
  \<open>Q_0x1a323_10 \<sigma> \<equiv> RIP \<sigma> = 0x1a323 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a30c\<close>
declare Q_0x1a323_10_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_6_0x1a30c_0x1a320_10[blocks]:
  assumes \<open>(P_0x1a30c_10 && P_0x1a30c_10_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x1a320 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a323_10 ?\<sigma> \<and> block_usage P_0x1a30c_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a30c_10_def P_0x1a30c_10_regions_def post: Q_0x1a323_10_def regionset: P_0x1a30c_10_regions_set_def)

definition P_0x1a323_11 :: state_pred where
  \<open>P_0x1a323_11 \<sigma> \<equiv> RIP \<sigma> = 0x1a323 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a30c\<close>
declare P_0x1a323_11_def[Ps]

definition P_0x1a323_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a323_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x30), 8),
    (6, ((RBX \<sigma>::64 word) + 0x38), 4),
    (7, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a323_11_regions :: state_pred where
  \<open>P_0x1a323_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1a323_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_aio_write_addr_0x1a323_11 :: state_pred where
  \<open>Q_bdrv_aio_write_addr_0x1a323_11 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = bdrv_aio_write_addr \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a328\<close>
declare Q_bdrv_aio_write_addr_0x1a323_11_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_1_0x1a323_0x1a323_11[blocks]:
  assumes \<open>(P_0x1a323_11 && P_0x1a323_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a323 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_aio_write_addr_0x1a323_11 ?\<sigma> \<and> block_usage P_0x1a323_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a323_11_def P_0x1a323_11_regions_def post: Q_bdrv_aio_write_addr_0x1a323_11_def regionset: P_0x1a323_11_regions_set_def)

definition P_0x1a328_12 :: state_pred where
  \<open>P_0x1a328_12 \<sigma> \<equiv> RIP \<sigma> = 0x1a328 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a328\<close>
declare P_0x1a328_12_def[Ps]

definition P_0x1a328_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a328_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x30), 8),
    (6, ((RBX \<sigma>::64 word) + 0x38), 4),
    (7, ((RBX \<sigma>::64 word) + 0x40), 8),
    (8, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a328_12_regions :: state_pred where
  \<open>P_0x1a328_12_regions \<sigma> \<equiv> \<exists>regions. P_0x1a328_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a2e4_12 :: state_pred where
  \<open>Q_0x1a2e4_12 \<sigma> \<equiv> RIP \<sigma> = 0x1a2e4 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x40),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1a2e4_12_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_2_0x1a328_0x1a32c_12[blocks]:
  assumes \<open>(P_0x1a328_12 && P_0x1a328_12_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1a32c 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a2e4_12 ?\<sigma> \<and> block_usage P_0x1a328_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a328_12_def P_0x1a328_12_regions_def post: Q_0x1a2e4_12_def regionset: P_0x1a328_12_regions_set_def)

definition P_0x1a2c3_false_13 :: state_pred where
  \<open>P_0x1a2c3_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x1a2c3 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2b8\<close>
declare P_0x1a2c3_false_13_def[Ps]

definition P_0x1a2c3_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a2c3_false_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x30), 8),
    (6, ((RBX \<sigma>::64 word) + 0x38), 4),
    (7, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a2c3_false_13_regions :: state_pred where
  \<open>P_0x1a2c3_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1a2c3_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a2db_13 :: state_pred where
  \<open>Q_0x1a2db_13 \<sigma> \<equiv> RIP \<sigma> = 0x1a2db \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RAX \<sigma> \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2b8\<close>
declare Q_0x1a2db_13_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_7_0x1a2c3_0x1a2d8_13[blocks]:
  assumes \<open>(P_0x1a2c3_false_13 && P_0x1a2c3_false_13_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x1a2d8 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a2db_13 ?\<sigma> \<and> block_usage P_0x1a2c3_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a2c3_false_13_def P_0x1a2c3_false_13_regions_def post: Q_0x1a2db_13_def regionset: P_0x1a2c3_false_13_regions_set_def)

definition P_0x1a2db_14 :: state_pred where
  \<open>P_0x1a2db_14 \<sigma> \<equiv> RIP \<sigma> = 0x1a2db \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RAX \<sigma> \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2b8\<close>
declare P_0x1a2db_14_def[Ps]

definition P_0x1a2db_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a2db_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x30), 8),
    (6, ((RBX \<sigma>::64 word) + 0x38), 4),
    (7, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a2db_14_regions :: state_pred where
  \<open>P_0x1a2db_14_regions \<sigma> \<equiv> \<exists>regions. P_0x1a2db_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_aio_read_addr_0x1a2db_14 :: state_pred where
  \<open>Q_bdrv_aio_read_addr_0x1a2db_14 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = bdrv_aio_read_addr \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2e0\<close>
declare Q_bdrv_aio_read_addr_0x1a2db_14_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_1_0x1a2db_0x1a2db_14[blocks]:
  assumes \<open>(P_0x1a2db_14 && P_0x1a2db_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a2db 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_aio_read_addr_0x1a2db_14 ?\<sigma> \<and> block_usage P_0x1a2db_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a2db_14_def P_0x1a2db_14_regions_def post: Q_bdrv_aio_read_addr_0x1a2db_14_def regionset: P_0x1a2db_14_regions_set_def)

definition P_0x1a2e0_15 :: state_pred where
  \<open>P_0x1a2e0_15 \<sigma> \<equiv> RIP \<sigma> = 0x1a2e0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a2e0\<close>
declare P_0x1a2e0_15_def[Ps]

definition P_0x1a2e0_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a2e0_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x38), 4),
    (6, ((RBX \<sigma>::64 word) + 0x40), 8),
    (7, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a2e0_15_regions :: state_pred where
  \<open>P_0x1a2e0_15_regions \<sigma> \<equiv> \<exists>regions. P_0x1a2e0_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a2e4_15 :: state_pred where
  \<open>Q_0x1a2e4_15 \<sigma> \<equiv> RIP \<sigma> = 0x1a2e4 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x40),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1a2e4_15_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_1_0x1a2e0_0x1a2e0_15[blocks]:
  assumes \<open>(P_0x1a2e0_15 && P_0x1a2e0_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a2e0 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a2e4_15 ?\<sigma> \<and> block_usage P_0x1a2e0_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a2e0_15_def P_0x1a2e0_15_regions_def post: Q_0x1a2e4_15_def regionset: P_0x1a2e0_15_regions_set_def)

definition P_0x1a2e4_16 :: state_pred where
  \<open>P_0x1a2e4_16 \<sigma> \<equiv> RIP \<sigma> = 0x1a2e4 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x40),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1a2e4_16_def[Ps]

definition P_0x1a2e4_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a2e4_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x38), 4),
    (6, ((RBX \<sigma>::64 word) + 0x40), 8),
    (7, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x1a2e4_16_regions :: state_pred where
  \<open>P_0x1a2e4_16_regions \<sigma> \<equiv> \<exists>regions. P_0x1a2e4_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a2e7_16 :: state_pred where
  \<open>Q_0x1a2e7_16 \<sigma> \<equiv> RIP \<sigma> = 0x1a2e7 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x40),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1a2e7_16_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_1_0x1a2e4_0x1a2e4_16[blocks]:
  assumes \<open>(P_0x1a2e4_16 && P_0x1a2e4_16_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a2e4 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a2e7_16 ?\<sigma> \<and> block_usage P_0x1a2e4_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a2e4_16_def P_0x1a2e4_16_regions_def post: Q_0x1a2e7_16_def regionset: P_0x1a2e4_16_regions_set_def)

definition P_0x1a2e7_true_17 :: state_pred where
  \<open>P_0x1a2e7_true_17 \<sigma> \<equiv> RIP \<sigma> = 0x1a2e7 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x40),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1a2e7_true_17_def[Ps]

definition P_0x1a2e7_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a2e7_true_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x30), 8),
    (6, ((RBX \<sigma>::64 word) + 0x38), 4),
    (7, ((RBX \<sigma>::64 word) + 0x40), 8),
    (8, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1a2e7_true_17_regions :: state_pred where
  \<open>P_0x1a2e7_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0x1a2e7_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a379_17 :: state_pred where
  \<open>Q_0x1a379_17 \<sigma> \<equiv> RIP \<sigma> = 0x1a379 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x40),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RAX \<sigma>\<close>
declare Q_0x1a379_17_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_3_0x1a2e7_0x1a374_17[blocks]:
  assumes \<open>(P_0x1a2e7_true_17 && P_0x1a2e7_true_17_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1a374 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a379_17 ?\<sigma> \<and> block_usage P_0x1a2e7_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a2e7_true_17_def P_0x1a2e7_true_17_regions_def post: Q_0x1a379_17_def regionset: P_0x1a2e7_true_17_regions_set_def)

definition P_0x1a379_18 :: state_pred where
  \<open>P_0x1a379_18 \<sigma> \<equiv> RIP \<sigma> = 0x1a379 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x40),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RAX \<sigma>\<close>
declare P_0x1a379_18_def[Ps]

definition P_0x1a379_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a379_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x30), 8),
    (6, ((RBX \<sigma>::64 word) + 0x38), 4),
    (7, ((RBX \<sigma>::64 word) + 0x40), 8),
    (8, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a379_18_regions :: state_pred where
  \<open>P_0x1a379_18_regions \<sigma> \<equiv> \<exists>regions. P_0x1a379_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_vfree_addr_0x1a379_18 :: state_pred where
  \<open>Q_qemu_vfree_addr_0x1a379_18 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = qemu_vfree_addr \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a37e\<close>
declare Q_qemu_vfree_addr_0x1a379_18_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_1_0x1a379_0x1a379_18[blocks]:
  assumes \<open>(P_0x1a379_18 && P_0x1a379_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a379 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_vfree_addr_0x1a379_18 ?\<sigma> \<and> block_usage P_0x1a379_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a379_18_def P_0x1a379_18_regions_def post: Q_qemu_vfree_addr_0x1a379_18_def regionset: P_0x1a379_18_regions_set_def)

definition P_0x1a37e_19 :: state_pred where
  \<open>P_0x1a37e_19 \<sigma> \<equiv> RIP \<sigma> = 0x1a37e \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a37e\<close>
declare P_0x1a37e_19_def[Ps]

definition P_0x1a37e_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a37e_19_regions_set \<sigma> \<equiv> {
    (0, RBX \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 8),
    (3, ((RBX \<sigma>::64 word) + 0x10), 8),
    (4, ((RBX \<sigma>::64 word) + 0x18), 8),
    (5, ((RBX \<sigma>::64 word) + 0x20), 8),
    (6, ((RBX \<sigma>::64 word) + 0x28), 8),
    (7, ((RBX \<sigma>::64 word) + 0x30), 8),
    (8, ((RBX \<sigma>::64 word) + 0x38), 4),
    (9, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (10, (((\<sigma> \<turnstile> *[RBX \<sigma>,8]::64 word)::64 word) + 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a37e_19_regions :: state_pred where
  \<open>P_0x1a37e_19_regions \<sigma> \<equiv> \<exists>regions. P_0x1a37e_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a2f0_19 :: state_pred where
  \<open>Q_0x1a2f0_19 \<sigma> \<equiv> RIP \<sigma> = 0x1a2f0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1a2f0_19_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_6_0x1a37e_0x1a392_19[blocks]:
  assumes \<open>(P_0x1a37e_19 && P_0x1a37e_19_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x1a392 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a2f0_19 ?\<sigma> \<and> block_usage P_0x1a37e_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a37e_19_def P_0x1a37e_19_regions_def post: Q_0x1a2f0_19_def regionset: P_0x1a37e_19_regions_set_def)

definition P_0x1a2e7_false_20 :: state_pred where
  \<open>P_0x1a2e7_false_20 \<sigma> \<equiv> RIP \<sigma> = 0x1a2e7 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x40),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1a2e7_false_20_def[Ps]

definition P_0x1a2e7_false_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a2e7_false_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x38), 4),
    (6, ((RBX \<sigma>::64 word) + 0x40), 8),
    (7, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x1a2e7_false_20_regions :: state_pred where
  \<open>P_0x1a2e7_false_20_regions \<sigma> \<equiv> \<exists>regions. P_0x1a2e7_false_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a2f0_20 :: state_pred where
  \<open>Q_0x1a2f0_20 \<sigma> \<equiv> RIP \<sigma> = 0x1a2f0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1a2f0_20_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_2_0x1a2e7_0x1a2ed_20[blocks]:
  assumes \<open>(P_0x1a2e7_false_20 && P_0x1a2e7_false_20_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1a2ed 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a2f0_20 ?\<sigma> \<and> block_usage P_0x1a2e7_false_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a2e7_false_20_def P_0x1a2e7_false_20_regions_def post: Q_0x1a2f0_20_def regionset: P_0x1a2e7_false_20_regions_set_def)

definition P_0x1a2f0_21 :: state_pred where
  \<open>P_0x1a2f0_21 \<sigma> \<equiv> RIP \<sigma> = 0x1a2f0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> R9 \<sigma> = RBX \<sigma> \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x18),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x28),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1a2f0_21_def[Ps]

definition P_0x1a2f0_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a2f0_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 8),
    (2, ((RBX \<sigma>::64 word) + 0x10), 8),
    (3, ((RBX \<sigma>::64 word) + 0x18), 8),
    (4, ((RBX \<sigma>::64 word) + 0x28), 8),
    (5, ((RBX \<sigma>::64 word) + 0x38), 4),
    (6, ((RSP\<^sub>0::64 word) + 0x8), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x1a2f0_21_regions :: state_pred where
  \<open>P_0x1a2f0_21_regions \<sigma> \<equiv> \<exists>regions. P_0x1a2f0_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_21 :: state_pred where
  \<open>Q_ret_address_21 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = 0x17d40 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_21_def[Qs]

schematic_goal bdrv_aio_rw_vector_0_7_0x1a2f0_0x1a2fc_21[blocks]:
  assumes \<open>(P_0x1a2f0_21 && P_0x1a2f0_21_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1a2fc 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_21 ?\<sigma> \<and> block_usage P_0x1a2f0_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a2f0_21_def P_0x1a2f0_21_regions_def post: Q_ret_address_21_def regionset: P_0x1a2f0_21_regions_set_def)

definition bdrv_aio_rw_vector_acode :: ACode where
  \<open>bdrv_aio_rw_vector_acode =
    Block 12 0x1a281 0;
    IF ZF THEN
      Block 5 0x1a341 (Suc 0);
      Block (Suc 0) 0x1a346 2;
      CALL qemu_mallocz_acode;
      Block 7 0x1a367 3
    ELSE
      Block 3 0x1a28e 4
    FI;
    Block 8 0x1a2af 5;
    Block (Suc 0) 0x1a2b3 6;
    CALL qemu_memalign_acode;
    Block 3 0x1a2c0 7;
    IF !ZF THEN
      Block 3 0x1a304 8;
      Block (Suc 0) 0x1a307 9;
      CALL qemu_iovec_to_buffer_acode;
      Block 6 0x1a320 10;
      Block (Suc 0) 0x1a323 11;
      CALL bdrv_aio_write_acode;
      Block 2 0x1a32c 12
    ELSE
      Block 7 0x1a2d8 13;
      Block (Suc 0) 0x1a2db 14;
      CALL bdrv_aio_read_acode;
      Block (Suc 0) 0x1a2e0 15
    FI;
    Block (Suc 0) 0x1a2e4 16;
    IF ZF THEN
      Block 3 0x1a374 17;
      Block (Suc 0) 0x1a379 18;
      CALL qemu_vfree_acode;
      Block 6 0x1a392 19
    ELSE
      Block 2 0x1a2ed 20
    FI;
    Block 7 0x1a2fc 21
  \<close>

schematic_goal "bdrv_aio_rw_vector":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a284 \<longrightarrow> P_0x1a284_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a346 \<longrightarrow> P_0x1a346_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a34b \<longrightarrow> P_0x1a34b_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a284 \<longrightarrow> P_0x1a284_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a295 \<longrightarrow> P_0x1a295_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a2b3 \<longrightarrow> P_0x1a2b3_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a2b8 \<longrightarrow> P_0x1a2b8_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a2c3 \<longrightarrow> P_0x1a2c3_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a307 \<longrightarrow> P_0x1a307_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a30c \<longrightarrow> P_0x1a30c_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a323 \<longrightarrow> P_0x1a323_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a328 \<longrightarrow> P_0x1a328_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a2c3 \<longrightarrow> P_0x1a2c3_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a2db \<longrightarrow> P_0x1a2db_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a2e0 \<longrightarrow> P_0x1a2e0_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a2e4 \<longrightarrow> P_0x1a2e4_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a2e7 \<longrightarrow> P_0x1a2e7_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a379 \<longrightarrow> P_0x1a379_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a37e \<longrightarrow> P_0x1a37e_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a2e7 \<longrightarrow> P_0x1a2e7_false_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a2f0 \<longrightarrow> P_0x1a2f0_21_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_qemu_mallocz_addr_0x1a346_2}} \<box>qemu_mallocz_acode {{P_0x1a34b_3;M_0x1a346}}\<close>
    and [blocks]: \<open>{{Q_qemu_memalign_addr_0x1a2b3_6}} \<box>qemu_memalign_acode {{P_0x1a2b8_7;M_0x1a2b3}}\<close>
    and [blocks]: \<open>{{Q_qemu_iovec_to_buffer_addr_0x1a307_9}} \<box>qemu_iovec_to_buffer_acode {{P_0x1a30c_10;M_0x1a307}}\<close>
    and [blocks]: \<open>{{Q_bdrv_aio_write_addr_0x1a323_11}} \<box>bdrv_aio_write_acode {{P_0x1a328_12;M_0x1a323}}\<close>
    and [blocks]: \<open>{{Q_bdrv_aio_read_addr_0x1a2db_14}} \<box>bdrv_aio_read_acode {{P_0x1a2e0_15;M_0x1a2db}}\<close>
    and [blocks]: \<open>{{Q_qemu_vfree_addr_0x1a379_18}} \<box>qemu_vfree_acode {{P_0x1a37e_19;M_0x1a379}}\<close>
  shows \<open>{{?P}} bdrv_aio_rw_vector_acode {{?Q;?M}}\<close>
  by (vcg acode: bdrv_aio_rw_vector_acode_def assms: assms)

end
