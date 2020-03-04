theory parse_long_name
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes strlen_0xdded_retval\<^sub>v strlen_addr :: \<open>64 word\<close>
    and strlen_acode :: ACode
  assumes fetch:
    "fetch 0xdd00 \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 11)))) (Immediate SixtyFour (ImmVal 15)), 4)"
    "fetch 0xdd04 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xdd06 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 1)), 6)"
    "fetch 0xdd0c \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xdd0d \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xdd0e \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 56826)), 6)"
    "fetch 0xdd14 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsi))))), 3)"
    "fetch 0xdd17 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xdd19 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 63)), 3)"
    "fetch 0xdd1c \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 64)), 3)"
    "fetch 0xdd1f \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 56840)), 6)"
    "fetch 0xdd25 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 828))))), 6)"
    "fetch 0xdd2b \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1)))), 3)"
    "fetch 0xdd2e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 828)))) (Storage (Reg (General ThirtyTwo rdx))), 6)"
    "fetch 0xdd34 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xdd36 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 56950)), 6)"
    "fetch 0xdd3c \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 13))))), 4)"
    "fetch 0xdd40 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 820))))), 6)"
    "fetch 0xdd46 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 56961)), 6)"
    "fetch 0xdd4c \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 12)))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0xdd50 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 56942)), 6)"
    "fetch 0xdd56 \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 26)))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0xdd5a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 56942)), 6)"
    "fetch 0xdd60 \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 27)))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0xdd64 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 56942)), 6)"
    "fetch 0xdd6a \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0xdd6d \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 2 (A_FromReg (General SixtyFour rax)))))), 3)"
    "fetch 0xdd70 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rdx)))))), 3)"
    "fetch 0xdd73 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0xdd78 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 13)))), 4)"
    "fetch 0xdd7c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0xdd7e \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 56727)), 2)"
    "fetch 0xdd80 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r8)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Mult 1 (A_FromReg (General SixtyFour r8))))))), 5)"
    "fetch 0xdd85 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0xdd88 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0xdd8b \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0xdd8e \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 1 (A_FromReg (General SixtyFour rcx)))))) (Storage (Reg (General Eight r8))), 4)"
    "fetch 0xdd92 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0xdd95 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 56796)), 2)"
    "fetch 0xdd97 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 11)), 3)"
    "fetch 0xdd9a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 56880)), 6)"
    "fetch 0xdda0 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 26)), 3)"
    "fetch 0xdda3 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 56904)), 6)"
    "fetch 0xdda9 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r8)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0xddac \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r8)) (A_WordConstant 1)))), 4)"
    "fetch 0xddb0 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Mult 1 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0xddb4 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rcx)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0xddb6 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 56704)), 2)"
    "fetch 0xddb8 \<equiv> (Binary (IS_8088 Cmp) (Reg (General Eight rcx)) (Immediate SixtyFour (ImmVal 255)), 3)"
    "fetch 0xddbb \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 56928)), 6)"
    "fetch 0xddc1 \<equiv> (Binary (IS_8088 Test) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsi)))) (Immediate SixtyFour (ImmVal 64)), 3)"
    "fetch 0xddc4 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 56928)), 6)"
    "fetch 0xddca \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0xddcd \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0xddd0 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0xddd3 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 1 (A_FromReg (General SixtyFour rcx)))))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0xddd7 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0xddda \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 56727)), 2)"
    "fetch 0xdddc \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0xdddf \<equiv> (Binary (IS_8088 Test) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsi)))) (Immediate SixtyFour (ImmVal 64)), 3)"
    "fetch 0xdde2 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 56826)), 2)"
    "fetch 0xdde4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0xdde7 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdi)) (Storage (Reg (General ThirtyTwo rbp))), 3)"
    "fetch 0xddea \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xdded \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strlen'')), 5)"
    "fetch 0xddf2 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xddf4 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 824)))) (Storage (Reg (General ThirtyTwo rbp))), 6)"
    "fetch 0xddfa \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0xddfd \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xddfe \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xddff \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xde01 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xde02 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0xde08 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 828)))) (Storage (Reg (General ThirtyTwo rax))), 6)"
    "fetch 0xde0e \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 13))))), 4)"
    "fetch 0xde12 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rdi)))) (Immediate SixtyFour (ImmVal 0)), 3)"
    "fetch 0xde15 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 820)))) (Storage (Reg (General ThirtyTwo rdx))), 6)"
    "fetch 0xde1b \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 2 (A_FromReg (General SixtyFour rax)))))), 3)"
    "fetch 0xde1e \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rdx)))))), 3)"
    "fetch 0xde21 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0xde24 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 1 (A_FromReg (General SixtyFour rdx)))))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0xde28 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 56682)), 5)"
    "fetch 0xde2d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0xde30 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 15)), 5)"
    "fetch 0xde35 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Immediate SixtyFour (ImmVal 14)), 6)"
    "fetch 0xde3b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 14)), 5)"
    "fetch 0xde40 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 56752)), 5)"
    "fetch 0xde45 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0xde48 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 29)), 5)"
    "fetch 0xde4d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Immediate SixtyFour (ImmVal 28)), 6)"
    "fetch 0xde53 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 28)), 5)"
    "fetch 0xde58 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 56752)), 5)"
    "fetch 0xde5d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0xde60 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 4294967292)), 6)"
    "fetch 0xde66 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xde67 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xde68 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0xde6b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xde6d \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xde6e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 4294967293)), 6)"
    "fetch 0xde74 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 56826)), 2)"
    "fetch 0xde76 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 4294967295)), 6)"
    "fetch 0xde7c \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 56826)), 5)"
    "fetch 0xde81 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 4294967294)), 6)"
    "fetch 0xde87 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 56826)), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and strlen\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strlen'') = strlen_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>strlen_0xdded_retval \<equiv> strlen_0xdded_retval\<^sub>v\<close>

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

locale "parse_long_name" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0xdd00_0 :: state_pred where
  \<open>P_0xdd00_0 \<sigma> \<equiv> RIP \<sigma> = 0xdd00 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0xdd00_0_def[Ps]

definition P_0xdd00_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd00_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd00_0_regions :: state_pred where
  \<open>P_0xdd00_0_regions \<sigma> \<equiv> \<exists>regions. P_0xdd00_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd0e_0 :: state_pred where
  \<open>Q_0xdd0e_0 \<sigma> \<equiv> RIP \<sigma> = 0xdd0e \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd0e_0_def[Qs]

schematic_goal parse_long_name_0_5_0xdd00_0xdd0d_0[blocks]:
  assumes \<open>(P_0xdd00_0 && P_0xdd00_0_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xdd0d 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd0e_0 ?\<sigma> \<and> block_usage P_0xdd00_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd00_0_def P_0xdd00_0_regions_def post: Q_0xdd0e_0_def regionset: P_0xdd00_0_regions_set_def)

definition P_0xdd0e_true_1 :: state_pred where
  \<open>P_0xdd0e_true_1 \<sigma> \<equiv> RIP \<sigma> = 0xdd0e \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd0e_true_1_def[Ps]

definition P_0xdd0e_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd0e_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd0e_true_1_regions :: state_pred where
  \<open>P_0xdd0e_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0xdd0e_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal parse_long_name_0_6_0xdd0e_0xde01_1[blocks]:
  assumes \<open>(P_0xdd0e_true_1 && P_0xdd0e_true_1_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0xde01 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0xdd0e_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd0e_true_1_def P_0xdd0e_true_1_regions_def post: Q_ret_address_1_def regionset: P_0xdd0e_true_1_regions_set_def)

definition P_0xdd0e_false_2 :: state_pred where
  \<open>P_0xdd0e_false_2 \<sigma> \<equiv> RIP \<sigma> = 0xdd0e \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd0e_false_2_def[Ps]

definition P_0xdd0e_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd0e_false_2_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd0e_false_2_regions :: state_pred where
  \<open>P_0xdd0e_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0xdd0e_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd1f_2 :: state_pred where
  \<open>Q_0xdd1f_2 \<sigma> \<equiv> RIP \<sigma> = 0xdd1f \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x40)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd1f_2_def[Qs]

schematic_goal parse_long_name_0_5_0xdd0e_0xdd1c_2[blocks]:
  assumes \<open>(P_0xdd0e_false_2 && P_0xdd0e_false_2_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0xdd1c 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd1f_2 ?\<sigma> \<and> block_usage P_0xdd0e_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd0e_false_2_def P_0xdd0e_false_2_regions_def post: Q_0xdd1f_2_def regionset: P_0xdd0e_false_2_regions_set_def)

definition P_0xdd1f_true_3 :: state_pred where
  \<open>P_0xdd1f_true_3 \<sigma> \<equiv> RIP \<sigma> = 0xdd1f \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x40)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd1f_true_3_def[Ps]

definition P_0xdd1f_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd1f_true_3_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd1f_true_3_regions :: state_pred where
  \<open>P_0xdd1f_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0xdd1f_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd6a_3 :: state_pred where
  \<open>Q_0xdd6a_3 \<sigma> \<equiv> RIP \<sigma> = 0xdd6a \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd6a_3_def[Qs]

schematic_goal parse_long_name_0_10_0xdd1f_0xde28_3[blocks]:
  assumes \<open>(P_0xdd1f_true_3 && P_0xdd1f_true_3_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 10 0xde28 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd6a_3 ?\<sigma> \<and> block_usage P_0xdd1f_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd1f_true_3_def P_0xdd1f_true_3_regions_def post: Q_0xdd6a_3_def regionset: P_0xdd1f_true_3_regions_set_def)

definition P_0xdd6a_4 :: state_pred where
  \<open>P_0xdd6a_4 \<sigma> \<equiv> RIP \<sigma> = 0xdd6a \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd6a_4_def[Ps]

definition P_0xdd6a_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd6a_4_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd6a_4_regions :: state_pred where
  \<open>P_0xdd6a_4_regions \<sigma> \<equiv> \<exists>regions. P_0xdd6a_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd97_4 :: state_pred where
  \<open>Q_0xdd97_4 \<sigma> \<equiv> RIP \<sigma> = 0xdd97 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd97_4_def[Qs]

