theory raw_open
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes open64_0x1c53f_retval\<^sub>v errno_location_0x1c54a_retval\<^sub>v qemu_memalign_0x1c584_retval\<^sub>v open64_0x1c5c4_retval\<^sub>v posix_aio_init_part_8_0x1c5e0_retval\<^sub>v errno_location_0x1c5f0_retval\<^sub>v close_0x1c5fb_retval\<^sub>v errno_location_addr close_addr open64_addr posix_aio_init_part_8_addr qemu_memalign_addr :: \<open>64 word\<close>
    and errno_location_acode close_acode open64_acode posix_aio_init_part_8_acode qemu_memalign_acode :: ACode
  assumes fetch:
    "fetch 0x1c4d0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1c4d2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1c4d5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1c4d7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1c4da \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c4db \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x1c4dd \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c4de \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1c4e2 \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 57246)))) (Immediate SixtyFour (ImmVal 0)), 8)"
    "fetch 0x1c4ea \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x1c4ee \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 116192)), 6)"
    "fetch 0x1c4f4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x1c4f6 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8)))) (Immediate SixtyFour (ImmVal 0)), 7)"
    "fetch 0x1c4fd \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 3)), 3)"
    "fetch 0x1c500 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x1c503 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 115984)), 2)"
    "fetch 0x1c505 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 8)))) (Immediate SixtyFour (ImmVal 1)), 9)"
    "fetch 0x1c50e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x1c510 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x1c512 \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 576)), 5)"
    "fetch 0x1c517 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rbp)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0x1c51b \<equiv> (Binary (IS_PentiumPro Cmovne) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1c51e \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rbp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x1c522 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 116136)), 6)"
    "fetch 0x1c528 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 4)))) (Immediate SixtyFour (ImmVal 0)), 7)"
    "fetch 0x1c52f \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 16384)), 6)"
    "fetch 0x1c535 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 420)), 5)"
    "fetch 0x1c53a \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c53c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1c53f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''open64'')), 5)"
    "fetch 0x1c544 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c546 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c548 \<equiv> (Unary (IS_8088 Jns) (Immediate SixtyFour (ImmVal 116080)), 2)"
    "fetch 0x1c54a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x1c54f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1c551 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c553 \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c555 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 30)), 3)"
    "fetch 0x1c558 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967283)), 5)"
    "fetch 0x1c55d \<equiv> (Binary (IS_PentiumPro Cmove) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1c560 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1c564 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c566 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c567 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c568 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1c56a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1c56c \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1c56d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x1c570 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx)))) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c572 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 16384)), 5)"
    "fetch 0x1c577 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0x1c57c \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40)))) (Immediate SixtyFour (ImmVal 0)), 8)"
    "fetch 0x1c584 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_memalign'')), 5)"
    "fetch 0x1c589 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1c58d \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c590 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 116208)), 2)"
    "fetch 0x1c592 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c594 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1c598 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c59a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c59b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c59c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1c59e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1c5a0 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1c5a1 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x1c5a8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x1c5aa \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 4)))) (Immediate SixtyFour (ImmVal 0)), 7)"
    "fetch 0x1c5b1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 420)), 5)"
    "fetch 0x1c5b6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1c5b9 \<equiv> (Binary (IS_8088 Or) (Reg (General EightHigh rax)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x1c5bc \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 64)), 3)"
    "fetch 0x1c5bf \<equiv> (Binary (IS_PentiumPro Cmove) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1c5c2 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c5c4 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''open64'')), 5)"
    "fetch 0x1c5c9 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c5cb \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 116042)), 6)"
    "fetch 0x1c5d1 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx)))) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c5d3 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40)))) (Immediate SixtyFour (ImmVal 0)), 8)"
    "fetch 0x1c5db \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c5dd \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 116116)), 2)"
    "fetch 0x1c5df \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x1c5e0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''posix_aio_init.part.8'')), 5)"
    "fetch 0x1c5e5 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 115956)), 5)"
    "fetch 0x1c5ea \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x1c5f0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x1c5f5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x1c5f7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1c5f9 \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c5fb \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''close'')), 5)"
    "fetch 0x1c600 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 116064)), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and errno_location\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__errno_location'') = errno_location_addr\<close>
    and close\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''close'') = close_addr\<close>
    and open64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''open64'') = open64_addr\<close>
    and posix_aio_init_part_8\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''posix_aio_init.part.8'') = posix_aio_init_part_8_addr\<close>
    and qemu_memalign\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_memalign'') = qemu_memalign_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>open64_0x1c53f_retval \<equiv> open64_0x1c53f_retval\<^sub>v\<close>
definition \<open>errno_location_0x1c54a_retval \<equiv> errno_location_0x1c54a_retval\<^sub>v\<close>
definition \<open>qemu_memalign_0x1c584_retval \<equiv> qemu_memalign_0x1c584_retval\<^sub>v\<close>
definition \<open>open64_0x1c5c4_retval \<equiv> open64_0x1c5c4_retval\<^sub>v\<close>
definition \<open>posix_aio_init_part_8_0x1c5e0_retval \<equiv> posix_aio_init_part_8_0x1c5e0_retval\<^sub>v\<close>
definition \<open>errno_location_0x1c5f0_retval \<equiv> errno_location_0x1c5f0_retval\<^sub>v\<close>
definition \<open>close_0x1c5fb_retval \<equiv> close_0x1c5fb_retval\<^sub>v\<close>

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

locale "raw_open" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1c4d0_0 :: state_pred where
  \<open>P_0x1c4d0_0 \<sigma> \<equiv> RIP \<sigma> = 0x1c4d0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1c4d0_0_def[Ps]

definition P_0x1c4d0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c4d0_0_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c4d0_0_regions :: state_pred where
  \<open>P_0x1c4d0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1c4d0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c4ee_0 :: state_pred where
  \<open>Q_0x1c4ee_0 \<sigma> \<equiv> RIP \<sigma> = 0x1c4ee \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c4ee_0_def[Qs]

schematic_goal raw_open_0_10_0x1c4d0_0x1c4ea_0[blocks]:
  assumes \<open>(P_0x1c4d0_0 && P_0x1c4d0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x1c4ea 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c4ee_0 ?\<sigma> \<and> block_usage P_0x1c4d0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c4d0_0_def P_0x1c4d0_0_regions_def post: Q_0x1c4ee_0_def regionset: P_0x1c4d0_0_regions_set_def)

definition P_0x1c4ee_true_1 :: state_pred where
  \<open>P_0x1c4ee_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x1c4ee \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c4ee_true_1_def[Ps]

