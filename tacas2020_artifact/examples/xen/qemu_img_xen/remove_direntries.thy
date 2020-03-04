theory remove_direntries
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes qemu_malloc_0xc19b_retval\<^sub>v memcpy_0xc1ad_retval\<^sub>v memmove_0xc1d4_retval\<^sub>v memcpy_0xc1e2_retval\<^sub>v free_0xc1ea_retval\<^sub>v adjust_dirindices_0xc208_retval\<^sub>v memmove_0xc22e_retval\<^sub>v assert_fail_0xc259_retval\<^sub>v assert_fail_0xc278_retval\<^sub>v assert_fail_0xc297_retval\<^sub>v assert_fail_addr adjust_dirindices_addr free_addr memcpy_addr memmove_addr qemu_malloc_addr :: \<open>64 word\<close>
    and assert_fail_acode adjust_dirindices_acode free_acode memcpy_acode memmove_acode qemu_malloc_acode :: ACode
  assumes fetch:
    "fetch 0xc100 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xc102 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xc104 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xc106 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xc108 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xc109 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xc10a \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 40)), 4)"
    "fetch 0xc10e \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0xc110 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 49789)), 6)"
    "fetch 0xc116 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xc118 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xc11a \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 49758)), 6)"
    "fetch 0xc120 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32820))))), 6)"
    "fetch 0xc126 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Mult 1 (A_FromReg (General SixtyFour rdx)))))), 3)"
    "fetch 0xc129 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0xc12c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0xc12e \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xc130 \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 49727)), 6)"
    "fetch 0xc136 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0xc139 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0xc13d \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 49720)), 6)"
    "fetch 0xc143 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0xc145 \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 49720)), 6)"
    "fetch 0xc14b \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0xc14e \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 49654)), 6)"
    "fetch 0xc154 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32824))))), 7)"
    "fetch 0xc15b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0xc15e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r10)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0xc161 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32808))))), 7)"
    "fetch 0xc168 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 20)))) (Storage (Reg (General ThirtyTwo r9))), 5)"
    "fetch 0xc16d \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo r10)) (Storage (Reg (General ThirtyTwo r12))), 4)"
    "fetch 0xc171 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo r12))), 4)"
    "fetch 0xc175 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rbx))), 4)"
    "fetch 0xc179 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r10)) (Storage (Reg (General ThirtyTwo r10))), 3)"
    "fetch 0xc17c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour r10))) (A_WordConstant 0))))), 5)"
    "fetch 0xc181 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r8)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0xc184 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour r10))), 5)"
    "fetch 0xc189 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0xc18c \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0xc18f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour r8))), 5)"
    "fetch 0xc194 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xc197 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0xc19b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_malloc'')), 5)"
    "fetch 0xc1a0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0xc1a4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xc1a7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xc1aa \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xc1ad \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0xc1b2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 20))))), 5)"
    "fetch 0xc1b7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0xc1bc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0xc1c1 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0xc1c4 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 49696)), 2)"
    "fetch 0xc1c6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0xc1ca \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0xc1cd \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0xc1d0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 1 (A_FromReg (General SixtyFour r12)))))), 4)"
    "fetch 0xc1d4 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memmove'')), 5)"
    "fetch 0xc1d9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xc1dc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0xc1df \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0xc1e2 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0xc1e7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0xc1ea \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''free'')), 5)"
    "fetch 0xc1ef \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 32820))))), 7)"
    "fetch 0xc1f6 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0xc1f8 \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0xc1fa \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0xc1fc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0xc1ff \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 32820)))) (Storage (Reg (General ThirtyTwo rax))), 7)"
    "fetch 0xc206 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0xc208 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''adjust_dirindices'')), 5)"
    "fetch 0xc20d \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xc20f \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 40)), 4)"
    "fetch 0xc213 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xc214 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xc215 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xc217 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xc219 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xc21b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xc21d \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xc21e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0xc220 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0xc223 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour r12))) (A_WordConstant 0))))), 5)"
    "fetch 0xc228 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0xc22b \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0xc22e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memmove'')), 5)"
    "fetch 0xc233 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 49625)), 2)"
    "fetch 0xc235 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0xc238 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0xc23d \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 49679)), 2)"
    "fetch 0xc23f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 86378)))), 7)"
    "fetch 0xc246 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 181)), 5)"
    "fetch 0xc24b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 84116)))), 7)"
    "fetch 0xc252 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 84133)))), 7)"
    "fetch 0xc259 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    "fetch 0xc25e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 86347)))), 7)"
    "fetch 0xc265 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 180)), 5)"
    "fetch 0xc26a \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 84085)))), 7)"
    "fetch 0xc271 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 84224)))), 7)"
    "fetch 0xc278 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    "fetch 0xc27d \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 86316)))), 7)"
    "fetch 0xc284 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 179)), 5)"
    "fetch 0xc289 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 84054)))), 7)"
    "fetch 0xc290 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 84061)))), 7)"
    "fetch 0xc297 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and assert_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__assert_fail'') = assert_fail_addr\<close>
    and adjust_dirindices\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''adjust_dirindices'') = adjust_dirindices_addr\<close>
    and free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''free'') = free_addr\<close>
    and memcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcpy'') = memcpy_addr\<close>
    and memmove\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memmove'') = memmove_addr\<close>
    and qemu_malloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_malloc'') = qemu_malloc_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>qemu_malloc_0xc19b_retval \<equiv> qemu_malloc_0xc19b_retval\<^sub>v\<close>
definition \<open>memcpy_0xc1ad_retval \<equiv> memcpy_0xc1ad_retval\<^sub>v\<close>
definition \<open>memmove_0xc1d4_retval \<equiv> memmove_0xc1d4_retval\<^sub>v\<close>
definition \<open>memcpy_0xc1e2_retval \<equiv> memcpy_0xc1e2_retval\<^sub>v\<close>
definition \<open>free_0xc1ea_retval \<equiv> free_0xc1ea_retval\<^sub>v\<close>
definition \<open>adjust_dirindices_0xc208_retval \<equiv> adjust_dirindices_0xc208_retval\<^sub>v\<close>
definition \<open>memmove_0xc22e_retval \<equiv> memmove_0xc22e_retval\<^sub>v\<close>
definition \<open>assert_fail_0xc259_retval \<equiv> assert_fail_0xc259_retval\<^sub>v\<close>
definition \<open>assert_fail_0xc278_retval \<equiv> assert_fail_0xc278_retval\<^sub>v\<close>
definition \<open>assert_fail_0xc297_retval \<equiv> assert_fail_0xc297_retval\<^sub>v\<close>

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