schematic_goal parse_long_name_0_7_0xdd6a_0xdd7e_4[blocks]:
  assumes \<open>(P_0xdd6a_4 && P_0xdd6a_4_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0xdd7e 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd97_4 ?\<sigma> \<and> block_usage P_0xdd6a_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd6a_4_def P_0xdd6a_4_regions_def post: Q_0xdd97_4_def regionset: P_0xdd6a_4_regions_set_def)

definition P_0xdd97_5 :: state_pred where
  \<open>P_0xdd97_5 \<sigma> \<equiv> RIP \<sigma> = 0xdd97 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd97_5_def[Ps]

definition P_0xdd97_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd97_5_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd97_5_regions :: state_pred where
  \<open>P_0xdd97_5_regions \<sigma> \<equiv> \<exists>regions. P_0xdd97_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd9a_5 :: state_pred where
  \<open>Q_0xdd9a_5 \<sigma> \<equiv> RIP \<sigma> = 0xdd9a \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd9a_5_def[Qs]

schematic_goal parse_long_name_0_1_0xdd97_0xdd97_5[blocks]:
  assumes \<open>(P_0xdd97_5 && P_0xdd97_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xdd97 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd9a_5 ?\<sigma> \<and> block_usage P_0xdd97_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd97_5_def P_0xdd97_5_regions_def post: Q_0xdd9a_5_def regionset: P_0xdd97_5_regions_set_def)

definition P_0xdd9a_true_6 :: state_pred where
  \<open>P_0xdd9a_true_6 \<sigma> \<equiv> RIP \<sigma> = 0xdd9a \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd9a_true_6_def[Ps]

definition P_0xdd9a_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd9a_true_6_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd9a_true_6_regions :: state_pred where
  \<open>P_0xdd9a_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0xdd9a_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddb0_6 :: state_pred where
  \<open>Q_0xddb0_6 \<sigma> \<equiv> RIP \<sigma> = 0xddb0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddb0_6_def[Qs]

schematic_goal parse_long_name_0_5_0xdd9a_0xde40_6[blocks]:
  assumes \<open>(P_0xdd9a_true_6 && P_0xdd9a_true_6_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0xde40 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddb0_6 ?\<sigma> \<and> block_usage P_0xdd9a_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd9a_true_6_def P_0xdd9a_true_6_regions_def post: Q_0xddb0_6_def regionset: P_0xdd9a_true_6_regions_set_def)

definition P_0xdd9a_false_7 :: state_pred where
  \<open>P_0xdd9a_false_7 \<sigma> \<equiv> RIP \<sigma> = 0xdd9a \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd9a_false_7_def[Ps]

definition P_0xdd9a_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd9a_false_7_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd9a_false_7_regions :: state_pred where
  \<open>P_0xdd9a_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0xdd9a_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdda3_7 :: state_pred where
  \<open>Q_0xdda3_7 \<sigma> \<equiv> RIP \<sigma> = 0xdda3 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdda3_7_def[Qs]

schematic_goal parse_long_name_0_2_0xdd9a_0xdda0_7[blocks]:
  assumes \<open>(P_0xdd9a_false_7 && P_0xdd9a_false_7_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xdda0 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdda3_7 ?\<sigma> \<and> block_usage P_0xdd9a_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd9a_false_7_def P_0xdd9a_false_7_regions_def post: Q_0xdda3_7_def regionset: P_0xdd9a_false_7_regions_set_def)

definition P_0xdda3_true_8 :: state_pred where
  \<open>P_0xdda3_true_8 \<sigma> \<equiv> RIP \<sigma> = 0xdda3 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdda3_true_8_def[Ps]

definition P_0xdda3_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdda3_true_8_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdda3_true_8_regions :: state_pred where
  \<open>P_0xdda3_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0xdda3_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddb0_8 :: state_pred where
  \<open>Q_0xddb0_8 \<sigma> \<equiv> RIP \<sigma> = 0xddb0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddb0_8_def[Qs]

schematic_goal parse_long_name_0_5_0xdda3_0xde58_8[blocks]:
  assumes \<open>(P_0xdda3_true_8 && P_0xdda3_true_8_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0xde58 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddb0_8 ?\<sigma> \<and> block_usage P_0xdda3_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdda3_true_8_def P_0xdda3_true_8_regions_def post: Q_0xddb0_8_def regionset: P_0xdda3_true_8_regions_set_def)

definition P_0xdda3_false_9 :: state_pred where
  \<open>P_0xdda3_false_9 \<sigma> \<equiv> RIP \<sigma> = 0xdda3 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdda3_false_9_def[Ps]

definition P_0xdda3_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdda3_false_9_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdda3_false_9_regions :: state_pred where
  \<open>P_0xdda3_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0xdda3_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddb0_9 :: state_pred where
  \<open>Q_0xddb0_9 \<sigma> \<equiv> RIP \<sigma> = 0xddb0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddb0_9_def[Qs]

schematic_goal parse_long_name_0_3_0xdda3_0xddac_9[blocks]:
  assumes \<open>(P_0xdda3_false_9 && P_0xdda3_false_9_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xddac 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddb0_9 ?\<sigma> \<and> block_usage P_0xdda3_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdda3_false_9_def P_0xdda3_false_9_regions_def post: Q_0xddb0_9_def regionset: P_0xdda3_false_9_regions_set_def)

definition P_0xddb0_10 :: state_pred where
  \<open>P_0xddb0_10 \<sigma> \<equiv> RIP \<sigma> = 0xddb0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddb0_10_def[Ps]

definition P_0xddb0_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddb0_10_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RCX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddb0_10_regions :: state_pred where
  \<open>P_0xddb0_10_regions \<sigma> \<equiv> \<exists>regions. P_0xddb0_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddb6_10 :: state_pred where
  \<open>Q_0xddb6_10 \<sigma> \<equiv> RIP \<sigma> = 0xddb6 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddb6_10_def[Qs]

schematic_goal parse_long_name_0_2_0xddb0_0xddb4_10[blocks]:
  assumes \<open>(P_0xddb0_10 && P_0xddb0_10_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xddb4 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddb6_10 ?\<sigma> \<and> block_usage P_0xddb0_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddb0_10_def P_0xddb0_10_regions_def post: Q_0xddb6_10_def regionset: P_0xddb0_10_regions_set_def)

definition P_0xddb6_true_11 :: state_pred where
  \<open>P_0xddb6_true_11 \<sigma> \<equiv> RIP \<sigma> = 0xddb6 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddb6_true_11_def[Ps]