definition P_0x1c4ee_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c4ee_true_1_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c4ee_true_1_regions :: state_pred where
  \<open>P_0x1c4ee_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1c4ee_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c5e0_1 :: state_pred where
  \<open>Q_0x1c5e0_1 \<sigma> \<equiv> RIP \<sigma> = 0x1c5e0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c5e0_1_def[Qs]

schematic_goal raw_open_0_1_0x1c4ee_0x1c4ee_1[blocks]:
  assumes \<open>(P_0x1c4ee_true_1 && P_0x1c4ee_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c4ee (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c5e0_1 ?\<sigma> \<and> block_usage P_0x1c4ee_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c4ee_true_1_def P_0x1c4ee_true_1_regions_def post: Q_0x1c5e0_1_def regionset: P_0x1c4ee_true_1_regions_set_def)

definition P_0x1c5e0_2 :: state_pred where
  \<open>P_0x1c5e0_2 \<sigma> \<equiv> RIP \<sigma> = 0x1c5e0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c5e0_2_def[Ps]

definition P_0x1c5e0_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c5e0_2_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c5e0_2_regions :: state_pred where
  \<open>P_0x1c5e0_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1c5e0_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_posix_aio_init_part_8_addr_0x1c5e0_2 :: state_pred where
  \<open>Q_posix_aio_init_part_8_addr_0x1c5e0_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = posix_aio_init_part_8_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5e5\<close>
declare Q_posix_aio_init_part_8_addr_0x1c5e0_2_def[Qs]

schematic_goal raw_open_0_1_0x1c5e0_0x1c5e0_2[blocks]:
  assumes \<open>(P_0x1c5e0_2 && P_0x1c5e0_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c5e0 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_posix_aio_init_part_8_addr_0x1c5e0_2 ?\<sigma> \<and> block_usage P_0x1c5e0_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c5e0_2_def P_0x1c5e0_2_regions_def post: Q_posix_aio_init_part_8_addr_0x1c5e0_2_def regionset: P_0x1c5e0_2_regions_set_def)

definition P_0x1c5e5_3 :: state_pred where
  \<open>P_0x1c5e5_3 \<sigma> \<equiv> RIP \<sigma> = 0x1c5e5 \<and> RAX \<sigma> = posix_aio_init_part_8_0x1c5e0_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5e5\<close>
declare P_0x1c5e5_3_def[Ps]

definition P_0x1c5e5_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c5e5_3_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c5e5_3_regions :: state_pred where
  \<open>P_0x1c5e5_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1c5e5_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c4f4_3 :: state_pred where
  \<open>Q_0x1c4f4_3 \<sigma> \<equiv> RIP \<sigma> = 0x1c4f4 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c4f4_3_def[Qs]

schematic_goal raw_open_0_1_0x1c5e5_0x1c5e5_3[blocks]:
  assumes \<open>(P_0x1c5e5_3 && P_0x1c5e5_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c5e5 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c4f4_3 ?\<sigma> \<and> block_usage P_0x1c5e5_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c5e5_3_def P_0x1c5e5_3_regions_def post: Q_0x1c4f4_3_def regionset: P_0x1c5e5_3_regions_set_def)

definition P_0x1c4ee_false_4 :: state_pred where
  \<open>P_0x1c4ee_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x1c4ee \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c4ee_false_4_def[Ps]

definition P_0x1c4ee_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c4ee_false_4_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c4ee_false_4_regions :: state_pred where
  \<open>P_0x1c4ee_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1c4ee_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c4f4_4 :: state_pred where
  \<open>Q_0x1c4f4_4 \<sigma> \<equiv> RIP \<sigma> = 0x1c4f4 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c4f4_4_def[Qs]

schematic_goal raw_open_0_1_0x1c4ee_0x1c4ee_4[blocks]:
  assumes \<open>(P_0x1c4ee_false_4 && P_0x1c4ee_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c4ee 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c4f4_4 ?\<sigma> \<and> block_usage P_0x1c4ee_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c4ee_false_4_def P_0x1c4ee_false_4_regions_def post: Q_0x1c4f4_4_def regionset: P_0x1c4ee_false_4_regions_set_def)

definition P_0x1c4f4_5 :: state_pred where
  \<open>P_0x1c4f4_5 \<sigma> \<equiv> RIP \<sigma> = 0x1c4f4 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c4f4_5_def[Ps]

definition P_0x1c4f4_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c4f4_5_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c4f4_5_regions :: state_pred where
  \<open>P_0x1c4f4_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1c4f4_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c503_5 :: state_pred where
  \<open>Q_0x1c503_5 \<sigma> \<equiv> RIP \<sigma> = 0x1c503 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x3)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c503_5_def[Qs]

schematic_goal raw_open_0_4_0x1c4f4_0x1c500_5[blocks]:
  assumes \<open>(P_0x1c4f4_5 && P_0x1c4f4_5_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1c500 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c503_5 ?\<sigma> \<and> block_usage P_0x1c4f4_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c4f4_5_def P_0x1c4f4_5_regions_def post: Q_0x1c503_5_def regionset: P_0x1c4f4_5_regions_set_def)

definition P_0x1c503_true_6 :: state_pred where
  \<open>P_0x1c503_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x1c503 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x3)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c503_true_6_def[Ps]

definition P_0x1c503_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c503_true_6_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c503_true_6_regions :: state_pred where
  \<open>P_0x1c503_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1c503_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c510_6 :: state_pred where
  \<open>Q_0x1c510_6 \<sigma> \<equiv> RIP \<sigma> = 0x1c510 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c510_6_def[Qs]

schematic_goal raw_open_0_1_0x1c503_0x1c503_6[blocks]:
  assumes \<open>(P_0x1c503_true_6 && P_0x1c503_true_6_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c503 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c510_6 ?\<sigma> \<and> block_usage P_0x1c503_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c503_true_6_def P_0x1c503_true_6_regions_def post: Q_0x1c510_6_def regionset: P_0x1c503_true_6_regions_set_def)

definition P_0x1c503_false_7 :: state_pred where
  \<open>P_0x1c503_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x1c503 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x3)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c503_false_7_def[Ps]

definition P_0x1c503_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c503_false_7_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c503_false_7_regions :: state_pred where
  \<open>P_0x1c503_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1c503_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c510_7 :: state_pred where
  \<open>Q_0x1c510_7 \<sigma> \<equiv> RIP \<sigma> = 0x1c510 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c510_7_def[Qs]

schematic_goal raw_open_0_3_0x1c503_0x1c50e_7[blocks]:
  assumes \<open>(P_0x1c503_false_7 && P_0x1c503_false_7_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1c50e 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c510_7 ?\<sigma> \<and> block_usage P_0x1c503_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c503_false_7_def P_0x1c503_false_7_regions_def post: Q_0x1c510_7_def regionset: P_0x1c503_false_7_regions_set_def)