locale "remove_direntries" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R10\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R15\<^sub>0 \<equiv> R15\<^sub>0\<^sub>v\<close>
definition \<open>R14\<^sub>0 \<equiv> R14\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>R10\<^sub>0 \<equiv> R10\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0xc100_0 :: state_pred where
  \<open>P_0xc100_0 \<sigma> \<equiv> RIP \<sigma> = 0xc100 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0xc100_0_def[Ps]

definition P_0xc100_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc100_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc100_0_regions :: state_pred where
  \<open>P_0xc100_0_regions \<sigma> \<equiv> \<exists>regions. P_0xc100_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc110_0 :: state_pred where
  \<open>Q_0xc110_0 \<sigma> \<equiv> RIP \<sigma> = 0xc110 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc110_0_def[Qs]

schematic_goal remove_direntries_0_8_0xc100_0xc10e_0[blocks]:
  assumes \<open>(P_0xc100_0 && P_0xc100_0_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0xc10e 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc110_0 ?\<sigma> \<and> block_usage P_0xc100_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc100_0_def P_0xc100_0_regions_def post: Q_0xc110_0_def regionset: P_0xc100_0_regions_set_def)

definition P_0xc110_true_1 :: state_pred where
  \<open>P_0xc110_true_1 \<sigma> \<equiv> RIP \<sigma> = 0xc110 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc110_true_1_def[Ps]

definition P_0xc110_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc110_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc110_true_1_regions :: state_pred where
  \<open>P_0xc110_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0xc110_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc297_1 :: state_pred where
  \<open>Q_0xc297_1 \<sigma> \<equiv> RIP \<sigma> = 0xc297 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x213b0 \<and> RDX \<sigma> = 0xb3 \<and> RDI \<sigma> = 0x20af4 \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc297_1_def[Qs]

schematic_goal remove_direntries_0_5_0xc110_0xc290_1[blocks]:
  assumes \<open>(P_0xc110_true_1 && P_0xc110_true_1_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 5 0xc290 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc297_1 ?\<sigma> \<and> block_usage P_0xc110_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc110_true_1_def P_0xc110_true_1_regions_def post: Q_0xc297_1_def regionset: P_0xc110_true_1_regions_set_def)

definition P_0xc297_2 :: state_pred where
  \<open>P_0xc297_2 \<sigma> \<equiv> RIP \<sigma> = 0xc297 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x213b0 \<and> RDX \<sigma> = 0xb3 \<and> RDI \<sigma> = 0x20af4 \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc297_2_def[Ps]

definition P_0xc297_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc297_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc297_2_regions :: state_pred where
  \<open>P_0xc297_2_regions \<sigma> \<equiv> \<exists>regions. P_0xc297_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xc297_2 :: state_pred where
  \<open>Q_assert_fail_addr_0xc297_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = assert_fail_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_assert_fail_addr_0xc297_2_def[Qs]

schematic_goal remove_direntries_0_1_0xc297_0xc297_2[blocks]:
  assumes \<open>(P_0xc297_2 && P_0xc297_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc297 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xc297_2 ?\<sigma> \<and> block_usage P_0xc297_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc297_2_def P_0xc297_2_regions_def post: Q_assert_fail_addr_0xc297_2_def regionset: P_0xc297_2_regions_set_def)

definition P_0xc110_false_3 :: state_pred where
  \<open>P_0xc110_false_3 \<sigma> \<equiv> RIP \<sigma> = 0xc110 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc110_false_3_def[Ps]

definition P_0xc110_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc110_false_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc110_false_3_regions :: state_pred where
  \<open>P_0xc110_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0xc110_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc11a_3 :: state_pred where
  \<open>Q_0xc11a_3 \<sigma> \<equiv> RIP \<sigma> = 0xc11a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc11a_3_def[Qs]

schematic_goal remove_direntries_0_3_0xc110_0xc118_3[blocks]:
  assumes \<open>(P_0xc110_false_3 && P_0xc110_false_3_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 3 0xc118 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc11a_3 ?\<sigma> \<and> block_usage P_0xc110_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc110_false_3_def P_0xc110_false_3_regions_def post: Q_0xc11a_3_def regionset: P_0xc110_false_3_regions_set_def)

definition P_0xc11a_true_4 :: state_pred where
  \<open>P_0xc11a_true_4 \<sigma> \<equiv> RIP \<sigma> = 0xc11a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc11a_true_4_def[Ps]

definition P_0xc11a_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc11a_true_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc11a_true_4_regions :: state_pred where
  \<open>P_0xc11a_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0xc11a_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc278_4 :: state_pred where
  \<open>Q_0xc278_4 \<sigma> \<equiv> RIP \<sigma> = 0xc278 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x213b0 \<and> RDX \<sigma> = 0xb4 \<and> RDI \<sigma> = 0x20b78 \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc278_4_def[Qs]

schematic_goal remove_direntries_0_5_0xc11a_0xc271_4[blocks]:
  assumes \<open>(P_0xc11a_true_4 && P_0xc11a_true_4_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 5 0xc271 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc278_4 ?\<sigma> \<and> block_usage P_0xc11a_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc11a_true_4_def P_0xc11a_true_4_regions_def post: Q_0xc278_4_def regionset: P_0xc11a_true_4_regions_set_def)

definition P_0xc278_5 :: state_pred where
  \<open>P_0xc278_5 \<sigma> \<equiv> RIP \<sigma> = 0xc278 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x213b0 \<and> RDX \<sigma> = 0xb4 \<and> RDI \<sigma> = 0x20b78 \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc278_5_def[Ps]