definition P_0xddb6_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddb6_true_11_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDX \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (8, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (9, ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R8 \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddb6_true_11_regions :: state_pred where
  \<open>P_0xddb6_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0xddb6_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd95_11 :: state_pred where
  \<open>Q_0xdd95_11 \<sigma> \<equiv> RIP \<sigma> = 0xdd95 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd95_11_def[Qs]

schematic_goal parse_long_name_0_7_0xddb6_0xdd92_11[blocks]:
  assumes \<open>(P_0xddb6_true_11 && P_0xddb6_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0xdd92 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd95_11 ?\<sigma> \<and> block_usage P_0xddb6_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddb6_true_11_def P_0xddb6_true_11_regions_def post: Q_0xdd95_11_def regionset: P_0xddb6_true_11_regions_set_def)

definition P_0xdd95_true_12 :: state_pred where
  \<open>P_0xdd95_true_12 \<sigma> \<equiv> RIP \<sigma> = 0xdd95 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd95_true_12_def[Ps]

definition P_0xdd95_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd95_true_12_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd95_true_12_regions :: state_pred where
  \<open>P_0xdd95_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0xdd95_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdddc_12 :: state_pred where
  \<open>Q_0xdddc_12 \<sigma> \<equiv> RIP \<sigma> = 0xdddc \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdddc_12_def[Qs]

schematic_goal parse_long_name_0_1_0xdd95_0xdd95_12[blocks]:
  assumes \<open>(P_0xdd95_true_12 && P_0xdd95_true_12_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xdd95 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdddc_12 ?\<sigma> \<and> block_usage P_0xdd95_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd95_true_12_def P_0xdd95_true_12_regions_def post: Q_0xdddc_12_def regionset: P_0xdd95_true_12_regions_set_def)

definition P_0xdd95_false_13 :: state_pred where
  \<open>P_0xdd95_false_13 \<sigma> \<equiv> RIP \<sigma> = 0xdd95 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd95_false_13_def[Ps]

definition P_0xdd95_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd95_false_13_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd95_false_13_regions :: state_pred where
  \<open>P_0xdd95_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0xdd95_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd97_13 :: state_pred where
  \<open>Q_0xdd97_13 \<sigma> \<equiv> RIP \<sigma> = 0xdd97 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd97_13_def[Qs]

schematic_goal parse_long_name_0_1_0xdd95_0xdd95_13[blocks]:
  assumes \<open>(P_0xdd95_false_13 && P_0xdd95_false_13_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xdd95 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd97_13 ?\<sigma> \<and> block_usage P_0xdd95_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd95_false_13_def P_0xdd95_false_13_regions_def post: Q_0xdd97_13_def regionset: P_0xdd95_false_13_regions_set_def)

definition P_0xddb6_false_14 :: state_pred where
  \<open>P_0xddb6_false_14 \<sigma> \<equiv> RIP \<sigma> = 0xddb6 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddb6_false_14_def[Ps]

definition P_0xddb6_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddb6_false_14_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddb6_false_14_regions :: state_pred where
  \<open>P_0xddb6_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0xddb6_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddbb_14 :: state_pred where
  \<open>Q_0xddbb_14 \<sigma> \<equiv> RIP \<sigma> = 0xddbb \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddbb_14_def[Qs]

schematic_goal parse_long_name_0_2_0xddb6_0xddb8_14[blocks]:
  assumes \<open>(P_0xddb6_false_14 && P_0xddb6_false_14_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xddb8 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddbb_14 ?\<sigma> \<and> block_usage P_0xddb6_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddb6_false_14_def P_0xddb6_false_14_regions_def post: Q_0xddbb_14_def regionset: P_0xddb6_false_14_regions_set_def)

definition P_0xddbb_true_15 :: state_pred where
  \<open>P_0xddbb_true_15 \<sigma> \<equiv> RIP \<sigma> = 0xddbb \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddbb_true_15_def[Ps]

definition P_0xddbb_true_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddbb_true_15_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddbb_true_15_regions :: state_pred where
  \<open>P_0xddbb_true_15_regions \<sigma> \<equiv> \<exists>regions. P_0xddbb_true_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xde60_15 :: state_pred where
  \<open>Q_0xde60_15 \<sigma> \<equiv> RIP \<sigma> = 0xde60 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xde60_15_def[Qs]

schematic_goal parse_long_name_0_1_0xddbb_0xddbb_15[blocks]:
  assumes \<open>(P_0xddbb_true_15 && P_0xddbb_true_15_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xddbb 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xde60_15 ?\<sigma> \<and> block_usage P_0xddbb_true_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddbb_true_15_def P_0xddbb_true_15_regions_def post: Q_0xde60_15_def regionset: P_0xddbb_true_15_regions_set_def)

definition P_0xddbb_false_16 :: state_pred where
  \<open>P_0xddbb_false_16 \<sigma> \<equiv> RIP \<sigma> = 0xddbb \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddbb_false_16_def[Ps]

definition P_0xddbb_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddbb_false_16_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddbb_false_16_regions :: state_pred where
  \<open>P_0xddbb_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0xddbb_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddc4_16 :: state_pred where
  \<open>Q_0xddc4_16 \<sigma> \<equiv> RIP \<sigma> = 0xddc4 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddc4_16_def[Qs]

schematic_goal parse_long_name_0_2_0xddbb_0xddc1_16[blocks]:
  assumes \<open>(P_0xddbb_false_16 && P_0xddbb_false_16_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xddc1 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddc4_16 ?\<sigma> \<and> block_usage P_0xddbb_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddbb_false_16_def P_0xddbb_false_16_regions_def post: Q_0xddc4_16_def regionset: P_0xddbb_false_16_regions_set_def)

definition P_0xddc4_true_17 :: state_pred where
  \<open>P_0xddc4_true_17 \<sigma> \<equiv> RIP \<sigma> = 0xddc4 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddc4_true_17_def[Ps]

definition P_0xddc4_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddc4_true_17_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddc4_true_17_regions :: state_pred where
  \<open>P_0xddc4_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0xddc4_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xde60_17 :: state_pred where
  \<open>Q_0xde60_17 \<sigma> \<equiv> RIP \<sigma> = 0xde60 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xde60_17_def[Qs]

schematic_goal parse_long_name_0_1_0xddc4_0xddc4_17[blocks]:
  assumes \<open>(P_0xddc4_true_17 && P_0xddc4_true_17_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xddc4 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xde60_17 ?\<sigma> \<and> block_usage P_0xddc4_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddc4_true_17_def P_0xddc4_true_17_regions_def post: Q_0xde60_17_def regionset: P_0xddc4_true_17_regions_set_def)

definition P_0xddc4_false_18 :: state_pred where
  \<open>P_0xddc4_false_18 \<sigma> \<equiv> RIP \<sigma> = 0xddc4 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddc4_false_18_def[Ps]

definition P_0xddc4_false_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddc4_false_18_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDX \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (8, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddc4_false_18_regions :: state_pred where
  \<open>P_0xddc4_false_18_regions \<sigma> \<equiv> \<exists>regions. P_0xddc4_false_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddda_18 :: state_pred where
  \<open>Q_0xddda_18 \<sigma> \<equiv> RIP \<sigma> = 0xddda \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddda_18_def[Qs]

schematic_goal parse_long_name_0_6_0xddc4_0xddd7_18[blocks]:
  assumes \<open>(P_0xddc4_false_18 && P_0xddc4_false_18_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0xddd7 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddda_18 ?\<sigma> \<and> block_usage P_0xddc4_false_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddc4_false_18_def P_0xddc4_false_18_regions_def post: Q_0xddda_18_def regionset: P_0xddc4_false_18_regions_set_def)

definition P_0xddda_true_19 :: state_pred where
  \<open>P_0xddda_true_19 \<sigma> \<equiv> RIP \<sigma> = 0xddda \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddda_true_19_def[Ps]

definition P_0xddda_true_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddda_true_19_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddda_true_19_regions :: state_pred where
  \<open>P_0xddda_true_19_regions \<sigma> \<equiv> \<exists>regions. P_0xddda_true_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd97_19 :: state_pred where
  \<open>Q_0xdd97_19 \<sigma> \<equiv> RIP \<sigma> = 0xdd97 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd97_19_def[Qs]

schematic_goal parse_long_name_0_1_0xddda_0xddda_19[blocks]:
  assumes \<open>(P_0xddda_true_19 && P_0xddda_true_19_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xddda 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd97_19 ?\<sigma> \<and> block_usage P_0xddda_true_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddda_true_19_def P_0xddda_true_19_regions_def post: Q_0xdd97_19_def regionset: P_0xddda_true_19_regions_set_def)

definition P_0xddda_false_20 :: state_pred where
  \<open>P_0xddda_false_20 \<sigma> \<equiv> RIP \<sigma> = 0xddda \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddda_false_20_def[Ps]

definition P_0xddda_false_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddda_false_20_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddda_false_20_regions :: state_pred where
  \<open>P_0xddda_false_20_regions \<sigma> \<equiv> \<exists>regions. P_0xddda_false_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdddc_20 :: state_pred where
  \<open>Q_0xdddc_20 \<sigma> \<equiv> RIP \<sigma> = 0xdddc \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdddc_20_def[Qs]

schematic_goal parse_long_name_0_1_0xddda_0xddda_20[blocks]:
  assumes \<open>(P_0xddda_false_20 && P_0xddda_false_20_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xddda 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdddc_20 ?\<sigma> \<and> block_usage P_0xddda_false_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddda_false_20_def P_0xddda_false_20_regions_def post: Q_0xdddc_20_def regionset: P_0xddda_false_20_regions_set_def)

definition P_0xdddc_21 :: state_pred where
  \<open>P_0xdddc_21 \<sigma> \<equiv> RIP \<sigma> = 0xdddc \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdddc_21_def[Ps]

definition P_0xdddc_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdddc_21_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdddc_21_regions :: state_pred where
  \<open>P_0xdddc_21_regions \<sigma> \<equiv> \<exists>regions. P_0xdddc_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdde2_21 :: state_pred where
  \<open>Q_0xdde2_21 \<sigma> \<equiv> RIP \<sigma> = 0xdde2 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdde2_21_def[Qs]

schematic_goal parse_long_name_0_2_0xdddc_0xdddf_21[blocks]:
  assumes \<open>(P_0xdddc_21 && P_0xdddc_21_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xdddf 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdde2_21 ?\<sigma> \<and> block_usage P_0xdddc_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdddc_21_def P_0xdddc_21_regions_def post: Q_0xdde2_21_def regionset: P_0xdddc_21_regions_set_def)

definition P_0xdde2_true_22 :: state_pred where
  \<open>P_0xdde2_true_22 \<sigma> \<equiv> RIP \<sigma> = 0xdde2 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdde2_true_22_def[Ps]

definition P_0xdde2_true_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdde2_true_22_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdde2_true_22_regions :: state_pred where
  \<open>P_0xdde2_true_22_regions \<sigma> \<equiv> \<exists>regions. P_0xdde2_true_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddfa_22 :: state_pred where
  \<open>Q_0xddfa_22 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddfa_22_def[Qs]

schematic_goal parse_long_name_0_1_0xdde2_0xdde2_22[blocks]:
  assumes \<open>(P_0xdde2_true_22 && P_0xdde2_true_22_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xdde2 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddfa_22 ?\<sigma> \<and> block_usage P_0xdde2_true_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdde2_true_22_def P_0xdde2_true_22_regions_def post: Q_0xddfa_22_def regionset: P_0xdde2_true_22_regions_set_def)

definition P_0xdde2_false_23 :: state_pred where
  \<open>P_0xdde2_false_23 \<sigma> \<equiv> RIP \<sigma> = 0xdde2 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdde2_false_23_def[Ps]

definition P_0xdde2_false_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdde2_false_23_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdde2_false_23_regions :: state_pred where
  \<open>P_0xdde2_false_23_regions \<sigma> \<equiv> \<exists>regions. P_0xdde2_false_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdded_23 :: state_pred where
  \<open>Q_0xdded_23 \<sigma> \<equiv> RIP \<sigma> = 0xdded \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdded_23_def[Qs]

schematic_goal parse_long_name_0_4_0xdde2_0xddea_23[blocks]:
  assumes \<open>(P_0xdde2_false_23 && P_0xdde2_false_23_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0xddea 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdded_23 ?\<sigma> \<and> block_usage P_0xdde2_false_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdde2_false_23_def P_0xdde2_false_23_regions_def post: Q_0xdded_23_def regionset: P_0xdde2_false_23_regions_set_def)

definition P_0xdded_24 :: state_pred where
  \<open>P_0xdded_24 \<sigma> \<equiv> RIP \<sigma> = 0xdded \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdded_24_def[Ps]

definition P_0xdded_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdded_24_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xdded_24_regions :: state_pred where
  \<open>P_0xdded_24_regions \<sigma> \<equiv> \<exists>regions. P_0xdded_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strlen_addr_0xdded_24 :: state_pred where
  \<open>Q_strlen_addr_0xdded_24 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = strlen_addr \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xddf2\<close>
declare Q_strlen_addr_0xdded_24_def[Qs]

schematic_goal parse_long_name_0_1_0xdded_0xdded_24[blocks]:
  assumes \<open>(P_0xdded_24 && P_0xdded_24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xdded 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strlen_addr_0xdded_24 ?\<sigma> \<and> block_usage P_0xdded_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdded_24_def P_0xdded_24_regions_def post: Q_strlen_addr_0xdded_24_def regionset: P_0xdded_24_regions_set_def)

definition P_0xddf2_25 :: state_pred where
  \<open>P_0xddf2_25 \<sigma> \<equiv> RIP \<sigma> = 0xddf2 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xddf2\<close>
declare P_0xddf2_25_def[Ps]

definition P_0xddf2_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddf2_25_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x338), 4),
    (5, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (6, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (8, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xddf2_25_regions :: state_pred where
  \<open>P_0xddf2_25_regions \<sigma> \<equiv> \<exists>regions. P_0xddf2_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddfa_25 :: state_pred where
  \<open>Q_0xddfa_25 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddfa_25_def[Qs]

schematic_goal parse_long_name_0_2_0xddf2_0xddf4_25[blocks]:
  assumes \<open>(P_0xddf2_25 && P_0xddf2_25_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xddf4 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddfa_25 ?\<sigma> \<and> block_usage P_0xddf2_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddf2_25_def P_0xddf2_25_regions_def post: Q_0xddfa_25_def regionset: P_0xddf2_25_regions_set_def)

definition P_0xddfa_26 :: state_pred where
  \<open>P_0xddfa_26 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddfa_26_def[Ps]

definition P_0xddfa_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddfa_26_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddfa_26_regions :: state_pred where
  \<open>P_0xddfa_26_regions \<sigma> \<equiv> \<exists>regions. P_0xddfa_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_26 :: state_pred where
  \<open>Q_ret_address_26 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_26_def[Qs]

schematic_goal parse_long_name_0_5_0xddfa_0xde01_26[blocks]:
  assumes \<open>(P_0xddfa_26 && P_0xddfa_26_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xde01 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_26 ?\<sigma> \<and> block_usage P_0xddfa_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddfa_26_def P_0xddfa_26_regions_def post: Q_ret_address_26_def regionset: P_0xddfa_26_regions_set_def)

definition P_0xde60_27 :: state_pred where
  \<open>P_0xde60_27 \<sigma> \<equiv> RIP \<sigma> = 0xde60 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x33c),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xde60_27_def[Ps]

definition P_0xde60_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xde60_27_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RSI\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (5, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)::64 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xde60_27_regions :: state_pred where
  \<open>P_0xde60_27_regions \<sigma> \<equiv> \<exists>regions. P_0xde60_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_27 :: state_pred where
  \<open>Q_ret_address_27 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_27_def[Qs]

schematic_goal parse_long_name_0_6_0xde60_0xde6d_27[blocks]:
  assumes \<open>(P_0xde60_27 && P_0xde60_27_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0xde6d 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_27 ?\<sigma> \<and> block_usage P_0xde60_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xde60_27_def P_0xde60_27_regions_def post: Q_ret_address_27_def regionset: P_0xde60_27_regions_set_def)

definition P_0xdd1f_false_28 :: state_pred where
  \<open>P_0xdd1f_false_28 \<sigma> \<equiv> RIP \<sigma> = 0xdd1f \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x40)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd1f_false_28_def[Ps]

definition P_0xdd1f_false_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd1f_false_28_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x33c), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd1f_false_28_regions :: state_pred where
  \<open>P_0xdd1f_false_28_regions \<sigma> \<equiv> \<exists>regions. P_0xdd1f_false_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd36_28 :: state_pred where
  \<open>Q_0xdd36_28 \<sigma> \<equiv> RIP \<sigma> = 0xdd36 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd36_28_def[Qs]

schematic_goal parse_long_name_0_5_0xdd1f_0xdd34_28[blocks]:
  assumes \<open>(P_0xdd1f_false_28 && P_0xdd1f_false_28_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0xdd34 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd36_28 ?\<sigma> \<and> block_usage P_0xdd1f_false_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd1f_false_28_def P_0xdd1f_false_28_regions_def post: Q_0xdd36_28_def regionset: P_0xdd1f_false_28_regions_set_def)

definition P_0xdd36_true_29 :: state_pred where
  \<open>P_0xdd36_true_29 \<sigma> \<equiv> RIP \<sigma> = 0xdd36 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd36_true_29_def[Ps]

definition P_0xdd36_true_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd36_true_29_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd36_true_29_regions :: state_pred where
  \<open>P_0xdd36_true_29_regions \<sigma> \<equiv> \<exists>regions. P_0xdd36_true_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddfa_29 :: state_pred where
  \<open>Q_0xddfa_29 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddfa_29_def[Qs]

schematic_goal parse_long_name_0_3_0xdd36_0xde7c_29[blocks]:
  assumes \<open>(P_0xdd36_true_29 && P_0xdd36_true_29_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xde7c 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddfa_29 ?\<sigma> \<and> block_usage P_0xdd36_true_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd36_true_29_def P_0xdd36_true_29_regions_def post: Q_0xddfa_29_def regionset: P_0xdd36_true_29_regions_set_def)

definition P_0xddfa_30 :: state_pred where
  \<open>P_0xddfa_30 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0xffffffff \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddfa_30_def[Ps]

definition P_0xddfa_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddfa_30_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddfa_30_regions :: state_pred where
  \<open>P_0xddfa_30_regions \<sigma> \<equiv> \<exists>regions. P_0xddfa_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_30 :: state_pred where
  \<open>Q_ret_address_30 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_30_def[Qs]

schematic_goal parse_long_name_0_5_0xddfa_0xde01_30[blocks]:
  assumes \<open>(P_0xddfa_30 && P_0xddfa_30_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xde01 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_30 ?\<sigma> \<and> block_usage P_0xddfa_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddfa_30_def P_0xddfa_30_regions_def post: Q_ret_address_30_def regionset: P_0xddfa_30_regions_set_def)

definition P_0xdd36_false_31 :: state_pred where
  \<open>P_0xdd36_false_31 \<sigma> \<equiv> RIP \<sigma> = 0xdd36 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd36_false_31_def[Ps]

definition P_0xdd36_false_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd36_false_31_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd36_false_31_regions :: state_pred where
  \<open>P_0xdd36_false_31_regions \<sigma> \<equiv> \<exists>regions. P_0xdd36_false_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd46_31 :: state_pred where
  \<open>Q_0xdd46_31 \<sigma> \<equiv> RIP \<sigma> = 0xdd46 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd46_31_def[Qs]

schematic_goal parse_long_name_0_3_0xdd36_0xdd40_31[blocks]:
  assumes \<open>(P_0xdd36_false_31 && P_0xdd36_false_31_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xdd40 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd46_31 ?\<sigma> \<and> block_usage P_0xdd36_false_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd36_false_31_def P_0xdd36_false_31_regions_def post: Q_0xdd46_31_def regionset: P_0xdd36_false_31_regions_set_def)

definition P_0xdd46_true_32 :: state_pred where
  \<open>P_0xdd46_true_32 \<sigma> \<equiv> RIP \<sigma> = 0xdd46 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd46_true_32_def[Ps]

definition P_0xdd46_true_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd46_true_32_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd46_true_32_regions :: state_pred where
  \<open>P_0xdd46_true_32_regions \<sigma> \<equiv> \<exists>regions. P_0xdd46_true_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddfa_32 :: state_pred where
  \<open>Q_0xddfa_32 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0xfffffffe \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddfa_32_def[Qs]

schematic_goal parse_long_name_0_3_0xdd46_0xde87_32[blocks]:
  assumes \<open>(P_0xdd46_true_32 && P_0xdd46_true_32_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xde87 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddfa_32 ?\<sigma> \<and> block_usage P_0xdd46_true_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd46_true_32_def P_0xdd46_true_32_regions_def post: Q_0xddfa_32_def regionset: P_0xdd46_true_32_regions_set_def)

definition P_0xddfa_33 :: state_pred where
  \<open>P_0xddfa_33 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0xfffffffe \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddfa_33_def[Ps]

definition P_0xddfa_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddfa_33_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddfa_33_regions :: state_pred where
  \<open>P_0xddfa_33_regions \<sigma> \<equiv> \<exists>regions. P_0xddfa_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_33 :: state_pred where
  \<open>Q_ret_address_33 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_33_def[Qs]

schematic_goal parse_long_name_0_5_0xddfa_0xde01_33[blocks]:
  assumes \<open>(P_0xddfa_33 && P_0xddfa_33_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xde01 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_33 ?\<sigma> \<and> block_usage P_0xddfa_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddfa_33_def P_0xddfa_33_regions_def post: Q_ret_address_33_def regionset: P_0xddfa_33_regions_set_def)

definition P_0xdd46_false_34 :: state_pred where
  \<open>P_0xdd46_false_34 \<sigma> \<equiv> RIP \<sigma> = 0xdd46 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd46_false_34_def[Ps]

definition P_0xdd46_false_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd46_false_34_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd46_false_34_regions :: state_pred where
  \<open>P_0xdd46_false_34_regions \<sigma> \<equiv> \<exists>regions. P_0xdd46_false_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd50_34 :: state_pred where
  \<open>Q_0xdd50_34 \<sigma> \<equiv> RIP \<sigma> = 0xdd50 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd50_34_def[Qs]

schematic_goal parse_long_name_0_2_0xdd46_0xdd4c_34[blocks]:
  assumes \<open>(P_0xdd46_false_34 && P_0xdd46_false_34_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xdd4c 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd50_34 ?\<sigma> \<and> block_usage P_0xdd46_false_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd46_false_34_def P_0xdd46_false_34_regions_def post: Q_0xdd50_34_def regionset: P_0xdd46_false_34_regions_set_def)

definition P_0xdd50_true_35 :: state_pred where
  \<open>P_0xdd50_true_35 \<sigma> \<equiv> RIP \<sigma> = 0xdd50 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd50_true_35_def[Ps]

definition P_0xdd50_true_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd50_true_35_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd50_true_35_regions :: state_pred where
  \<open>P_0xdd50_true_35_regions \<sigma> \<equiv> \<exists>regions. P_0xdd50_true_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddfa_35 :: state_pred where
  \<open>Q_0xddfa_35 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0xfffffffd \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddfa_35_def[Qs]

schematic_goal parse_long_name_0_3_0xdd50_0xde74_35[blocks]:
  assumes \<open>(P_0xdd50_true_35 && P_0xdd50_true_35_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xde74 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddfa_35 ?\<sigma> \<and> block_usage P_0xdd50_true_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd50_true_35_def P_0xdd50_true_35_regions_def post: Q_0xddfa_35_def regionset: P_0xdd50_true_35_regions_set_def)

definition P_0xddfa_36 :: state_pred where
  \<open>P_0xddfa_36 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0xfffffffd \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddfa_36_def[Ps]

definition P_0xddfa_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddfa_36_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddfa_36_regions :: state_pred where
  \<open>P_0xddfa_36_regions \<sigma> \<equiv> \<exists>regions. P_0xddfa_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_36 :: state_pred where
  \<open>Q_ret_address_36 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_36_def[Qs]

schematic_goal parse_long_name_0_5_0xddfa_0xde01_36[blocks]:
  assumes \<open>(P_0xddfa_36 && P_0xddfa_36_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xde01 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_36 ?\<sigma> \<and> block_usage P_0xddfa_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddfa_36_def P_0xddfa_36_regions_def post: Q_ret_address_36_def regionset: P_0xddfa_36_regions_set_def)

definition P_0xdd50_false_37 :: state_pred where
  \<open>P_0xdd50_false_37 \<sigma> \<equiv> RIP \<sigma> = 0xdd50 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd50_false_37_def[Ps]

definition P_0xdd50_false_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd50_false_37_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd50_false_37_regions :: state_pred where
  \<open>P_0xdd50_false_37_regions \<sigma> \<equiv> \<exists>regions. P_0xdd50_false_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd5a_37 :: state_pred where
  \<open>Q_0xdd5a_37 \<sigma> \<equiv> RIP \<sigma> = 0xdd5a \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd5a_37_def[Qs]

schematic_goal parse_long_name_0_2_0xdd50_0xdd56_37[blocks]:
  assumes \<open>(P_0xdd50_false_37 && P_0xdd50_false_37_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xdd56 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd5a_37 ?\<sigma> \<and> block_usage P_0xdd50_false_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd50_false_37_def P_0xdd50_false_37_regions_def post: Q_0xdd5a_37_def regionset: P_0xdd50_false_37_regions_set_def)

definition P_0xdd5a_true_38 :: state_pred where
  \<open>P_0xdd5a_true_38 \<sigma> \<equiv> RIP \<sigma> = 0xdd5a \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd5a_true_38_def[Ps]

definition P_0xdd5a_true_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd5a_true_38_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd5a_true_38_regions :: state_pred where
  \<open>P_0xdd5a_true_38_regions \<sigma> \<equiv> \<exists>regions. P_0xdd5a_true_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddfa_38 :: state_pred where
  \<open>Q_0xddfa_38 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0xfffffffd \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddfa_38_def[Qs]

schematic_goal parse_long_name_0_3_0xdd5a_0xde74_38[blocks]:
  assumes \<open>(P_0xdd5a_true_38 && P_0xdd5a_true_38_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xde74 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddfa_38 ?\<sigma> \<and> block_usage P_0xdd5a_true_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd5a_true_38_def P_0xdd5a_true_38_regions_def post: Q_0xddfa_38_def regionset: P_0xdd5a_true_38_regions_set_def)

definition P_0xddfa_39 :: state_pred where
  \<open>P_0xddfa_39 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0xfffffffd \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddfa_39_def[Ps]

definition P_0xddfa_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddfa_39_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddfa_39_regions :: state_pred where
  \<open>P_0xddfa_39_regions \<sigma> \<equiv> \<exists>regions. P_0xddfa_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_39 :: state_pred where
  \<open>Q_ret_address_39 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_39_def[Qs]

schematic_goal parse_long_name_0_5_0xddfa_0xde01_39[blocks]:
  assumes \<open>(P_0xddfa_39 && P_0xddfa_39_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xde01 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_39 ?\<sigma> \<and> block_usage P_0xddfa_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddfa_39_def P_0xddfa_39_regions_def post: Q_ret_address_39_def regionset: P_0xddfa_39_regions_set_def)

definition P_0xdd5a_false_40 :: state_pred where
  \<open>P_0xdd5a_false_40 \<sigma> \<equiv> RIP \<sigma> = 0xdd5a \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd5a_false_40_def[Ps]

definition P_0xdd5a_false_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd5a_false_40_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd5a_false_40_regions :: state_pred where
  \<open>P_0xdd5a_false_40_regions \<sigma> \<equiv> \<exists>regions. P_0xdd5a_false_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd64_40 :: state_pred where
  \<open>Q_0xdd64_40 \<sigma> \<equiv> RIP \<sigma> = 0xdd64 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd64_40_def[Qs]

schematic_goal parse_long_name_0_2_0xdd5a_0xdd60_40[blocks]:
  assumes \<open>(P_0xdd5a_false_40 && P_0xdd5a_false_40_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xdd60 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd64_40 ?\<sigma> \<and> block_usage P_0xdd5a_false_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd5a_false_40_def P_0xdd5a_false_40_regions_def post: Q_0xdd64_40_def regionset: P_0xdd5a_false_40_regions_set_def)

definition P_0xdd64_true_41 :: state_pred where
  \<open>P_0xdd64_true_41 \<sigma> \<equiv> RIP \<sigma> = 0xdd64 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd64_true_41_def[Ps]

definition P_0xdd64_true_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd64_true_41_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd64_true_41_regions :: state_pred where
  \<open>P_0xdd64_true_41_regions \<sigma> \<equiv> \<exists>regions. P_0xdd64_true_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddfa_41 :: state_pred where
  \<open>Q_0xddfa_41 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0xfffffffd \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddfa_41_def[Qs]

schematic_goal parse_long_name_0_3_0xdd64_0xde74_41[blocks]:
  assumes \<open>(P_0xdd64_true_41 && P_0xdd64_true_41_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xde74 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddfa_41 ?\<sigma> \<and> block_usage P_0xdd64_true_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd64_true_41_def P_0xdd64_true_41_regions_def post: Q_0xddfa_41_def regionset: P_0xdd64_true_41_regions_set_def)

definition P_0xddfa_42 :: state_pred where
  \<open>P_0xddfa_42 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0xfffffffd \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddfa_42_def[Ps]

definition P_0xddfa_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddfa_42_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddfa_42_regions :: state_pred where
  \<open>P_0xddfa_42_regions \<sigma> \<equiv> \<exists>regions. P_0xddfa_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_42 :: state_pred where
  \<open>Q_ret_address_42 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_42_def[Qs]

schematic_goal parse_long_name_0_5_0xddfa_0xde01_42[blocks]:
  assumes \<open>(P_0xddfa_42 && P_0xddfa_42_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xde01 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_42 ?\<sigma> \<and> block_usage P_0xddfa_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddfa_42_def P_0xddfa_42_regions_def post: Q_ret_address_42_def regionset: P_0xddfa_42_regions_set_def)

definition P_0xdd64_false_43 :: state_pred where
  \<open>P_0xdd64_false_43 \<sigma> \<equiv> RIP \<sigma> = 0xdd64 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd64_false_43_def[Ps]

definition P_0xdd64_false_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd64_false_43_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd64_false_43_regions :: state_pred where
  \<open>P_0xdd64_false_43_regions \<sigma> \<equiv> \<exists>regions. P_0xdd64_false_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd97_43 :: state_pred where
  \<open>Q_0xdd97_43 \<sigma> \<equiv> RIP \<sigma> = 0xdd97 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd97_43_def[Qs]

schematic_goal parse_long_name_0_8_0xdd64_0xdd7e_43[blocks]:
  assumes \<open>(P_0xdd64_false_43 && P_0xdd64_false_43_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0xdd7e 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd97_43 ?\<sigma> \<and> block_usage P_0xdd64_false_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd64_false_43_def P_0xdd64_false_43_regions_def post: Q_0xdd97_43_def regionset: P_0xdd64_false_43_regions_set_def)

definition P_0xdd97_44 :: state_pred where
  \<open>P_0xdd97_44 \<sigma> \<equiv> RIP \<sigma> = 0xdd97 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd97_44_def[Ps]

definition P_0xdd97_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd97_44_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd97_44_regions :: state_pred where
  \<open>P_0xdd97_44_regions \<sigma> \<equiv> \<exists>regions. P_0xdd97_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd9a_44 :: state_pred where
  \<open>Q_0xdd9a_44 \<sigma> \<equiv> RIP \<sigma> = 0xdd9a \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd9a_44_def[Qs]

schematic_goal parse_long_name_0_1_0xdd97_0xdd97_44[blocks]:
  assumes \<open>(P_0xdd97_44 && P_0xdd97_44_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xdd97 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd9a_44 ?\<sigma> \<and> block_usage P_0xdd97_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd97_44_def P_0xdd97_44_regions_def post: Q_0xdd9a_44_def regionset: P_0xdd97_44_regions_set_def)

definition P_0xdd9a_true_45 :: state_pred where
  \<open>P_0xdd9a_true_45 \<sigma> \<equiv> RIP \<sigma> = 0xdd9a \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd9a_true_45_def[Ps]

definition P_0xdd9a_true_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd9a_true_45_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd9a_true_45_regions :: state_pred where
  \<open>P_0xdd9a_true_45_regions \<sigma> \<equiv> \<exists>regions. P_0xdd9a_true_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddb0_45 :: state_pred where
  \<open>Q_0xddb0_45 \<sigma> \<equiv> RIP \<sigma> = 0xddb0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddb0_45_def[Qs]

schematic_goal parse_long_name_0_5_0xdd9a_0xde40_45[blocks]:
  assumes \<open>(P_0xdd9a_true_45 && P_0xdd9a_true_45_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0xde40 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddb0_45 ?\<sigma> \<and> block_usage P_0xdd9a_true_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd9a_true_45_def P_0xdd9a_true_45_regions_def post: Q_0xddb0_45_def regionset: P_0xdd9a_true_45_regions_set_def)

definition P_0xdd9a_false_46 :: state_pred where
  \<open>P_0xdd9a_false_46 \<sigma> \<equiv> RIP \<sigma> = 0xdd9a \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd9a_false_46_def[Ps]

definition P_0xdd9a_false_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd9a_false_46_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd9a_false_46_regions :: state_pred where
  \<open>P_0xdd9a_false_46_regions \<sigma> \<equiv> \<exists>regions. P_0xdd9a_false_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdda3_46 :: state_pred where
  \<open>Q_0xdda3_46 \<sigma> \<equiv> RIP \<sigma> = 0xdda3 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdda3_46_def[Qs]

schematic_goal parse_long_name_0_2_0xdd9a_0xdda0_46[blocks]:
  assumes \<open>(P_0xdd9a_false_46 && P_0xdd9a_false_46_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xdda0 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdda3_46 ?\<sigma> \<and> block_usage P_0xdd9a_false_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd9a_false_46_def P_0xdd9a_false_46_regions_def post: Q_0xdda3_46_def regionset: P_0xdd9a_false_46_regions_set_def)

definition P_0xdda3_true_47 :: state_pred where
  \<open>P_0xdda3_true_47 \<sigma> \<equiv> RIP \<sigma> = 0xdda3 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdda3_true_47_def[Ps]

definition P_0xdda3_true_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdda3_true_47_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdda3_true_47_regions :: state_pred where
  \<open>P_0xdda3_true_47_regions \<sigma> \<equiv> \<exists>regions. P_0xdda3_true_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddb0_47 :: state_pred where
  \<open>Q_0xddb0_47 \<sigma> \<equiv> RIP \<sigma> = 0xddb0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddb0_47_def[Qs]

schematic_goal parse_long_name_0_5_0xdda3_0xde58_47[blocks]:
  assumes \<open>(P_0xdda3_true_47 && P_0xdda3_true_47_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0xde58 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddb0_47 ?\<sigma> \<and> block_usage P_0xdda3_true_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdda3_true_47_def P_0xdda3_true_47_regions_def post: Q_0xddb0_47_def regionset: P_0xdda3_true_47_regions_set_def)

definition P_0xdda3_false_48 :: state_pred where
  \<open>P_0xdda3_false_48 \<sigma> \<equiv> RIP \<sigma> = 0xdda3 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdda3_false_48_def[Ps]

definition P_0xdda3_false_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdda3_false_48_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdda3_false_48_regions :: state_pred where
  \<open>P_0xdda3_false_48_regions \<sigma> \<equiv> \<exists>regions. P_0xdda3_false_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddb0_48 :: state_pred where
  \<open>Q_0xddb0_48 \<sigma> \<equiv> RIP \<sigma> = 0xddb0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddb0_48_def[Qs]

schematic_goal parse_long_name_0_3_0xdda3_0xddac_48[blocks]:
  assumes \<open>(P_0xdda3_false_48 && P_0xdda3_false_48_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xddac 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddb0_48 ?\<sigma> \<and> block_usage P_0xdda3_false_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdda3_false_48_def P_0xdda3_false_48_regions_def post: Q_0xddb0_48_def regionset: P_0xdda3_false_48_regions_set_def)

definition P_0xddb0_49 :: state_pred where
  \<open>P_0xddb0_49 \<sigma> \<equiv> RIP \<sigma> = 0xddb0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddb0_49_def[Ps]

definition P_0xddb0_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddb0_49_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RCX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddb0_49_regions :: state_pred where
  \<open>P_0xddb0_49_regions \<sigma> \<equiv> \<exists>regions. P_0xddb0_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddb6_49 :: state_pred where
  \<open>Q_0xddb6_49 \<sigma> \<equiv> RIP \<sigma> = 0xddb6 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddb6_49_def[Qs]

schematic_goal parse_long_name_0_2_0xddb0_0xddb4_49[blocks]:
  assumes \<open>(P_0xddb0_49 && P_0xddb0_49_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xddb4 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddb6_49 ?\<sigma> \<and> block_usage P_0xddb0_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddb0_49_def P_0xddb0_49_regions_def post: Q_0xddb6_49_def regionset: P_0xddb0_49_regions_set_def)

definition P_0xddb6_true_50 :: state_pred where
  \<open>P_0xddb6_true_50 \<sigma> \<equiv> RIP \<sigma> = 0xddb6 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddb6_true_50_def[Ps]

definition P_0xddb6_true_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddb6_true_50_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDX \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (8, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (9, ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R8 \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddb6_true_50_regions :: state_pred where
  \<open>P_0xddb6_true_50_regions \<sigma> \<equiv> \<exists>regions. P_0xddb6_true_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd95_50 :: state_pred where
  \<open>Q_0xdd95_50 \<sigma> \<equiv> RIP \<sigma> = 0xdd95 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd95_50_def[Qs]

schematic_goal parse_long_name_0_7_0xddb6_0xdd92_50[blocks]:
  assumes \<open>(P_0xddb6_true_50 && P_0xddb6_true_50_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0xdd92 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd95_50 ?\<sigma> \<and> block_usage P_0xddb6_true_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddb6_true_50_def P_0xddb6_true_50_regions_def post: Q_0xdd95_50_def regionset: P_0xddb6_true_50_regions_set_def)

definition P_0xdd95_true_51 :: state_pred where
  \<open>P_0xdd95_true_51 \<sigma> \<equiv> RIP \<sigma> = 0xdd95 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd95_true_51_def[Ps]

definition P_0xdd95_true_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd95_true_51_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd95_true_51_regions :: state_pred where
  \<open>P_0xdd95_true_51_regions \<sigma> \<equiv> \<exists>regions. P_0xdd95_true_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdddc_51 :: state_pred where
  \<open>Q_0xdddc_51 \<sigma> \<equiv> RIP \<sigma> = 0xdddc \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdddc_51_def[Qs]

schematic_goal parse_long_name_0_1_0xdd95_0xdd95_51[blocks]:
  assumes \<open>(P_0xdd95_true_51 && P_0xdd95_true_51_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xdd95 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdddc_51 ?\<sigma> \<and> block_usage P_0xdd95_true_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd95_true_51_def P_0xdd95_true_51_regions_def post: Q_0xdddc_51_def regionset: P_0xdd95_true_51_regions_set_def)

definition P_0xdd95_false_52 :: state_pred where
  \<open>P_0xdd95_false_52 \<sigma> \<equiv> RIP \<sigma> = 0xdd95 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdd95_false_52_def[Ps]

definition P_0xdd95_false_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdd95_false_52_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdd95_false_52_regions :: state_pred where
  \<open>P_0xdd95_false_52_regions \<sigma> \<equiv> \<exists>regions. P_0xdd95_false_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd97_52 :: state_pred where
  \<open>Q_0xdd97_52 \<sigma> \<equiv> RIP \<sigma> = 0xdd97 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd97_52_def[Qs]

schematic_goal parse_long_name_0_1_0xdd95_0xdd95_52[blocks]:
  assumes \<open>(P_0xdd95_false_52 && P_0xdd95_false_52_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xdd95 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd97_52 ?\<sigma> \<and> block_usage P_0xdd95_false_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdd95_false_52_def P_0xdd95_false_52_regions_def post: Q_0xdd97_52_def regionset: P_0xdd95_false_52_regions_set_def)

definition P_0xddb6_false_53 :: state_pred where
  \<open>P_0xddb6_false_53 \<sigma> \<equiv> RIP \<sigma> = 0xddb6 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddb6_false_53_def[Ps]

definition P_0xddb6_false_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddb6_false_53_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddb6_false_53_regions :: state_pred where
  \<open>P_0xddb6_false_53_regions \<sigma> \<equiv> \<exists>regions. P_0xddb6_false_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddbb_53 :: state_pred where
  \<open>Q_0xddbb_53 \<sigma> \<equiv> RIP \<sigma> = 0xddbb \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddbb_53_def[Qs]

schematic_goal parse_long_name_0_2_0xddb6_0xddb8_53[blocks]:
  assumes \<open>(P_0xddb6_false_53 && P_0xddb6_false_53_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xddb8 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddbb_53 ?\<sigma> \<and> block_usage P_0xddb6_false_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddb6_false_53_def P_0xddb6_false_53_regions_def post: Q_0xddbb_53_def regionset: P_0xddb6_false_53_regions_set_def)

definition P_0xddbb_true_54 :: state_pred where
  \<open>P_0xddbb_true_54 \<sigma> \<equiv> RIP \<sigma> = 0xddbb \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddbb_true_54_def[Ps]

definition P_0xddbb_true_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddbb_true_54_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddbb_true_54_regions :: state_pred where
  \<open>P_0xddbb_true_54_regions \<sigma> \<equiv> \<exists>regions. P_0xddbb_true_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xde60_54 :: state_pred where
  \<open>Q_0xde60_54 \<sigma> \<equiv> RIP \<sigma> = 0xde60 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xde60_54_def[Qs]

schematic_goal parse_long_name_0_1_0xddbb_0xddbb_54[blocks]:
  assumes \<open>(P_0xddbb_true_54 && P_0xddbb_true_54_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xddbb 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xde60_54 ?\<sigma> \<and> block_usage P_0xddbb_true_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddbb_true_54_def P_0xddbb_true_54_regions_def post: Q_0xde60_54_def regionset: P_0xddbb_true_54_regions_set_def)

definition P_0xddbb_false_55 :: state_pred where
  \<open>P_0xddbb_false_55 \<sigma> \<equiv> RIP \<sigma> = 0xddbb \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddbb_false_55_def[Ps]

definition P_0xddbb_false_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddbb_false_55_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddbb_false_55_regions :: state_pred where
  \<open>P_0xddbb_false_55_regions \<sigma> \<equiv> \<exists>regions. P_0xddbb_false_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddc4_55 :: state_pred where
  \<open>Q_0xddc4_55 \<sigma> \<equiv> RIP \<sigma> = 0xddc4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddc4_55_def[Qs]

schematic_goal parse_long_name_0_2_0xddbb_0xddc1_55[blocks]:
  assumes \<open>(P_0xddbb_false_55 && P_0xddbb_false_55_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xddc1 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddc4_55 ?\<sigma> \<and> block_usage P_0xddbb_false_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddbb_false_55_def P_0xddbb_false_55_regions_def post: Q_0xddc4_55_def regionset: P_0xddbb_false_55_regions_set_def)

definition P_0xddc4_true_56 :: state_pred where
  \<open>P_0xddc4_true_56 \<sigma> \<equiv> RIP \<sigma> = 0xddc4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddc4_true_56_def[Ps]

definition P_0xddc4_true_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddc4_true_56_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddc4_true_56_regions :: state_pred where
  \<open>P_0xddc4_true_56_regions \<sigma> \<equiv> \<exists>regions. P_0xddc4_true_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xde60_56 :: state_pred where
  \<open>Q_0xde60_56 \<sigma> \<equiv> RIP \<sigma> = 0xde60 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xde60_56_def[Qs]

schematic_goal parse_long_name_0_1_0xddc4_0xddc4_56[blocks]:
  assumes \<open>(P_0xddc4_true_56 && P_0xddc4_true_56_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xddc4 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xde60_56 ?\<sigma> \<and> block_usage P_0xddc4_true_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddc4_true_56_def P_0xddc4_true_56_regions_def post: Q_0xde60_56_def regionset: P_0xddc4_true_56_regions_set_def)

definition P_0xddc4_false_57 :: state_pred where
  \<open>P_0xddc4_false_57 \<sigma> \<equiv> RIP \<sigma> = 0xddc4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddc4_false_57_def[Ps]

definition P_0xddc4_false_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddc4_false_57_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RDX \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (8, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddc4_false_57_regions :: state_pred where
  \<open>P_0xddc4_false_57_regions \<sigma> \<equiv> \<exists>regions. P_0xddc4_false_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddda_57 :: state_pred where
  \<open>Q_0xddda_57 \<sigma> \<equiv> RIP \<sigma> = 0xddda \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddda_57_def[Qs]

schematic_goal parse_long_name_0_6_0xddc4_0xddd7_57[blocks]:
  assumes \<open>(P_0xddc4_false_57 && P_0xddc4_false_57_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0xddd7 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddda_57 ?\<sigma> \<and> block_usage P_0xddc4_false_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddc4_false_57_def P_0xddc4_false_57_regions_def post: Q_0xddda_57_def regionset: P_0xddc4_false_57_regions_set_def)

definition P_0xddda_true_58 :: state_pred where
  \<open>P_0xddda_true_58 \<sigma> \<equiv> RIP \<sigma> = 0xddda \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddda_true_58_def[Ps]

definition P_0xddda_true_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddda_true_58_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddda_true_58_regions :: state_pred where
  \<open>P_0xddda_true_58_regions \<sigma> \<equiv> \<exists>regions. P_0xddda_true_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdd97_58 :: state_pred where
  \<open>Q_0xdd97_58 \<sigma> \<equiv> RIP \<sigma> = 0xdd97 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdd97_58_def[Qs]

schematic_goal parse_long_name_0_1_0xddda_0xddda_58[blocks]:
  assumes \<open>(P_0xddda_true_58 && P_0xddda_true_58_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xddda 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdd97_58 ?\<sigma> \<and> block_usage P_0xddda_true_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddda_true_58_def P_0xddda_true_58_regions_def post: Q_0xdd97_58_def regionset: P_0xddda_true_58_regions_set_def)

definition P_0xddda_false_59 :: state_pred where
  \<open>P_0xddda_false_59 \<sigma> \<equiv> RIP \<sigma> = 0xddda \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddda_false_59_def[Ps]

definition P_0xddda_false_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddda_false_59_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddda_false_59_regions :: state_pred where
  \<open>P_0xddda_false_59_regions \<sigma> \<equiv> \<exists>regions. P_0xddda_false_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdddc_59 :: state_pred where
  \<open>Q_0xdddc_59 \<sigma> \<equiv> RIP \<sigma> = 0xdddc \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdddc_59_def[Qs]

schematic_goal parse_long_name_0_1_0xddda_0xddda_59[blocks]:
  assumes \<open>(P_0xddda_false_59 && P_0xddda_false_59_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xddda 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdddc_59 ?\<sigma> \<and> block_usage P_0xddda_false_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddda_false_59_def P_0xddda_false_59_regions_def post: Q_0xdddc_59_def regionset: P_0xddda_false_59_regions_set_def)

definition P_0xdddc_60 :: state_pred where
  \<open>P_0xdddc_60 \<sigma> \<equiv> RIP \<sigma> = 0xdddc \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdddc_60_def[Ps]

definition P_0xdddc_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdddc_60_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdddc_60_regions :: state_pred where
  \<open>P_0xdddc_60_regions \<sigma> \<equiv> \<exists>regions. P_0xdddc_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdde2_60 :: state_pred where
  \<open>Q_0xdde2_60 \<sigma> \<equiv> RIP \<sigma> = 0xdde2 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdde2_60_def[Qs]

schematic_goal parse_long_name_0_2_0xdddc_0xdddf_60[blocks]:
  assumes \<open>(P_0xdddc_60 && P_0xdddc_60_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xdddf 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdde2_60 ?\<sigma> \<and> block_usage P_0xdddc_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdddc_60_def P_0xdddc_60_regions_def post: Q_0xdde2_60_def regionset: P_0xdddc_60_regions_set_def)

definition P_0xdde2_true_61 :: state_pred where
  \<open>P_0xdde2_true_61 \<sigma> \<equiv> RIP \<sigma> = 0xdde2 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdde2_true_61_def[Ps]

definition P_0xdde2_true_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdde2_true_61_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdde2_true_61_regions :: state_pred where
  \<open>P_0xdde2_true_61_regions \<sigma> \<equiv> \<exists>regions. P_0xdde2_true_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddfa_61 :: state_pred where
  \<open>Q_0xddfa_61 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddfa_61_def[Qs]

schematic_goal parse_long_name_0_1_0xdde2_0xdde2_61[blocks]:
  assumes \<open>(P_0xdde2_true_61 && P_0xdde2_true_61_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xdde2 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddfa_61 ?\<sigma> \<and> block_usage P_0xdde2_true_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdde2_true_61_def P_0xdde2_true_61_regions_def post: Q_0xddfa_61_def regionset: P_0xdde2_true_61_regions_set_def)

definition P_0xdde2_false_62 :: state_pred where
  \<open>P_0xdde2_false_62 \<sigma> \<equiv> RIP \<sigma> = 0xdde2 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdde2_false_62_def[Ps]

definition P_0xdde2_false_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdde2_false_62_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xdde2_false_62_regions :: state_pred where
  \<open>P_0xdde2_false_62_regions \<sigma> \<equiv> \<exists>regions. P_0xdde2_false_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xdded_62 :: state_pred where
  \<open>Q_0xdded_62 \<sigma> \<equiv> RIP \<sigma> = 0xdded \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xdded_62_def[Qs]

schematic_goal parse_long_name_0_4_0xdde2_0xddea_62[blocks]:
  assumes \<open>(P_0xdde2_false_62 && P_0xdde2_false_62_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0xddea 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xdded_62 ?\<sigma> \<and> block_usage P_0xdde2_false_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdde2_false_62_def P_0xdde2_false_62_regions_def post: Q_0xdded_62_def regionset: P_0xdde2_false_62_regions_set_def)

definition P_0xdded_63 :: state_pred where
  \<open>P_0xdded_63 \<sigma> \<equiv> RIP \<sigma> = 0xdded \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xdded_63_def[Ps]

definition P_0xdded_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xdded_63_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xdded_63_regions :: state_pred where
  \<open>P_0xdded_63_regions \<sigma> \<equiv> \<exists>regions. P_0xdded_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strlen_addr_0xdded_63 :: state_pred where
  \<open>Q_strlen_addr_0xdded_63 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = strlen_addr \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xddf2\<close>
declare Q_strlen_addr_0xdded_63_def[Qs]

schematic_goal parse_long_name_0_1_0xdded_0xdded_63[blocks]:
  assumes \<open>(P_0xdded_63 && P_0xdded_63_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xdded 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strlen_addr_0xdded_63 ?\<sigma> \<and> block_usage P_0xdded_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xdded_63_def P_0xdded_63_regions_def post: Q_strlen_addr_0xdded_63_def regionset: P_0xdded_63_regions_set_def)

definition P_0xddf2_64 :: state_pred where
  \<open>P_0xddf2_64 \<sigma> \<equiv> RIP \<sigma> = 0xddf2 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0xddf2\<close>
declare P_0xddf2_64_def[Ps]

definition P_0xddf2_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddf2_64_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x338), 4),
    (4, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (8, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xddf2_64_regions :: state_pred where
  \<open>P_0xddf2_64_regions \<sigma> \<equiv> \<exists>regions. P_0xddf2_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xddfa_64 :: state_pred where
  \<open>Q_0xddfa_64 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xddfa_64_def[Qs]

schematic_goal parse_long_name_0_2_0xddf2_0xddf4_64[blocks]:
  assumes \<open>(P_0xddf2_64 && P_0xddf2_64_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xddf4 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xddfa_64 ?\<sigma> \<and> block_usage P_0xddf2_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddf2_64_def P_0xddf2_64_regions_def post: Q_0xddfa_64_def regionset: P_0xddf2_64_regions_set_def)

definition P_0xddfa_65 :: state_pred where
  \<open>P_0xddfa_65 \<sigma> \<equiv> RIP \<sigma> = 0xddfa \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xddfa_65_def[Ps]

definition P_0xddfa_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xddfa_65_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xddfa_65_regions :: state_pred where
  \<open>P_0xddfa_65_regions \<sigma> \<equiv> \<exists>regions. P_0xddfa_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_65 :: state_pred where
  \<open>Q_ret_address_65 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_65_def[Qs]

schematic_goal parse_long_name_0_5_0xddfa_0xde01_65[blocks]:
  assumes \<open>(P_0xddfa_65 && P_0xddfa_65_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xde01 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_65 ?\<sigma> \<and> block_usage P_0xddfa_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xddfa_65_def P_0xddfa_65_regions_def post: Q_ret_address_65_def regionset: P_0xddfa_65_regions_set_def)

definition P_0xde60_66 :: state_pred where
  \<open>P_0xde60_66 \<sigma> \<equiv> RIP \<sigma> = 0xde60 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)) \<and> R12 \<sigma> = 0x1 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)::32 word)::32 word) AND 0x3f)::32 word) - 0x1)::64 word)::64 word) * 0x2)::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word))::32 word)::32 word))::64 word) + (0xd::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x334),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1a),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x1b),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xde60_66_def[Ps]