definition P_0x1c510_8 :: state_pred where
  \<open>P_0x1c510_8 \<sigma> \<equiv> RIP \<sigma> = 0x1c510 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c510_8_def[Ps]

definition P_0x1c510_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c510_8_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c510_8_regions :: state_pred where
  \<open>P_0x1c510_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1c510_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c522_8 :: state_pred where
  \<open>Q_0x1c522_8 \<sigma> \<equiv> RIP \<sigma> = 0x1c522 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c522_8_def[Qs]

schematic_goal raw_open_0_5_0x1c510_0x1c51e_8[blocks]:
  assumes \<open>(P_0x1c510_8 && P_0x1c510_8_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1c51e 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c522_8 ?\<sigma> \<and> block_usage P_0x1c510_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c510_8_def P_0x1c510_8_regions_def post: Q_0x1c522_8_def regionset: P_0x1c510_8_regions_set_def)

definition P_0x1c522_true_9 :: state_pred where
  \<open>P_0x1c522_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x1c522 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c522_true_9_def[Ps]

definition P_0x1c522_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c522_true_9_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c522_true_9_regions :: state_pred where
  \<open>P_0x1c522_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1c522_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c5c4_9 :: state_pred where
  \<open>Q_0x1c5c4_9 \<sigma> \<equiv> RIP \<sigma> = 0x1c5c4 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c5c4_9_def[Qs]

schematic_goal raw_open_0_9_0x1c522_0x1c5c2_9[blocks]:
  assumes \<open>(P_0x1c522_true_9 && P_0x1c522_true_9_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1c5c2 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c5c4_9 ?\<sigma> \<and> block_usage P_0x1c522_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c522_true_9_def P_0x1c522_true_9_regions_def post: Q_0x1c5c4_9_def regionset: P_0x1c522_true_9_regions_set_def)

definition P_0x1c5c4_10 :: state_pred where
  \<open>P_0x1c5c4_10 \<sigma> \<equiv> RIP \<sigma> = 0x1c5c4 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c5c4_10_def[Ps]

definition P_0x1c5c4_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c5c4_10_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c5c4_10_regions :: state_pred where
  \<open>P_0x1c5c4_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1c5c4_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_open64_addr_0x1c5c4_10 :: state_pred where
  \<open>Q_open64_addr_0x1c5c4_10 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = open64_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5c9\<close>
declare Q_open64_addr_0x1c5c4_10_def[Qs]

schematic_goal raw_open_0_1_0x1c5c4_0x1c5c4_10[blocks]:
  assumes \<open>(P_0x1c5c4_10 && P_0x1c5c4_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c5c4 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_open64_addr_0x1c5c4_10 ?\<sigma> \<and> block_usage P_0x1c5c4_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c5c4_10_def P_0x1c5c4_10_regions_def post: Q_open64_addr_0x1c5c4_10_def regionset: P_0x1c5c4_10_regions_set_def)

definition P_0x1c5c9_11 :: state_pred where
  \<open>P_0x1c5c9_11 \<sigma> \<equiv> RIP \<sigma> = 0x1c5c9 \<and> RAX \<sigma> = open64_0x1c5c4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5c9\<close>
declare P_0x1c5c9_11_def[Ps]

definition P_0x1c5c9_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c5c9_11_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c5c9_11_regions :: state_pred where
  \<open>P_0x1c5c9_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1c5c9_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c5cb_11 :: state_pred where
  \<open>Q_0x1c5cb_11 \<sigma> \<equiv> RIP \<sigma> = 0x1c5cb \<and> RAX \<sigma> = open64_0x1c5c4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5c9\<close>
declare Q_0x1c5cb_11_def[Qs]

schematic_goal raw_open_0_1_0x1c5c9_0x1c5c9_11[blocks]:
  assumes \<open>(P_0x1c5c9_11 && P_0x1c5c9_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c5c9 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c5cb_11 ?\<sigma> \<and> block_usage P_0x1c5c9_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c5c9_11_def P_0x1c5c9_11_regions_def post: Q_0x1c5cb_11_def regionset: P_0x1c5c9_11_regions_set_def)

definition P_0x1c5cb_true_12 :: state_pred where
  \<open>P_0x1c5cb_true_12 \<sigma> \<equiv> RIP \<sigma> = 0x1c5cb \<and> RAX \<sigma> = open64_0x1c5c4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5c9\<close>
declare P_0x1c5cb_true_12_def[Ps]

definition P_0x1c5cb_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c5cb_true_12_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c5cb_true_12_regions :: state_pred where
  \<open>P_0x1c5cb_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0x1c5cb_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c54a_12 :: state_pred where
  \<open>Q_0x1c54a_12 \<sigma> \<equiv> RIP \<sigma> = 0x1c54a \<and> RAX \<sigma> = open64_0x1c5c4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5c9\<close>
declare Q_0x1c54a_12_def[Qs]

schematic_goal raw_open_0_1_0x1c5cb_0x1c5cb_12[blocks]:
  assumes \<open>(P_0x1c5cb_true_12 && P_0x1c5cb_true_12_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c5cb 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c54a_12 ?\<sigma> \<and> block_usage P_0x1c5cb_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c5cb_true_12_def P_0x1c5cb_true_12_regions_def post: Q_0x1c54a_12_def regionset: P_0x1c5cb_true_12_regions_set_def)

definition P_0x1c54a_13 :: state_pred where
  \<open>P_0x1c54a_13 \<sigma> \<equiv> RIP \<sigma> = 0x1c54a \<and> RAX \<sigma> = open64_0x1c5c4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5c9\<close>
declare P_0x1c54a_13_def[Ps]

definition P_0x1c54a_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c54a_13_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c54a_13_regions :: state_pred where
  \<open>P_0x1c54a_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1c54a_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x1c54a_13 :: state_pred where
  \<open>Q_errno_location_addr_0x1c54a_13 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = open64_0x1c5c4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c54f\<close>
declare Q_errno_location_addr_0x1c54a_13_def[Qs]

schematic_goal raw_open_0_1_0x1c54a_0x1c54a_13[blocks]:
  assumes \<open>(P_0x1c54a_13 && P_0x1c54a_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c54a 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x1c54a_13 ?\<sigma> \<and> block_usage P_0x1c54a_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c54a_13_def P_0x1c54a_13_regions_def post: Q_errno_location_addr_0x1c54a_13_def regionset: P_0x1c54a_13_regions_set_def)