definition P_0xc278_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc278_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc278_5_regions :: state_pred where
  \<open>P_0xc278_5_regions \<sigma> \<equiv> \<exists>regions. P_0xc278_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xc278_5 :: state_pred where
  \<open>Q_assert_fail_addr_0xc278_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = assert_fail_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_assert_fail_addr_0xc278_5_def[Qs]

schematic_goal remove_direntries_0_1_0xc278_0xc278_5[blocks]:
  assumes \<open>(P_0xc278_5 && P_0xc278_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc278 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xc278_5 ?\<sigma> \<and> block_usage P_0xc278_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc278_5_def P_0xc278_5_regions_def post: Q_assert_fail_addr_0xc278_5_def regionset: P_0xc278_5_regions_set_def)

definition P_0xc11a_false_6 :: state_pred where
  \<open>P_0xc11a_false_6 \<sigma> \<equiv> RIP \<sigma> = 0xc11a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc11a_false_6_def[Ps]

definition P_0xc11a_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc11a_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc11a_false_6_regions :: state_pred where
  \<open>P_0xc11a_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0xc11a_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc130_6 :: state_pred where
  \<open>Q_0xc130_6 \<sigma> \<equiv> RIP \<sigma> = 0xc130 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc130_6_def[Qs]

schematic_goal remove_direntries_0_6_0xc11a_0xc12e_6[blocks]:
  assumes \<open>(P_0xc11a_false_6 && P_0xc11a_false_6_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 6 0xc12e 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc130_6 ?\<sigma> \<and> block_usage P_0xc11a_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc11a_false_6_def P_0xc11a_false_6_regions_def post: Q_0xc130_6_def regionset: P_0xc11a_false_6_regions_set_def)

definition P_0xc130_true_7 :: state_pred where
  \<open>P_0xc130_true_7 \<sigma> \<equiv> RIP \<sigma> = 0xc130 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc130_true_7_def[Ps]

definition P_0xc130_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc130_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc130_true_7_regions :: state_pred where
  \<open>P_0xc130_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0xc130_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc259_7 :: state_pred where
  \<open>Q_0xc259_7 \<sigma> \<equiv> RIP \<sigma> = 0xc259 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x213b0 \<and> RDX \<sigma> = 0xb5 \<and> RDI \<sigma> = 0x20afe \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc259_7_def[Qs]

schematic_goal remove_direntries_0_5_0xc130_0xc252_7[blocks]:
  assumes \<open>(P_0xc130_true_7 && P_0xc130_true_7_regions && ja) \<sigma>\<close>
  shows \<open>exec_block 5 0xc252 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc259_7 ?\<sigma> \<and> block_usage P_0xc130_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc130_true_7_def P_0xc130_true_7_regions_def post: Q_0xc259_7_def regionset: P_0xc130_true_7_regions_set_def)

definition P_0xc259_8 :: state_pred where
  \<open>P_0xc259_8 \<sigma> \<equiv> RIP \<sigma> = 0xc259 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x213b0 \<and> RDX \<sigma> = 0xb5 \<and> RDI \<sigma> = 0x20afe \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc259_8_def[Ps]

definition P_0xc259_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc259_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc259_8_regions :: state_pred where
  \<open>P_0xc259_8_regions \<sigma> \<equiv> \<exists>regions. P_0xc259_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xc259_8 :: state_pred where
  \<open>Q_assert_fail_addr_0xc259_8 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = assert_fail_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_assert_fail_addr_0xc259_8_def[Qs]

schematic_goal remove_direntries_0_1_0xc259_0xc259_8[blocks]:
  assumes \<open>(P_0xc259_8 && P_0xc259_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc259 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xc259_8 ?\<sigma> \<and> block_usage P_0xc259_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc259_8_def P_0xc259_8_regions_def post: Q_assert_fail_addr_0xc259_8_def regionset: P_0xc259_8_regions_set_def)

definition P_0xc130_false_9 :: state_pred where
  \<open>P_0xc130_false_9 \<sigma> \<equiv> RIP \<sigma> = 0xc130 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc130_false_9_def[Ps]

definition P_0xc130_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc130_false_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc130_false_9_regions :: state_pred where
  \<open>P_0xc130_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0xc130_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc13d_9 :: state_pred where
  \<open>Q_0xc13d_9 \<sigma> \<equiv> RIP \<sigma> = 0xc13d \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc13d_9_def[Qs]

schematic_goal remove_direntries_0_3_0xc130_0xc139_9[blocks]:
  assumes \<open>(P_0xc130_false_9 && P_0xc130_false_9_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block 3 0xc139 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc13d_9 ?\<sigma> \<and> block_usage P_0xc130_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc130_false_9_def P_0xc130_false_9_regions_def post: Q_0xc13d_9_def regionset: P_0xc130_false_9_regions_set_def)

definition P_0xc13d_true_10 :: state_pred where
  \<open>P_0xc13d_true_10 \<sigma> \<equiv> RIP \<sigma> = 0xc13d \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc13d_true_10_def[Ps]

definition P_0xc13d_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc13d_true_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc13d_true_10_regions :: state_pred where
  \<open>P_0xc13d_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0xc13d_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc20f_10 :: state_pred where
  \<open>Q_0xc20f_10 \<sigma> \<equiv> RIP \<sigma> = 0xc20f \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc20f_10_def[Qs]

schematic_goal remove_direntries_0_3_0xc13d_0xc23d_10[blocks]:
  assumes \<open>(P_0xc13d_true_10 && P_0xc13d_true_10_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0xc23d 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc20f_10 ?\<sigma> \<and> block_usage P_0xc13d_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc13d_true_10_def P_0xc13d_true_10_regions_def post: Q_0xc20f_10_def regionset: P_0xc13d_true_10_regions_set_def)

definition P_0xc13d_false_11 :: state_pred where
  \<open>P_0xc13d_false_11 \<sigma> \<equiv> RIP \<sigma> = 0xc13d \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc13d_false_11_def[Ps]

definition P_0xc13d_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc13d_false_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc13d_false_11_regions :: state_pred where
  \<open>P_0xc13d_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0xc13d_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc145_11 :: state_pred where
  \<open>Q_0xc145_11 \<sigma> \<equiv> RIP \<sigma> = 0xc145 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc145_11_def[Qs]