definition P_0xde60_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xde60_66_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x334), 4),
    (3, ((RSI\<^sub>0::64 word) + 0xb), Suc 0),
    (4, ((RSI\<^sub>0::64 word) + 0xc), Suc 0),
    (5, ((RSI\<^sub>0::64 word) + 0xd), Suc 0),
    (6, ((RSI\<^sub>0::64 word) + 0x1a), Suc 0),
    (7, ((RSI\<^sub>0::64 word) + 0x1b), Suc 0),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0xde60_66_regions :: state_pred where
  \<open>P_0xde60_66_regions \<sigma> \<equiv> \<exists>regions. P_0xde60_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_66 :: state_pred where
  \<open>Q_ret_address_66 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_66_def[Qs]

schematic_goal parse_long_name_0_6_0xde60_0xde6d_66[blocks]:
  assumes \<open>(P_0xde60_66 && P_0xde60_66_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0xde6d 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_66 ?\<sigma> \<and> block_usage P_0xde60_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xde60_66_def P_0xde60_66_regions_def post: Q_ret_address_66_def regionset: P_0xde60_66_regions_set_def)

definition parse_long_name_acode :: ACode where
  \<open>parse_long_name_acode =
    Block 5 0xdd0d 0;
    IF !ZF THEN
      Block 6 0xde01 (Suc 0)
    ELSE
      Block 5 0xdd1c 2;
      IF !ZF THEN
        Block 10 0xde28 3;
        Block 7 0xdd7e 4;
        WHILE P_0xdd97_5 DO
          Block (Suc 0) 0xdd97 5;
          IF ZF THEN
            Block 5 0xde40 6
          ELSE
            Block 2 0xdda0 7;
            IF ZF THEN
              Block 5 0xde58 8
            ELSE
              Block 3 0xddac 9
            FI
          FI;
          Block 2 0xddb4 10;
          IF ZF THEN
            Block 7 0xdd92 11;
            IF ZF THEN
              Block (Suc 0) 0xdd95 12
            ELSE
              Block (Suc 0) 0xdd95 13
            FI
          ELSE
            Block 2 0xddb8 14;
            IF !ZF THEN
              Block (Suc 0) 0xddbb 15
            ELSE
              Block 2 0xddc1 16;
              IF ZF THEN
                Block (Suc 0) 0xddc4 17
              ELSE
                Block 6 0xddd7 18;
                IF !ZF THEN
                  Block (Suc 0) 0xddda 19
                ELSE
                  Block (Suc 0) 0xddda 20
                FI
              FI
            FI
          FI
        OD;
        CASES [
          (P_0xdddc_21,
            Block 2 0xdddf 21;
            IF ZF THEN
              Block (Suc 0) 0xdde2 22
            ELSE
              Block 4 0xddea 23;
              Block (Suc 0) 0xdded 24;
              CALL strlen_acode;
              Block 2 0xddf4 25
            FI;
            Block 5 0xde01 26
          ),
          (P_0xde60_27,
            Block 6 0xde6d 27
          )
        ]
      ELSE
        Block 5 0xdd34 28;
        IF !ZF THEN
          Block 3 0xde7c 29;
          Block 5 0xde01 30
        ELSE
          Block 3 0xdd40 31;
          IF !ZF THEN
            Block 3 0xde87 32;
            Block 5 0xde01 33
          ELSE
            Block 2 0xdd4c 34;
            IF !ZF THEN
              Block 3 0xde74 35;
              Block 5 0xde01 36
            ELSE
              Block 2 0xdd56 37;
              IF !ZF THEN
                Block 3 0xde74 38;
                Block 5 0xde01 39
              ELSE
                Block 2 0xdd60 40;
                IF !ZF THEN
                  Block 3 0xde74 41;
                  Block 5 0xde01 42
                ELSE
                  Block 8 0xdd7e 43;
                  WHILE P_0xdd97_44 DO
                    Block (Suc 0) 0xdd97 44;
                    IF ZF THEN
                      Block 5 0xde40 45
                    ELSE
                      Block 2 0xdda0 46;
                      IF ZF THEN
                        Block 5 0xde58 47
                      ELSE
                        Block 3 0xddac 48
                      FI
                    FI;
                    Block 2 0xddb4 49;
                    IF ZF THEN
                      Block 7 0xdd92 50;
                      IF ZF THEN
                        Block (Suc 0) 0xdd95 51
                      ELSE
                        Block (Suc 0) 0xdd95 52
                      FI
                    ELSE
                      Block 2 0xddb8 53;
                      IF !ZF THEN
                        Block (Suc 0) 0xddbb 54
                      ELSE
                        Block 2 0xddc1 55;
                        IF ZF THEN
                          Block (Suc 0) 0xddc4 56
                        ELSE
                          Block 6 0xddd7 57;
                          IF !ZF THEN
                            Block (Suc 0) 0xddda 58
                          ELSE
                            Block (Suc 0) 0xddda 59
                          FI
                        FI
                      FI
                    FI
                  OD;
                  CASES [
                    (P_0xdddc_60,
                      Block 2 0xdddf 60;
                      IF ZF THEN
                        Block (Suc 0) 0xdde2 61
                      ELSE
                        Block 4 0xddea 62;
                        Block (Suc 0) 0xdded 63;
                        CALL strlen_acode;
                        Block 2 0xddf4 64
                      FI;
                      Block 5 0xde01 65
                    ),
                    (P_0xde60_66,
                      Block 6 0xde6d 66
                    )
                  ]
                FI
              FI
            FI
          FI
        FI
      FI
    FI
  \<close>