definition P_0x1c54f_14 :: state_pred where
  \<open>P_0x1c54f_14 \<sigma> \<equiv> RIP \<sigma> = 0x1c54f \<and> RAX \<sigma> = errno_location_0x1c54a_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c54f\<close>
declare P_0x1c54f_14_def[Ps]

definition P_0x1c54f_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c54f_14_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, errno_location_0x1c54a_retval, 4)
  }\<close>

definition P_0x1c54f_14_regions :: state_pred where
  \<open>P_0x1c54f_14_regions \<sigma> \<equiv> \<exists>regions. P_0x1c54f_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c560_14 :: state_pred where
  \<open>Q_0x1c560_14 \<sigma> \<equiv> RIP \<sigma> = 0x1c560 \<and> RAX \<sigma> = 0xfffffff3 \<and> RBX \<sigma> = ucast ((if' ((\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word)::32 word) = 0x1e then 0xfffffff3 else ((- (\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word))::32 word))) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c54f \<and> (\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word) = ucast ((\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word))\<close>
declare Q_0x1c560_14_def[Qs]

schematic_goal raw_open_0_6_0x1c54f_0x1c55d_14[blocks]:
  assumes \<open>(P_0x1c54f_14 && P_0x1c54f_14_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x1c55d 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c560_14 ?\<sigma> \<and> block_usage P_0x1c54f_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c54f_14_def P_0x1c54f_14_regions_def post: Q_0x1c560_14_def regionset: P_0x1c54f_14_regions_set_def)

definition P_0x1c560_15 :: state_pred where
  \<open>P_0x1c560_15 \<sigma> \<equiv> RIP \<sigma> = 0x1c560 \<and> RAX \<sigma> = 0xfffffff3 \<and> RBX \<sigma> = ucast ((if' ((\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word)::32 word) = 0x1e then 0xfffffff3 else ((- (\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word))::32 word))) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c54f \<and> (\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word) = ucast ((\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word))\<close>
declare P_0x1c560_15_def[Ps]

definition P_0x1c560_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c560_15_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, errno_location_0x1c54a_retval, 4)
  }\<close>

definition P_0x1c560_15_regions :: state_pred where
  \<open>P_0x1c560_15_regions \<sigma> \<equiv> \<exists>regions. P_0x1c560_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_15 :: state_pred where
  \<open>Q_ret_address_15 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_15_def[Qs]

schematic_goal raw_open_0_7_0x1c560_0x1c56c_15[blocks]:
  assumes \<open>(P_0x1c560_15 && P_0x1c560_15_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c56c 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_15 ?\<sigma> \<and> block_usage P_0x1c560_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c560_15_def P_0x1c560_15_regions_def post: Q_ret_address_15_def regionset: P_0x1c560_15_regions_set_def)

definition P_0x1c5cb_false_16 :: state_pred where
  \<open>P_0x1c5cb_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x1c5cb \<and> RAX \<sigma> = open64_0x1c5c4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5c9\<close>
declare P_0x1c5cb_false_16_def[Ps]

definition P_0x1c5cb_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c5cb_false_16_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x1c5cb_false_16_regions :: state_pred where
  \<open>P_0x1c5cb_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x1c5cb_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c594_16 :: state_pred where
  \<open>Q_0x1c594_16 \<sigma> \<equiv> RIP \<sigma> = 0x1c594 \<and> RAX \<sigma> = open64_0x1c5c4_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5c9\<close>
declare Q_0x1c594_16_def[Qs]

schematic_goal raw_open_0_5_0x1c5cb_0x1c5dd_16[blocks]:
  assumes \<open>(P_0x1c5cb_false_16 && P_0x1c5cb_false_16_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x1c5dd 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c594_16 ?\<sigma> \<and> block_usage P_0x1c5cb_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c5cb_false_16_def P_0x1c5cb_false_16_regions_def post: Q_0x1c594_16_def regionset: P_0x1c5cb_false_16_regions_set_def)

definition P_0x1c594_17 :: state_pred where
  \<open>P_0x1c594_17 \<sigma> \<equiv> RIP \<sigma> = 0x1c594 \<and> RAX \<sigma> = open64_0x1c5c4_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word) AND 0x40)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5c9\<close>
declare P_0x1c594_17_def[Ps]

definition P_0x1c594_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c594_17_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c594_17_regions :: state_pred where
  \<open>P_0x1c594_17_regions \<sigma> \<equiv> \<exists>regions. P_0x1c594_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_17 :: state_pred where
  \<open>Q_ret_address_17 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_17_def[Qs]

schematic_goal raw_open_0_7_0x1c594_0x1c5a0_17[blocks]:
  assumes \<open>(P_0x1c594_17 && P_0x1c594_17_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c5a0 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_17 ?\<sigma> \<and> block_usage P_0x1c594_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c594_17_def P_0x1c594_17_regions_def post: Q_ret_address_17_def regionset: P_0x1c594_17_regions_set_def)

definition P_0x1c522_false_18 :: state_pred where
  \<open>P_0x1c522_false_18 \<sigma> \<equiv> RIP \<sigma> = 0x1c522 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c522_false_18_def[Ps]

definition P_0x1c522_false_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c522_false_18_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c522_false_18_regions :: state_pred where
  \<open>P_0x1c522_false_18_regions \<sigma> \<equiv> \<exists>regions. P_0x1c522_false_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c53f_18 :: state_pred where
  \<open>Q_0x1c53f_18 \<sigma> \<equiv> RIP \<sigma> = 0x1c53f \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c53f_18_def[Qs]

schematic_goal raw_open_0_6_0x1c522_0x1c53c_18[blocks]:
  assumes \<open>(P_0x1c522_false_18 && P_0x1c522_false_18_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x1c53c 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c53f_18 ?\<sigma> \<and> block_usage P_0x1c522_false_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c522_false_18_def P_0x1c522_false_18_regions_def post: Q_0x1c53f_18_def regionset: P_0x1c522_false_18_regions_set_def)

definition P_0x1c53f_19 :: state_pred where
  \<open>P_0x1c53f_19 \<sigma> \<equiv> RIP \<sigma> = 0x1c53f \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c53f_19_def[Ps]

definition P_0x1c53f_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c53f_19_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c53f_19_regions :: state_pred where
  \<open>P_0x1c53f_19_regions \<sigma> \<equiv> \<exists>regions. P_0x1c53f_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_open64_addr_0x1c53f_19 :: state_pred where
  \<open>Q_open64_addr_0x1c53f_19 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = open64_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c544\<close>
declare Q_open64_addr_0x1c53f_19_def[Qs]