schematic_goal remove_direntries_0_2_0xc13d_0xc143_11[blocks]:
  assumes \<open>(P_0xc13d_false_11 && P_0xc13d_false_11_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 2 0xc143 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc145_11 ?\<sigma> \<and> block_usage P_0xc13d_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc13d_false_11_def P_0xc13d_false_11_regions_def post: Q_0xc145_11_def regionset: P_0xc13d_false_11_regions_set_def)

definition P_0xc145_true_12 :: state_pred where
  \<open>P_0xc145_true_12 \<sigma> \<equiv> RIP \<sigma> = 0xc145 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc145_true_12_def[Ps]

definition P_0xc145_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc145_true_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc145_true_12_regions :: state_pred where
  \<open>P_0xc145_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0xc145_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc20f_12 :: state_pred where
  \<open>Q_0xc20f_12 \<sigma> \<equiv> RIP \<sigma> = 0xc20f \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc20f_12_def[Qs]

schematic_goal remove_direntries_0_3_0xc145_0xc23d_12[blocks]:
  assumes \<open>(P_0xc145_true_12 && P_0xc145_true_12_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 3 0xc23d 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc20f_12 ?\<sigma> \<and> block_usage P_0xc145_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc145_true_12_def P_0xc145_true_12_regions_def post: Q_0xc20f_12_def regionset: P_0xc145_true_12_regions_set_def)

definition P_0xc145_false_13 :: state_pred where
  \<open>P_0xc145_false_13 \<sigma> \<equiv> RIP \<sigma> = 0xc145 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc145_false_13_def[Ps]

definition P_0xc145_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc145_false_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc145_false_13_regions :: state_pred where
  \<open>P_0xc145_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0xc145_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc14e_13 :: state_pred where
  \<open>Q_0xc14e_13 \<sigma> \<equiv> RIP \<sigma> = 0xc14e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc14e_13_def[Qs]

schematic_goal remove_direntries_0_2_0xc145_0xc14b_13[blocks]:
  assumes \<open>(P_0xc145_false_13 && P_0xc145_false_13_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 2 0xc14b 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc14e_13 ?\<sigma> \<and> block_usage P_0xc145_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc145_false_13_def P_0xc145_false_13_regions_def post: Q_0xc14e_13_def regionset: P_0xc145_false_13_regions_set_def)

definition P_0xc14e_true_14 :: state_pred where
  \<open>P_0xc14e_true_14 \<sigma> \<equiv> RIP \<sigma> = 0xc14e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc14e_true_14_def[Ps]

definition P_0xc14e_true_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc14e_true_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc14e_true_14_regions :: state_pred where
  \<open>P_0xc14e_true_14_regions \<sigma> \<equiv> \<exists>regions. P_0xc14e_true_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc1f6_14 :: state_pred where
  \<open>Q_0xc1f6_14 \<sigma> \<equiv> RIP \<sigma> = 0xc1f6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc1f6_14_def[Qs]

schematic_goal remove_direntries_0_1_0xc14e_0xc14e_14[blocks]:
  assumes \<open>(P_0xc14e_true_14 && P_0xc14e_true_14_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc14e 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc1f6_14 ?\<sigma> \<and> block_usage P_0xc14e_true_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc14e_true_14_def P_0xc14e_true_14_regions_def post: Q_0xc1f6_14_def regionset: P_0xc14e_true_14_regions_set_def)

definition P_0xc14e_false_15 :: state_pred where
  \<open>P_0xc14e_false_15 \<sigma> \<equiv> RIP \<sigma> = 0xc14e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc14e_false_15_def[Ps]

definition P_0xc14e_false_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc14e_false_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8)
  }\<close>

definition P_0xc14e_false_15_regions :: state_pred where
  \<open>P_0xc14e_false_15_regions \<sigma> \<equiv> \<exists>regions. P_0xc14e_false_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc19b_15 :: state_pred where
  \<open>Q_0xc19b_15 \<sigma> \<equiv> RIP \<sigma> = 0xc19b \<and> RAX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare Q_0xc19b_15_def[Qs]

schematic_goal remove_direntries_0_18_0xc14e_0xc197_15[blocks]:
  assumes \<open>(P_0xc14e_false_15 && P_0xc14e_false_15_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 18 0xc197 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc19b_15 ?\<sigma> \<and> block_usage P_0xc14e_false_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc14e_false_15_def P_0xc14e_false_15_regions_def post: Q_0xc19b_15_def regionset: P_0xc14e_false_15_regions_set_def)

definition P_0xc19b_16 :: state_pred where
  \<open>P_0xc19b_16 \<sigma> \<equiv> RIP \<sigma> = 0xc19b \<and> RAX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare P_0xc19b_16_def[Ps]

definition P_0xc19b_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc19b_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc19b_16_regions :: state_pred where
  \<open>P_0xc19b_16_regions \<sigma> \<equiv> \<exists>regions. P_0xc19b_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_malloc_addr_0xc19b_16 :: state_pred where
  \<open>Q_qemu_malloc_addr_0xc19b_16 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = qemu_malloc_addr \<and> RAX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1a0\<close>
declare Q_qemu_malloc_addr_0xc19b_16_def[Qs]

schematic_goal remove_direntries_0_1_0xc19b_0xc19b_16[blocks]:
  assumes \<open>(P_0xc19b_16 && P_0xc19b_16_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc19b 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_malloc_addr_0xc19b_16 ?\<sigma> \<and> block_usage P_0xc19b_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc19b_16_def P_0xc19b_16_regions_def post: Q_qemu_malloc_addr_0xc19b_16_def regionset: P_0xc19b_16_regions_set_def)

definition P_0xc1a0_17 :: state_pred where
  \<open>P_0xc1a0_17 \<sigma> \<equiv> RIP \<sigma> = 0xc1a0 \<and> RAX \<sigma> = qemu_malloc_0xc19b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::32 word)) \<and> RDI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1a0\<close>
declare P_0xc1a0_17_def[Ps]

definition P_0xc1a0_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1a0_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc1a0_17_regions :: state_pred where
  \<open>P_0xc1a0_17_regions \<sigma> \<equiv> \<exists>regions. P_0xc1a0_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc1ad_17 :: state_pred where
  \<open>Q_0xc1ad_17 \<sigma> \<equiv> RIP \<sigma> = 0xc1ad \<and> RAX \<sigma> = qemu_malloc_0xc19b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1a0\<close>