method vcg_step' uses assms =
  (rule htriples)+,
  simp,
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?


schematic_goal "parse_long_name":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd0e \<longrightarrow> P_0xdd0e_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd0e \<longrightarrow> P_0xdd0e_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd1f \<longrightarrow> P_0xdd1f_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd6a \<longrightarrow> P_0xdd6a_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd97 \<longrightarrow> P_0xdd97_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd9a \<longrightarrow> P_0xdd9a_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd9a \<longrightarrow> P_0xdd9a_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdda3 \<longrightarrow> P_0xdda3_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdda3 \<longrightarrow> P_0xdda3_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddb0 \<longrightarrow> P_0xddb0_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddb6 \<longrightarrow> P_0xddb6_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd95 \<longrightarrow> P_0xdd95_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd95 \<longrightarrow> P_0xdd95_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddb6 \<longrightarrow> P_0xddb6_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddbb \<longrightarrow> P_0xddbb_true_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddbb \<longrightarrow> P_0xddbb_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddc4 \<longrightarrow> P_0xddc4_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddc4 \<longrightarrow> P_0xddc4_false_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddda \<longrightarrow> P_0xddda_true_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddda \<longrightarrow> P_0xddda_false_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdddc \<longrightarrow> P_0xdddc_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdde2 \<longrightarrow> P_0xdde2_true_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdde2 \<longrightarrow> P_0xdde2_false_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdded \<longrightarrow> P_0xdded_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddf2 \<longrightarrow> P_0xddf2_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddfa \<longrightarrow> P_0xddfa_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xde60 \<longrightarrow> P_0xde60_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd1f \<longrightarrow> P_0xdd1f_false_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd36 \<longrightarrow> P_0xdd36_true_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddfa \<longrightarrow> P_0xddfa_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd36 \<longrightarrow> P_0xdd36_false_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd46 \<longrightarrow> P_0xdd46_true_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddfa \<longrightarrow> P_0xddfa_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd46 \<longrightarrow> P_0xdd46_false_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd50 \<longrightarrow> P_0xdd50_true_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddfa \<longrightarrow> P_0xddfa_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd50 \<longrightarrow> P_0xdd50_false_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd5a \<longrightarrow> P_0xdd5a_true_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddfa \<longrightarrow> P_0xddfa_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd5a \<longrightarrow> P_0xdd5a_false_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd64 \<longrightarrow> P_0xdd64_true_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddfa \<longrightarrow> P_0xddfa_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd64 \<longrightarrow> P_0xdd64_false_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd97 \<longrightarrow> P_0xdd97_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd9a \<longrightarrow> P_0xdd9a_true_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd9a \<longrightarrow> P_0xdd9a_false_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdda3 \<longrightarrow> P_0xdda3_true_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdda3 \<longrightarrow> P_0xdda3_false_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddb0 \<longrightarrow> P_0xddb0_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddb6 \<longrightarrow> P_0xddb6_true_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd95 \<longrightarrow> P_0xdd95_true_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdd95 \<longrightarrow> P_0xdd95_false_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddb6 \<longrightarrow> P_0xddb6_false_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddbb \<longrightarrow> P_0xddbb_true_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddbb \<longrightarrow> P_0xddbb_false_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddc4 \<longrightarrow> P_0xddc4_true_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddc4 \<longrightarrow> P_0xddc4_false_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddda \<longrightarrow> P_0xddda_true_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddda \<longrightarrow> P_0xddda_false_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdddc \<longrightarrow> P_0xdddc_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdde2 \<longrightarrow> P_0xdde2_true_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdde2 \<longrightarrow> P_0xdde2_false_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xdded \<longrightarrow> P_0xdded_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddf2 \<longrightarrow> P_0xddf2_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xddfa \<longrightarrow> P_0xddfa_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xde60 \<longrightarrow> P_0xde60_66_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_strlen_addr_0xdded_24}} \<box>strlen_acode {{P_0xddf2_25;M_0xdded}}\<close>
    and [blocks]: \<open>{{Q_strlen_addr_0xdded_63}} \<box>strlen_acode {{P_0xddf2_64;M_0xdded}}\<close>
  shows \<open>{{?P}} parse_long_name_acode {{?Q;?M}}\<close>
  apply (vcg acode: parse_long_name_acode_def assms: assms)
  apply (vcg_while "P_0xdd97_5 || P_0xdddc_21 || P_0xde60_27")
  apply (vcg_step assms: assms)+
  apply (auto simp add: assms Ps Qs pred_logic)[1]
  apply (vcg_step' assms: assms)
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0xdd97_44 || P_0xdddc_60 || P_0xde60_66")
  apply (vcg_step assms: assms)+
  apply (auto simp add: assms Ps Qs pred_logic)[1]
  apply (vcg_step' assms: assms)
  apply (vcg_step assms: assms)+
  done
end