schematic_goal raw_open_0_1_0x1c53f_0x1c53f_19[blocks]:
  assumes \<open>(P_0x1c53f_19 && P_0x1c53f_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c53f 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_open64_addr_0x1c53f_19 ?\<sigma> \<and> block_usage P_0x1c53f_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c53f_19_def P_0x1c53f_19_regions_def post: Q_open64_addr_0x1c53f_19_def regionset: P_0x1c53f_19_regions_set_def)

definition P_0x1c544_20 :: state_pred where
  \<open>P_0x1c544_20 \<sigma> \<equiv> RIP \<sigma> = 0x1c544 \<and> RAX \<sigma> = open64_0x1c53f_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c544\<close>
declare P_0x1c544_20_def[Ps]

definition P_0x1c544_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c544_20_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c544_20_regions :: state_pred where
  \<open>P_0x1c544_20_regions \<sigma> \<equiv> \<exists>regions. P_0x1c544_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c548_20 :: state_pred where
  \<open>Q_0x1c548_20 \<sigma> \<equiv> RIP \<sigma> = 0x1c548 \<and> RAX \<sigma> = open64_0x1c53f_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c544\<close>
declare Q_0x1c548_20_def[Qs]

schematic_goal raw_open_0_2_0x1c544_0x1c546_20[blocks]:
  assumes \<open>(P_0x1c544_20 && P_0x1c544_20_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c546 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c548_20 ?\<sigma> \<and> block_usage P_0x1c544_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c544_20_def P_0x1c544_20_regions_def post: Q_0x1c548_20_def regionset: P_0x1c544_20_regions_set_def)

definition P_0x1c548_true_21 :: state_pred where
  \<open>P_0x1c548_true_21 \<sigma> \<equiv> RIP \<sigma> = 0x1c548 \<and> RAX \<sigma> = open64_0x1c53f_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c544\<close>
declare P_0x1c548_true_21_def[Ps]

definition P_0x1c548_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c548_true_21_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x1c548_true_21_regions :: state_pred where
  \<open>P_0x1c548_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0x1c548_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c584_21 :: state_pred where
  \<open>Q_0x1c584_21 \<sigma> \<equiv> RIP \<sigma> = 0x1c584 \<and> RAX \<sigma> = open64_0x1c53f_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c544\<close>
declare Q_0x1c584_21_def[Qs]

schematic_goal raw_open_0_5_0x1c548_0x1c57c_21[blocks]:
  assumes \<open>(P_0x1c548_true_21 && P_0x1c548_true_21_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x1c57c 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c584_21 ?\<sigma> \<and> block_usage P_0x1c548_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c548_true_21_def P_0x1c548_true_21_regions_def post: Q_0x1c584_21_def regionset: P_0x1c548_true_21_regions_set_def)

definition P_0x1c584_22 :: state_pred where
  \<open>P_0x1c584_22 \<sigma> \<equiv> RIP \<sigma> = 0x1c584 \<and> RAX \<sigma> = open64_0x1c53f_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c544\<close>
declare P_0x1c584_22_def[Ps]

definition P_0x1c584_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c584_22_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c584_22_regions :: state_pred where
  \<open>P_0x1c584_22_regions \<sigma> \<equiv> \<exists>regions. P_0x1c584_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_memalign_addr_0x1c584_22 :: state_pred where
  \<open>Q_qemu_memalign_addr_0x1c584_22 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = qemu_memalign_addr \<and> RAX \<sigma> = open64_0x1c53f_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c589\<close>
declare Q_qemu_memalign_addr_0x1c584_22_def[Qs]

schematic_goal raw_open_0_1_0x1c584_0x1c584_22[blocks]:
  assumes \<open>(P_0x1c584_22 && P_0x1c584_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c584 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_memalign_addr_0x1c584_22 ?\<sigma> \<and> block_usage P_0x1c584_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c584_22_def P_0x1c584_22_regions_def post: Q_qemu_memalign_addr_0x1c584_22_def regionset: P_0x1c584_22_regions_set_def)

definition P_0x1c589_23 :: state_pred where
  \<open>P_0x1c589_23 \<sigma> \<equiv> RIP \<sigma> = 0x1c589 \<and> RAX \<sigma> = qemu_memalign_0x1c584_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c589\<close>
declare P_0x1c589_23_def[Ps]

definition P_0x1c589_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c589_23_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c589_23_regions :: state_pred where
  \<open>P_0x1c589_23_regions \<sigma> \<equiv> \<exists>regions. P_0x1c589_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c590_23 :: state_pred where
  \<open>Q_0x1c590_23 \<sigma> \<equiv> RIP \<sigma> = 0x1c590 \<and> RAX \<sigma> = qemu_memalign_0x1c584_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c589\<close>
declare Q_0x1c590_23_def[Qs]

schematic_goal raw_open_0_2_0x1c589_0x1c58d_23[blocks]:
  assumes \<open>(P_0x1c589_23 && P_0x1c589_23_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c58d 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c590_23 ?\<sigma> \<and> block_usage P_0x1c589_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c589_23_def P_0x1c589_23_regions_def post: Q_0x1c590_23_def regionset: P_0x1c589_23_regions_set_def)

definition P_0x1c590_true_24 :: state_pred where
  \<open>P_0x1c590_true_24 \<sigma> \<equiv> RIP \<sigma> = 0x1c590 \<and> RAX \<sigma> = qemu_memalign_0x1c584_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c589\<close>
declare P_0x1c590_true_24_def[Ps]

definition P_0x1c590_true_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c590_true_24_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c590_true_24_regions :: state_pred where
  \<open>P_0x1c590_true_24_regions \<sigma> \<equiv> \<exists>regions. P_0x1c590_true_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c5f0_24 :: state_pred where
  \<open>Q_0x1c5f0_24 \<sigma> \<equiv> RIP \<sigma> = 0x1c5f0 \<and> RAX \<sigma> = qemu_memalign_0x1c584_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c589\<close>
declare Q_0x1c5f0_24_def[Qs]

schematic_goal raw_open_0_1_0x1c590_0x1c590_24[blocks]:
  assumes \<open>(P_0x1c590_true_24 && P_0x1c590_true_24_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c590 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c5f0_24 ?\<sigma> \<and> block_usage P_0x1c590_true_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c590_true_24_def P_0x1c590_true_24_regions_def post: Q_0x1c5f0_24_def regionset: P_0x1c590_true_24_regions_set_def)

definition P_0x1c5f0_25 :: state_pred where
  \<open>P_0x1c5f0_25 \<sigma> \<equiv> RIP \<sigma> = 0x1c5f0 \<and> RAX \<sigma> = qemu_memalign_0x1c584_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c589\<close>
declare P_0x1c5f0_25_def[Ps]