declare Q_0xc1ad_17_def[Qs]

schematic_goal remove_direntries_0_4_0xc1a0_0xc1aa_17[blocks]:
  assumes \<open>(P_0xc1a0_17 && P_0xc1a0_17_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0xc1aa 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc1ad_17 ?\<sigma> \<and> block_usage P_0xc1a0_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1a0_17_def P_0xc1a0_17_regions_def post: Q_0xc1ad_17_def regionset: P_0xc1a0_17_regions_set_def)

definition P_0xc1ad_18 :: state_pred where
  \<open>P_0xc1ad_18 \<sigma> \<equiv> RIP \<sigma> = 0xc1ad \<and> RAX \<sigma> = qemu_malloc_0xc19b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1a0\<close>
declare P_0xc1ad_18_def[Ps]

definition P_0xc1ad_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1ad_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc1ad_18_regions :: state_pred where
  \<open>P_0xc1ad_18_regions \<sigma> \<equiv> \<exists>regions. P_0xc1ad_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0xc1ad_18 :: state_pred where
  \<open>Q_memcpy_addr_0xc1ad_18 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = qemu_malloc_0xc19b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1b2\<close>
declare Q_memcpy_addr_0xc1ad_18_def[Qs]

schematic_goal remove_direntries_0_1_0xc1ad_0xc1ad_18[blocks]:
  assumes \<open>(P_0xc1ad_18 && P_0xc1ad_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc1ad 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0xc1ad_18 ?\<sigma> \<and> block_usage P_0xc1ad_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1ad_18_def P_0xc1ad_18_regions_def post: Q_memcpy_addr_0xc1ad_18_def regionset: P_0xc1ad_18_regions_set_def)

definition P_0xc1b2_19 :: state_pred where
  \<open>P_0xc1b2_19 \<sigma> \<equiv> RIP \<sigma> = 0xc1b2 \<and> RAX \<sigma> = memcpy_0xc1ad_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1b2\<close>
declare P_0xc1b2_19_def[Ps]

definition P_0xc1b2_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1b2_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc1b2_19_regions :: state_pred where
  \<open>P_0xc1b2_19_regions \<sigma> \<equiv> \<exists>regions. P_0xc1b2_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc1c4_19 :: state_pred where
  \<open>Q_0xc1c4_19 \<sigma> \<equiv> RIP \<sigma> = 0xc1c4 \<and> RAX \<sigma> = memcpy_0xc1ad_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1b2\<close>
declare Q_0xc1c4_19_def[Qs]

schematic_goal remove_direntries_0_4_0xc1b2_0xc1c1_19[blocks]:
  assumes \<open>(P_0xc1b2_19 && P_0xc1b2_19_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0xc1c1 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc1c4_19 ?\<sigma> \<and> block_usage P_0xc1b2_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1b2_19_def P_0xc1b2_19_regions_def post: Q_0xc1c4_19_def regionset: P_0xc1b2_19_regions_set_def)

definition P_0xc1c4_true_20 :: state_pred where
  \<open>P_0xc1c4_true_20 \<sigma> \<equiv> RIP \<sigma> = 0xc1c4 \<and> RAX \<sigma> = memcpy_0xc1ad_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1b2\<close>
declare P_0xc1c4_true_20_def[Ps]

definition P_0xc1c4_true_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1c4_true_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc1c4_true_20_regions :: state_pred where
  \<open>P_0xc1c4_true_20_regions \<sigma> \<equiv> \<exists>regions. P_0xc1c4_true_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc22e_20 :: state_pred where
  \<open>Q_0xc22e_20 \<sigma> \<equiv> RIP \<sigma> = 0xc22e \<and> RAX \<sigma> = memcpy_0xc1ad_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1b2\<close>
declare Q_0xc22e_20_def[Qs]

schematic_goal remove_direntries_0_5_0xc1c4_0xc22b_20[blocks]:
  assumes \<open>(P_0xc1c4_true_20 && P_0xc1c4_true_20_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 5 0xc22b 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc22e_20 ?\<sigma> \<and> block_usage P_0xc1c4_true_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1c4_true_20_def P_0xc1c4_true_20_regions_def post: Q_0xc22e_20_def regionset: P_0xc1c4_true_20_regions_set_def)

definition P_0xc22e_21 :: state_pred where
  \<open>P_0xc22e_21 \<sigma> \<equiv> RIP \<sigma> = 0xc22e \<and> RAX \<sigma> = memcpy_0xc1ad_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1b2\<close>
declare P_0xc22e_21_def[Ps]

definition P_0xc22e_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc22e_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc22e_21_regions :: state_pred where
  \<open>P_0xc22e_21_regions \<sigma> \<equiv> \<exists>regions. P_0xc22e_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memmove_addr_0xc22e_21 :: state_pred where
  \<open>Q_memmove_addr_0xc22e_21 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = memmove_addr \<and> RAX \<sigma> = memcpy_0xc1ad_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc233\<close>
declare Q_memmove_addr_0xc22e_21_def[Qs]

schematic_goal remove_direntries_0_1_0xc22e_0xc22e_21[blocks]:
  assumes \<open>(P_0xc22e_21 && P_0xc22e_21_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc22e 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memmove_addr_0xc22e_21 ?\<sigma> \<and> block_usage P_0xc22e_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc22e_21_def P_0xc22e_21_regions_def post: Q_memmove_addr_0xc22e_21_def regionset: P_0xc22e_21_regions_set_def)

definition P_0xc233_22 :: state_pred where
  \<open>P_0xc233_22 \<sigma> \<equiv> RIP \<sigma> = 0xc233 \<and> RAX \<sigma> = memmove_0xc22e_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc233\<close>
declare P_0xc233_22_def[Ps]

definition P_0xc233_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc233_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc233_22_regions :: state_pred where
  \<open>P_0xc233_22_regions \<sigma> \<equiv> \<exists>regions. P_0xc233_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc1d9_22 :: state_pred where
  \<open>Q_0xc1d9_22 \<sigma> \<equiv> RIP \<sigma> = 0xc1d9 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare Q_0xc1d9_22_def[Qs]

schematic_goal remove_direntries_0_1_0xc233_0xc233_22[blocks]:
  assumes \<open>(P_0xc233_22 && P_0xc233_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc233 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc1d9_22 ?\<sigma> \<and> block_usage P_0xc233_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc233_22_def P_0xc233_22_regions_def post: Q_0xc1d9_22_def regionset: P_0xc233_22_regions_set_def)

definition P_0xc1c4_false_23 :: state_pred where
  \<open>P_0xc1c4_false_23 \<sigma> \<equiv> RIP \<sigma> = 0xc1c4 \<and> RAX \<sigma> = memcpy_0xc1ad_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1b2\<close>
declare P_0xc1c4_false_23_def[Ps]

definition P_0xc1c4_false_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1c4_false_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc1c4_false_23_regions :: state_pred where
  \<open>P_0xc1c4_false_23_regions \<sigma> \<equiv> \<exists>regions. P_0xc1c4_false_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc1d4_23 :: state_pred where
  \<open>Q_0xc1d4_23 \<sigma> \<equiv> RIP \<sigma> = 0xc1d4 \<and> RAX \<sigma> = memcpy_0xc1ad_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1b2\<close>
declare Q_0xc1d4_23_def[Qs]

schematic_goal remove_direntries_0_5_0xc1c4_0xc1d0_23[blocks]:
  assumes \<open>(P_0xc1c4_false_23 && P_0xc1c4_false_23_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 5 0xc1d0 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc1d4_23 ?\<sigma> \<and> block_usage P_0xc1c4_false_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1c4_false_23_def P_0xc1c4_false_23_regions_def post: Q_0xc1d4_23_def regionset: P_0xc1c4_false_23_regions_set_def)

definition P_0xc1d4_24 :: state_pred where
  \<open>P_0xc1d4_24 \<sigma> \<equiv> RIP \<sigma> = 0xc1d4 \<and> RAX \<sigma> = memcpy_0xc1ad_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1b2\<close>
declare P_0xc1d4_24_def[Ps]

definition P_0xc1d4_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1d4_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc1d4_24_regions :: state_pred where
  \<open>P_0xc1d4_24_regions \<sigma> \<equiv> \<exists>regions. P_0xc1d4_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memmove_addr_0xc1d4_24 :: state_pred where
  \<open>Q_memmove_addr_0xc1d4_24 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = memmove_addr \<and> RAX \<sigma> = memcpy_0xc1ad_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare Q_memmove_addr_0xc1d4_24_def[Qs]

schematic_goal remove_direntries_0_1_0xc1d4_0xc1d4_24[blocks]:
  assumes \<open>(P_0xc1d4_24 && P_0xc1d4_24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc1d4 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memmove_addr_0xc1d4_24 ?\<sigma> \<and> block_usage P_0xc1d4_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1d4_24_def P_0xc1d4_24_regions_def post: Q_memmove_addr_0xc1d4_24_def regionset: P_0xc1d4_24_regions_set_def)

definition P_0xc1d9_25 :: state_pred where
  \<open>P_0xc1d9_25 \<sigma> \<equiv> RIP \<sigma> = 0xc1d9 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare P_0xc1d9_25_def[Ps]

definition P_0xc1d9_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1d9_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8)
  }\<close>

definition P_0xc1d9_25_regions :: state_pred where
  \<open>P_0xc1d9_25_regions \<sigma> \<equiv> \<exists>regions. P_0xc1d9_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc1e2_25 :: state_pred where
  \<open>Q_0xc1e2_25 \<sigma> \<equiv> RIP \<sigma> = 0xc1e2 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare Q_0xc1e2_25_def[Qs]

schematic_goal remove_direntries_0_3_0xc1d9_0xc1df_25[blocks]:
  assumes \<open>(P_0xc1d9_25 && P_0xc1d9_25_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0xc1df 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc1e2_25 ?\<sigma> \<and> block_usage P_0xc1d9_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1d9_25_def P_0xc1d9_25_regions_def post: Q_0xc1e2_25_def regionset: P_0xc1d9_25_regions_set_def)

definition P_0xc1e2_26 :: state_pred where
  \<open>P_0xc1e2_26 \<sigma> \<equiv> RIP \<sigma> = 0xc1e2 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare P_0xc1e2_26_def[Ps]

definition P_0xc1e2_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1e2_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc1e2_26_regions :: state_pred where
  \<open>P_0xc1e2_26_regions \<sigma> \<equiv> \<exists>regions. P_0xc1e2_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0xc1e2_26 :: state_pred where
  \<open>Q_memcpy_addr_0xc1e2_26 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = memcpy_addr \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1e7\<close>
declare Q_memcpy_addr_0xc1e2_26_def[Qs]

schematic_goal remove_direntries_0_1_0xc1e2_0xc1e2_26[blocks]:
  assumes \<open>(P_0xc1e2_26 && P_0xc1e2_26_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc1e2 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0xc1e2_26 ?\<sigma> \<and> block_usage P_0xc1e2_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1e2_26_def P_0xc1e2_26_regions_def post: Q_memcpy_addr_0xc1e2_26_def regionset: P_0xc1e2_26_regions_set_def)

definition P_0xc1e7_27 :: state_pred where
  \<open>P_0xc1e7_27 \<sigma> \<equiv> RIP \<sigma> = 0xc1e7 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1e7\<close>
declare P_0xc1e7_27_def[Ps]

definition P_0xc1e7_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1e7_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc1e7_27_regions :: state_pred where
  \<open>P_0xc1e7_27_regions \<sigma> \<equiv> \<exists>regions. P_0xc1e7_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc1ea_27 :: state_pred where
  \<open>Q_0xc1ea_27 \<sigma> \<equiv> RIP \<sigma> = 0xc1ea \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1e7\<close>
declare Q_0xc1ea_27_def[Qs]

schematic_goal remove_direntries_0_1_0xc1e7_0xc1e7_27[blocks]:
  assumes \<open>(P_0xc1e7_27 && P_0xc1e7_27_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc1e7 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc1ea_27 ?\<sigma> \<and> block_usage P_0xc1e7_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1e7_27_def P_0xc1e7_27_regions_def post: Q_0xc1ea_27_def regionset: P_0xc1e7_27_regions_set_def)