definition P_0x1c5f0_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c5f0_25_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c5f0_25_regions :: state_pred where
  \<open>P_0x1c5f0_25_regions \<sigma> \<equiv> \<exists>regions. P_0x1c5f0_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x1c5f0_25 :: state_pred where
  \<open>Q_errno_location_addr_0x1c5f0_25 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = qemu_memalign_0x1c584_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5f5\<close>
declare Q_errno_location_addr_0x1c5f0_25_def[Qs]

schematic_goal raw_open_0_1_0x1c5f0_0x1c5f0_25[blocks]:
  assumes \<open>(P_0x1c5f0_25 && P_0x1c5f0_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c5f0 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x1c5f0_25 ?\<sigma> \<and> block_usage P_0x1c5f0_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c5f0_25_def P_0x1c5f0_25_regions_def post: Q_errno_location_addr_0x1c5f0_25_def regionset: P_0x1c5f0_25_regions_set_def)

definition P_0x1c5f5_26 :: state_pred where
  \<open>P_0x1c5f5_26 \<sigma> \<equiv> RIP \<sigma> = 0x1c5f5 \<and> RAX \<sigma> = errno_location_0x1c5f0_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5f5\<close>
declare P_0x1c5f5_26_def[Ps]

definition P_0x1c5f5_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c5f5_26_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, errno_location_0x1c5f0_retval, 4)
  }\<close>