definition P_0xc1ea_28 :: state_pred where
  \<open>P_0xc1ea_28 \<sigma> \<equiv> RIP \<sigma> = 0xc1ea \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1e7\<close>
declare P_0xc1ea_28_def[Ps]

definition P_0xc1ea_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1ea_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc1ea_28_regions :: state_pred where
  \<open>P_0xc1ea_28_regions \<sigma> \<equiv> \<exists>regions. P_0xc1ea_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_free_addr_0xc1ea_28 :: state_pred where
  \<open>Q_free_addr_0xc1ea_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = free_addr \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1ef\<close>
declare Q_free_addr_0xc1ea_28_def[Qs]

schematic_goal remove_direntries_0_1_0xc1ea_0xc1ea_28[blocks]:
  assumes \<open>(P_0xc1ea_28 && P_0xc1ea_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc1ea 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_free_addr_0xc1ea_28 ?\<sigma> \<and> block_usage P_0xc1ea_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1ea_28_def P_0xc1ea_28_regions_def post: Q_free_addr_0xc1ea_28_def regionset: P_0xc1ea_28_regions_set_def)

definition P_0xc1ef_29 :: state_pred where
  \<open>P_0xc1ef_29 \<sigma> \<equiv> RIP \<sigma> = 0xc1ef \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xc19b_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xc19b_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word))) 32 64::64 word) \<and> R10 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x44),4]::32 word) = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc1ef\<close>
declare P_0xc1ef_29_def[Ps]

definition P_0xc1ef_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1ef_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x44), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc1ef_29_regions :: state_pred where
  \<open>P_0xc1ef_29_regions \<sigma> \<equiv> \<exists>regions. P_0xc1ef_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc1f6_29 :: state_pred where
  \<open>Q_0xc1f6_29 \<sigma> \<equiv> RIP \<sigma> = 0xc1f6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc1f6_29_def[Qs]

schematic_goal remove_direntries_0_1_0xc1ef_0xc1ef_29[blocks]:
  assumes \<open>(P_0xc1ef_29 && P_0xc1ef_29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc1ef 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc1f6_29 ?\<sigma> \<and> block_usage P_0xc1ef_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1ef_29_def P_0xc1ef_29_regions_def post: Q_0xc1f6_29_def regionset: P_0xc1ef_29_regions_set_def)

definition P_0xc1f6_30 :: state_pred where
  \<open>P_0xc1f6_30 \<sigma> \<equiv> RIP \<sigma> = 0xc1f6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc1f6_30_def[Ps]

definition P_0xc1f6_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc1f6_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc1f6_30_regions :: state_pred where
  \<open>P_0xc1f6_30_regions \<sigma> \<equiv> \<exists>regions. P_0xc1f6_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc208_30 :: state_pred where
  \<open>Q_0xc208_30 \<sigma> \<equiv> RIP \<sigma> = 0xc208 \<and> RBX \<sigma> = ucast ((- (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((- (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc208_30_def[Qs]

schematic_goal remove_direntries_0_6_0xc1f6_0xc206_30[blocks]:
  assumes \<open>(P_0xc1f6_30 && P_0xc1f6_30_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0xc206 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc208_30 ?\<sigma> \<and> block_usage P_0xc1f6_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc1f6_30_def P_0xc1f6_30_regions_def post: Q_0xc208_30_def regionset: P_0xc1f6_30_regions_set_def)

definition P_0xc208_31 :: state_pred where
  \<open>P_0xc208_31 \<sigma> \<equiv> RIP \<sigma> = 0xc208 \<and> RBX \<sigma> = ucast ((- (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((- (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc208_31_def[Ps]

definition P_0xc208_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc208_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc208_31_regions :: state_pred where
  \<open>P_0xc208_31_regions \<sigma> \<equiv> \<exists>regions. P_0xc208_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_adjust_dirindices_addr_0xc208_31 :: state_pred where
  \<open>Q_adjust_dirindices_addr_0xc208_31 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = adjust_dirindices_addr \<and> RBX \<sigma> = ucast ((- (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((- (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc20d\<close>
declare Q_adjust_dirindices_addr_0xc208_31_def[Qs]

schematic_goal remove_direntries_0_1_0xc208_0xc208_31[blocks]:
  assumes \<open>(P_0xc208_31 && P_0xc208_31_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc208 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_adjust_dirindices_addr_0xc208_31 ?\<sigma> \<and> block_usage P_0xc208_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc208_31_def P_0xc208_31_regions_def post: Q_adjust_dirindices_addr_0xc208_31_def regionset: P_0xc208_31_regions_set_def)

definition P_0xc20d_32 :: state_pred where
  \<open>P_0xc20d_32 \<sigma> \<equiv> RIP \<sigma> = 0xc20d \<and> RBX \<sigma> = ucast ((- (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((- (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xc20d\<close>
declare P_0xc20d_32_def[Ps]

definition P_0xc20d_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc20d_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xc20d_32_regions :: state_pred where
  \<open>P_0xc20d_32_regions \<sigma> \<equiv> \<exists>regions. P_0xc20d_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc20f_32 :: state_pred where
  \<open>Q_0xc20f_32 \<sigma> \<equiv> RIP \<sigma> = 0xc20f \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc20f_32_def[Qs]

schematic_goal remove_direntries_0_1_0xc20d_0xc20d_32[blocks]:
  assumes \<open>(P_0xc20d_32 && P_0xc20d_32_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc20d 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc20f_32 ?\<sigma> \<and> block_usage P_0xc20d_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc20d_32_def P_0xc20d_32_regions_def post: Q_0xc20f_32_def regionset: P_0xc20d_32_regions_set_def)

definition P_0xc20f_33 :: state_pred where
  \<open>P_0xc20f_33 \<sigma> \<equiv> RIP \<sigma> = 0xc20f \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc20f_33_def[Ps]

definition P_0xc20f_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc20f_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc20f_33_regions :: state_pred where
  \<open>P_0xc20f_33_regions \<sigma> \<equiv> \<exists>regions. P_0xc20f_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_33 :: state_pred where
  \<open>Q_ret_address_33 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_33_def[Qs]

schematic_goal remove_direntries_0_8_0xc20f_0xc21d_33[blocks]:
  assumes \<open>(P_0xc20f_33 && P_0xc20f_33_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0xc21d 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_33 ?\<sigma> \<and> block_usage P_0xc20f_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc20f_33_def P_0xc20f_33_regions_def post: Q_ret_address_33_def regionset: P_0xc20f_33_regions_set_def)

definition remove_direntries_acode :: ACode where
  \<open>remove_direntries_acode =
    Block 8 0xc10e 0;
    IF SF THEN
      Block 5 0xc290 (Suc 0);
      Block (Suc 0) 0xc297 2;
      CALL assert_fail_acode
    ELSE
      Block 3 0xc118 3;
      IF jle THEN
        Block 5 0xc271 4;
        Block (Suc 0) 0xc278 5;
        CALL assert_fail_acode
      ELSE
        Block 6 0xc12e 6;
        IF ja THEN
          Block 5 0xc252 7;
          Block (Suc 0) 0xc259 8;
          CALL assert_fail_acode
        ELSE
          Block 3 0xc139 9;
          IF SF THEN
            Block 3 0xc23d 10
          ELSE
            Block 2 0xc143 11;
            IF jbe THEN
              Block 3 0xc23d 12
            ELSE
              Block 2 0xc14b 13;
              IF ZF THEN
                Block (Suc 0) 0xc14e 14
              ELSE
                Block 18 0xc197 15;
                Block (Suc 0) 0xc19b 16;
                CALL qemu_malloc_acode;
                Block 4 0xc1aa 17;
                Block (Suc 0) 0xc1ad 18;
                CALL memcpy_acode;
                Block 4 0xc1c1 19;
                IF jg THEN
                  Block 5 0xc22b 20;
                  Block (Suc 0) 0xc22e 21;
                  CALL memmove_acode;
                  Block (Suc 0) 0xc233 22
                ELSE
                  Block 5 0xc1d0 23;
                  Block (Suc 0) 0xc1d4 24;
                  CALL memmove_acode
                FI;
                Block 3 0xc1df 25;
                Block (Suc 0) 0xc1e2 26;
                CALL memcpy_acode;
                Block (Suc 0) 0xc1e7 27;
                Block (Suc 0) 0xc1ea 28;
                CALL free_acode;
                Block (Suc 0) 0xc1ef 29
              FI;
              Block 6 0xc206 30;
              Block (Suc 0) 0xc208 31;
              CALL adjust_dirindices_acode;
              Block (Suc 0) 0xc20d 32
            FI
          FI;
          Block 8 0xc21d 33
        FI
      FI
    FI
  \<close>

schematic_goal "remove_direntries":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc110 \<longrightarrow> P_0xc110_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc297 \<longrightarrow> P_0xc297_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc110 \<longrightarrow> P_0xc110_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc11a \<longrightarrow> P_0xc11a_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc278 \<longrightarrow> P_0xc278_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc11a \<longrightarrow> P_0xc11a_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc130 \<longrightarrow> P_0xc130_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc259 \<longrightarrow> P_0xc259_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc130 \<longrightarrow> P_0xc130_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc13d \<longrightarrow> P_0xc13d_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc13d \<longrightarrow> P_0xc13d_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc145 \<longrightarrow> P_0xc145_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc145 \<longrightarrow> P_0xc145_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc14e \<longrightarrow> P_0xc14e_true_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc14e \<longrightarrow> P_0xc14e_false_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc19b \<longrightarrow> P_0xc19b_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1a0 \<longrightarrow> P_0xc1a0_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1ad \<longrightarrow> P_0xc1ad_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1b2 \<longrightarrow> P_0xc1b2_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1c4 \<longrightarrow> P_0xc1c4_true_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc22e \<longrightarrow> P_0xc22e_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc233 \<longrightarrow> P_0xc233_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1c4 \<longrightarrow> P_0xc1c4_false_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1d4 \<longrightarrow> P_0xc1d4_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1d9 \<longrightarrow> P_0xc1d9_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1e2 \<longrightarrow> P_0xc1e2_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1e7 \<longrightarrow> P_0xc1e7_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1ea \<longrightarrow> P_0xc1ea_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1ef \<longrightarrow> P_0xc1ef_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc1f6 \<longrightarrow> P_0xc1f6_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc208 \<longrightarrow> P_0xc208_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc20d \<longrightarrow> P_0xc20d_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc20f \<longrightarrow> P_0xc20f_33_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xc297_2}} \<box>assert_fail_acode {{Q_fail;M_0xc297}}\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xc278_5}} \<box>assert_fail_acode {{Q_fail;M_0xc278}}\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xc259_8}} \<box>assert_fail_acode {{Q_fail;M_0xc259}}\<close>
    and [blocks]: \<open>{{Q_qemu_malloc_addr_0xc19b_16}} \<box>qemu_malloc_acode {{P_0xc1a0_17;M_0xc19b}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0xc1ad_18}} \<box>memcpy_acode {{P_0xc1b2_19;M_0xc1ad}}\<close>
    and [blocks]: \<open>{{Q_memmove_addr_0xc22e_21}} \<box>memmove_acode {{P_0xc233_22;M_0xc22e}}\<close>
    and [blocks]: \<open>{{Q_memmove_addr_0xc1d4_24}} \<box>memmove_acode {{P_0xc1d9_25;M_0xc1d4}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0xc1e2_26}} \<box>memcpy_acode {{P_0xc1e7_27;M_0xc1e2}}\<close>
    and [blocks]: \<open>{{Q_free_addr_0xc1ea_28}} \<box>free_acode {{P_0xc1ef_29;M_0xc1ea}}\<close>
    and [blocks]: \<open>{{Q_adjust_dirindices_addr_0xc208_31}} \<box>adjust_dirindices_acode {{P_0xc20d_32;M_0xc208}}\<close>
  shows \<open>{{?P}} remove_direntries_acode {{?Q;?M}}\<close>
  by (vcg acode: remove_direntries_acode_def assms: assms)

end