definition P_0x1c5f5_26_regions :: state_pred where
  \<open>P_0x1c5f5_26_regions \<sigma> \<equiv> \<exists>regions. P_0x1c5f5_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c5fb_26 :: state_pred where
  \<open>Q_0x1c5fb_26 \<sigma> \<equiv> RIP \<sigma> = 0x1c5fb \<and> RAX \<sigma> = errno_location_0x1c5f0_retval \<and> RBX \<sigma> = ucast ((- (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5f5 \<and> (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word) = ucast ((\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))\<close>
declare Q_0x1c5fb_26_def[Qs]

schematic_goal raw_open_0_3_0x1c5f5_0x1c5f9_26[blocks]:
  assumes \<open>(P_0x1c5f5_26 && P_0x1c5f5_26_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1c5f9 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c5fb_26 ?\<sigma> \<and> block_usage P_0x1c5f5_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c5f5_26_def P_0x1c5f5_26_regions_def post: Q_0x1c5fb_26_def regionset: P_0x1c5f5_26_regions_set_def)

definition P_0x1c5fb_27 :: state_pred where
  \<open>P_0x1c5fb_27 \<sigma> \<equiv> RIP \<sigma> = 0x1c5fb \<and> RAX \<sigma> = errno_location_0x1c5f0_retval \<and> RBX \<sigma> = ucast ((- (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c5f5 \<and> (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word) = ucast ((\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))\<close>
declare P_0x1c5fb_27_def[Ps]

definition P_0x1c5fb_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c5fb_27_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, errno_location_0x1c5f0_retval, 4)
  }\<close>

definition P_0x1c5fb_27_regions :: state_pred where
  \<open>P_0x1c5fb_27_regions \<sigma> \<equiv> \<exists>regions. P_0x1c5fb_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x1c5fb_27 :: state_pred where
  \<open>Q_close_addr_0x1c5fb_27 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = errno_location_0x1c5f0_retval \<and> RBX \<sigma> = ucast ((- (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> RSI \<sigma> = 0x4000 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c600 \<and> (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word) = ucast ((\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))\<close>
declare Q_close_addr_0x1c5fb_27_def[Qs]

schematic_goal raw_open_0_1_0x1c5fb_0x1c5fb_27[blocks]:
  assumes \<open>(P_0x1c5fb_27 && P_0x1c5fb_27_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c5fb 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x1c5fb_27 ?\<sigma> \<and> block_usage P_0x1c5fb_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c5fb_27_def P_0x1c5fb_27_regions_def post: Q_close_addr_0x1c5fb_27_def regionset: P_0x1c5fb_27_regions_set_def)

definition P_0x1c600_28 :: state_pred where
  \<open>P_0x1c600_28 \<sigma> \<equiv> RIP \<sigma> = 0x1c600 \<and> RAX \<sigma> = close_0x1c5fb_retval \<and> RBX \<sigma> = ucast ((- (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c600 \<and> (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word) = ucast ((\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))\<close>
declare P_0x1c600_28_def[Ps]

definition P_0x1c600_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c600_28_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, errno_location_0x1c5f0_retval, 4)
  }\<close>

definition P_0x1c600_28_regions :: state_pred where
  \<open>P_0x1c600_28_regions \<sigma> \<equiv> \<exists>regions. P_0x1c600_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c560_28 :: state_pred where
  \<open>Q_0x1c560_28 \<sigma> \<equiv> RIP \<sigma> = 0x1c560 \<and> RAX \<sigma> = close_0x1c5fb_retval \<and> RBX \<sigma> = ucast ((- (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c600 \<and> (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word) = ucast ((\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))\<close>
declare Q_0x1c560_28_def[Qs]

schematic_goal raw_open_0_1_0x1c600_0x1c600_28[blocks]:
  assumes \<open>(P_0x1c600_28 && P_0x1c600_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c600 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c560_28 ?\<sigma> \<and> block_usage P_0x1c600_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c600_28_def P_0x1c600_28_regions_def post: Q_0x1c560_28_def regionset: P_0x1c600_28_regions_set_def)

definition P_0x1c560_29 :: state_pred where
  \<open>P_0x1c560_29 \<sigma> \<equiv> RIP \<sigma> = 0x1c560 \<and> RAX \<sigma> = close_0x1c5fb_retval \<and> RBX \<sigma> = ucast ((- (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c600 \<and> (\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word) = ucast ((\<sigma> \<turnstile> *[errno_location_0x1c5f0_retval,4]::32 word))\<close>
declare P_0x1c560_29_def[Ps]

definition P_0x1c560_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c560_29_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, errno_location_0x1c5f0_retval, 4)
  }\<close>

definition P_0x1c560_29_regions :: state_pred where
  \<open>P_0x1c560_29_regions \<sigma> \<equiv> \<exists>regions. P_0x1c560_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_29 :: state_pred where
  \<open>Q_ret_address_29 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_29_def[Qs]

schematic_goal raw_open_0_7_0x1c560_0x1c56c_29[blocks]:
  assumes \<open>(P_0x1c560_29 && P_0x1c560_29_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c56c 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_29 ?\<sigma> \<and> block_usage P_0x1c560_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c560_29_def P_0x1c560_29_regions_def post: Q_ret_address_29_def regionset: P_0x1c560_29_regions_set_def)

definition P_0x1c590_false_30 :: state_pred where
  \<open>P_0x1c590_false_30 \<sigma> \<equiv> RIP \<sigma> = 0x1c590 \<and> RAX \<sigma> = qemu_memalign_0x1c584_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c589\<close>
declare P_0x1c590_false_30_def[Ps]

definition P_0x1c590_false_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c590_false_30_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c590_false_30_regions :: state_pred where
  \<open>P_0x1c590_false_30_regions \<sigma> \<equiv> \<exists>regions. P_0x1c590_false_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c594_30 :: state_pred where
  \<open>Q_0x1c594_30 \<sigma> \<equiv> RIP \<sigma> = 0x1c594 \<and> RAX \<sigma> = qemu_memalign_0x1c584_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c589\<close>
declare Q_0x1c594_30_def[Qs]

schematic_goal raw_open_0_2_0x1c590_0x1c592_30[blocks]:
  assumes \<open>(P_0x1c590_false_30 && P_0x1c590_false_30_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c592 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c594_30 ?\<sigma> \<and> block_usage P_0x1c590_false_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c590_false_30_def P_0x1c590_false_30_regions_def post: Q_0x1c594_30_def regionset: P_0x1c590_false_30_regions_set_def)

definition P_0x1c594_31 :: state_pred where
  \<open>P_0x1c594_31 \<sigma> \<equiv> RIP \<sigma> = 0x1c594 \<and> RAX \<sigma> = qemu_memalign_0x1c584_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = 0x200 \<and> RSI \<sigma> = 0x4000 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = qemu_memalign_0x1c584_retval \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c589\<close>
declare P_0x1c594_31_def[Ps]

definition P_0x1c594_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c594_31_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c594_31_regions :: state_pred where
  \<open>P_0x1c594_31_regions \<sigma> \<equiv> \<exists>regions. P_0x1c594_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_31 :: state_pred where
  \<open>Q_ret_address_31 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_31_def[Qs]

schematic_goal raw_open_0_7_0x1c594_0x1c5a0_31[blocks]:
  assumes \<open>(P_0x1c594_31 && P_0x1c594_31_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c5a0 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_31 ?\<sigma> \<and> block_usage P_0x1c594_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c594_31_def P_0x1c594_31_regions_def post: Q_ret_address_31_def regionset: P_0x1c594_31_regions_set_def)

definition P_0x1c548_false_32 :: state_pred where
  \<open>P_0x1c548_false_32 \<sigma> \<equiv> RIP \<sigma> = 0x1c548 \<and> RAX \<sigma> = open64_0x1c53f_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c544\<close>
declare P_0x1c548_false_32_def[Ps]

definition P_0x1c548_false_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c548_false_32_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c548_false_32_regions :: state_pred where
  \<open>P_0x1c548_false_32_regions \<sigma> \<equiv> \<exists>regions. P_0x1c548_false_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c54a_32 :: state_pred where
  \<open>Q_0x1c54a_32 \<sigma> \<equiv> RIP \<sigma> = 0x1c54a \<and> RAX \<sigma> = open64_0x1c53f_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c544\<close>
declare Q_0x1c54a_32_def[Qs]

schematic_goal raw_open_0_1_0x1c548_0x1c548_32[blocks]:
  assumes \<open>(P_0x1c548_false_32 && P_0x1c548_false_32_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c548 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c54a_32 ?\<sigma> \<and> block_usage P_0x1c548_false_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c548_false_32_def P_0x1c548_false_32_regions_def post: Q_0x1c54a_32_def regionset: P_0x1c548_false_32_regions_set_def)

definition P_0x1c54a_33 :: state_pred where
  \<open>P_0x1c54a_33 \<sigma> \<equiv> RIP \<sigma> = 0x1c54a \<and> RAX \<sigma> = open64_0x1c53f_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c544\<close>
declare P_0x1c54a_33_def[Ps]

definition P_0x1c54a_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c54a_33_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1c54a_33_regions :: state_pred where
  \<open>P_0x1c54a_33_regions \<sigma> \<equiv> \<exists>regions. P_0x1c54a_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x1c54a_33 :: state_pred where
  \<open>Q_errno_location_addr_0x1c54a_33 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = open64_0x1c53f_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c54f\<close>
declare Q_errno_location_addr_0x1c54a_33_def[Qs]

schematic_goal raw_open_0_1_0x1c54a_0x1c54a_33[blocks]:
  assumes \<open>(P_0x1c54a_33 && P_0x1c54a_33_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c54a 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x1c54a_33 ?\<sigma> \<and> block_usage P_0x1c54a_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c54a_33_def P_0x1c54a_33_regions_def post: Q_errno_location_addr_0x1c54a_33_def regionset: P_0x1c54a_33_regions_set_def)

definition P_0x1c54f_34 :: state_pred where
  \<open>P_0x1c54f_34 \<sigma> \<equiv> RIP \<sigma> = 0x1c54f \<and> RAX \<sigma> = errno_location_0x1c54a_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c54f\<close>
declare P_0x1c54f_34_def[Ps]

definition P_0x1c54f_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c54f_34_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, errno_location_0x1c54a_retval, 4)
  }\<close>

definition P_0x1c54f_34_regions :: state_pred where
  \<open>P_0x1c54f_34_regions \<sigma> \<equiv> \<exists>regions. P_0x1c54f_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c560_34 :: state_pred where
  \<open>Q_0x1c560_34 \<sigma> \<equiv> RIP \<sigma> = 0x1c560 \<and> RAX \<sigma> = 0xfffffff3 \<and> RBX \<sigma> = ucast ((if' ((\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word)::32 word) = 0x1e then 0xfffffff3 else ((- (\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word))::32 word))) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c54f \<and> (\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word) = ucast ((\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word))\<close>
declare Q_0x1c560_34_def[Qs]

schematic_goal raw_open_0_6_0x1c54f_0x1c55d_34[blocks]:
  assumes \<open>(P_0x1c54f_34 && P_0x1c54f_34_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x1c55d 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c560_34 ?\<sigma> \<and> block_usage P_0x1c54f_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c54f_34_def P_0x1c54f_34_regions_def post: Q_0x1c560_34_def regionset: P_0x1c54f_34_regions_set_def)

definition P_0x1c560_35 :: state_pred where
  \<open>P_0x1c560_35 \<sigma> \<equiv> RIP \<sigma> = 0x1c560 \<and> RAX \<sigma> = 0xfffffff3 \<and> RBX \<sigma> = ucast ((if' ((\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word)::32 word) = 0x1e then 0xfffffff3 else ((- (\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word))::32 word))) \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0x1c53f_retval::32 word)) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1c54f \<and> (\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word) = ucast ((\<sigma> \<turnstile> *[errno_location_0x1c54a_retval,4]::32 word))\<close>
declare P_0x1c560_35_def[Ps]

definition P_0x1c560_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c560_35_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, errno_location_0x1c54a_retval, 4)
  }\<close>

definition P_0x1c560_35_regions :: state_pred where
  \<open>P_0x1c560_35_regions \<sigma> \<equiv> \<exists>regions. P_0x1c560_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_35 :: state_pred where
  \<open>Q_ret_address_35 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x4),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_35_def[Qs]

schematic_goal raw_open_0_7_0x1c560_0x1c56c_35[blocks]:
  assumes \<open>(P_0x1c560_35 && P_0x1c560_35_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c56c 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_35 ?\<sigma> \<and> block_usage P_0x1c560_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c560_35_def P_0x1c560_35_regions_def post: Q_ret_address_35_def regionset: P_0x1c560_35_regions_set_def)

definition raw_open_acode :: ACode where
  \<open>raw_open_acode =
    Block 10 0x1c4ea 0;
    IF ZF THEN
      Block (Suc 0) 0x1c4ee (Suc 0);
      Block (Suc 0) 0x1c5e0 2;
      CALL posix_aio_init_part_8_acode;
      Block (Suc 0) 0x1c5e5 3
    ELSE
      Block (Suc 0) 0x1c4ee 4
    FI;
    Block 4 0x1c500 5;
    IF ZF THEN
      Block (Suc 0) 0x1c503 6
    ELSE
      Block 3 0x1c50e 7
    FI;
    Block 5 0x1c51e 8;
    IF ZF THEN
      Block 9 0x1c5c2 9;
      Block (Suc 0) 0x1c5c4 10;
      CALL open64_acode;
      Block (Suc 0) 0x1c5c9 11;
      IF SF THEN
        Block (Suc 0) 0x1c5cb 12;
        Block (Suc 0) 0x1c54a 13;
        CALL errno_location_acode;
        Block 6 0x1c55d 14;
        Block 7 0x1c56c 15
      ELSE
        Block 5 0x1c5dd 16;
        Block 7 0x1c5a0 17
      FI
    ELSE
      Block 6 0x1c53c 18;
      Block (Suc 0) 0x1c53f 19;
      CALL open64_acode;
      Block 2 0x1c546 20;
      IF !SF THEN
        Block 5 0x1c57c 21;
        Block (Suc 0) 0x1c584 22;
        CALL qemu_memalign_acode;
        Block 2 0x1c58d 23;
        IF ZF THEN
          Block (Suc 0) 0x1c590 24;
          Block (Suc 0) 0x1c5f0 25;
          CALL errno_location_acode;
          Block 3 0x1c5f9 26;
          Block (Suc 0) 0x1c5fb 27;
          CALL close_acode;
          Block (Suc 0) 0x1c600 28;
          Block 7 0x1c56c 29
        ELSE
          Block 2 0x1c592 30;
          Block 7 0x1c5a0 31
        FI
      ELSE
        Block (Suc 0) 0x1c548 32;
        Block (Suc 0) 0x1c54a 33;
        CALL errno_location_acode;
        Block 6 0x1c55d 34;
        Block 7 0x1c56c 35
      FI
    FI
  \<close>

schematic_goal "raw_open":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c4ee \<longrightarrow> P_0x1c4ee_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c5e0 \<longrightarrow> P_0x1c5e0_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c5e5 \<longrightarrow> P_0x1c5e5_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c4ee \<longrightarrow> P_0x1c4ee_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c4f4 \<longrightarrow> P_0x1c4f4_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c503 \<longrightarrow> P_0x1c503_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c503 \<longrightarrow> P_0x1c503_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c510 \<longrightarrow> P_0x1c510_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c522 \<longrightarrow> P_0x1c522_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c5c4 \<longrightarrow> P_0x1c5c4_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c5c9 \<longrightarrow> P_0x1c5c9_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c5cb \<longrightarrow> P_0x1c5cb_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c54a \<longrightarrow> P_0x1c54a_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c54f \<longrightarrow> P_0x1c54f_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c560 \<longrightarrow> P_0x1c560_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c5cb \<longrightarrow> P_0x1c5cb_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c594 \<longrightarrow> P_0x1c594_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c522 \<longrightarrow> P_0x1c522_false_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c53f \<longrightarrow> P_0x1c53f_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c544 \<longrightarrow> P_0x1c544_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c548 \<longrightarrow> P_0x1c548_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c584 \<longrightarrow> P_0x1c584_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c589 \<longrightarrow> P_0x1c589_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c590 \<longrightarrow> P_0x1c590_true_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c5f0 \<longrightarrow> P_0x1c5f0_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c5f5 \<longrightarrow> P_0x1c5f5_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c5fb \<longrightarrow> P_0x1c5fb_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c600 \<longrightarrow> P_0x1c600_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c560 \<longrightarrow> P_0x1c560_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c590 \<longrightarrow> P_0x1c590_false_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c594 \<longrightarrow> P_0x1c594_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c548 \<longrightarrow> P_0x1c548_false_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c54a \<longrightarrow> P_0x1c54a_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c54f \<longrightarrow> P_0x1c54f_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c560 \<longrightarrow> P_0x1c560_35_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_posix_aio_init_part_8_addr_0x1c5e0_2}} \<box>posix_aio_init_part_8_acode {{P_0x1c5e5_3;M_0x1c5e0}}\<close>
    and [blocks]: \<open>{{Q_open64_addr_0x1c5c4_10}} \<box>open64_acode {{P_0x1c5c9_11;M_0x1c5c4}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x1c54a_13}} \<box>errno_location_acode {{P_0x1c54f_14;M_0x1c54a}}\<close>
    and [blocks]: \<open>{{Q_open64_addr_0x1c53f_19}} \<box>open64_acode {{P_0x1c544_20;M_0x1c53f}}\<close>
    and [blocks]: \<open>{{Q_qemu_memalign_addr_0x1c584_22}} \<box>qemu_memalign_acode {{P_0x1c589_23;M_0x1c584}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x1c5f0_25}} \<box>errno_location_acode {{P_0x1c5f5_26;M_0x1c5f0}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x1c5fb_27}} \<box>close_acode {{P_0x1c600_28;M_0x1c5fb}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x1c54a_33}} \<box>errno_location_acode {{P_0x1c54f_34;M_0x1c54a}}\<close>
  shows \<open>{{?P}} raw_open_acode {{?Q;?M}}\<close>
  by (vcg acode: raw_open_acode_def assms: assms)

end
