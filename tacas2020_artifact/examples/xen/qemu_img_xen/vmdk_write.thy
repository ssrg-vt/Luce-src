theory vmdk_write
  imports
    "../../../isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes get_cluster_offset_0x9525_retval\<^sub>v bdrv_pwrite_0x9552_retval\<^sub>v bdrv_pwrite_0x9597_retval\<^sub>v bdrv_pwrite_0x95d9_retval\<^sub>v time_0x961a_retval\<^sub>v vmdk_write_cid_isra_7_0x962a_retval\<^sub>v fprintf_chk_0x965a_retval\<^sub>v stack_chk_fail_0x9666_retval\<^sub>v fprintf_chk_addr stack_chk_fail_addr bdrv_pwrite_addr get_cluster_offset_addr time_addr vmdk_write_cid_isra_7_addr :: \<open>64 word\<close>
    and fprintf_chk_acode stack_chk_fail_acode bdrv_pwrite_acode get_cluster_offset_acode time_acode vmdk_write_cid_isra_7_acode :: ACode
  assumes fetch:
    "fetch 0x9480 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x9482 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x9484 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x9486 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x9488 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x948b \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x948c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x948e \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x948f \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 72)), 4)"
    "fetch 0x9493 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0x9496 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x949a \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rdi))), 5)"
    "fetch 0x949f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x94a8 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour rcx))), 5)"
    "fetch 0x94ad \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x94af \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x94b2 \<equiv> (Unary (IS_8088 Jl) (Immediate SixtyFour (ImmVal 38466)), 6)"
    "fetch 0x94b8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))), 5)"
    "fetch 0x94bd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x94c0 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x94c5 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x94c7 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 38132)), 2)"
    "fetch 0x94c9 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 38462)), 5)"
    "fetch 0x94ce \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x94d0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 134794))))), 6)"
    "fetch 0x94d6 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x94d8 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r9)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x94db \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rbx)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x94de \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x94e1 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x94e4 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x94e6 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 38424)), 6)"
    "fetch 0x94ec \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x94ee \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 38462)), 6)"
    "fetch 0x94f4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r14)) (A_WordConstant 192))))), 7)"
    "fetch 0x94fb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x94fe \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x9503 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x9508 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x950d \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo r8)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1)))), 4)"
    "fetch 0x9511 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x9514 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x9517 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo r8))), 5)"
    "fetch 0x951c \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x951e \<equiv> (Binary (IS_PentiumPro Cmovg) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbp))), 3)"
    "fetch 0x9521 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x9525 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''get_cluster_offset'')), 5)"
    "fetch 0x952a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x952f \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x9532 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 38384)), 6)"
    "fetch 0x9538 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo r8)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x953c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x953f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r14))))), 3)"
    "fetch 0x9542 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x9545 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x9549 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rsi)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x954c \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x954f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x9552 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_pwrite'')), 5)"
    "fetch 0x9557 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x955a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 38384)), 6)"
    "fetch 0x9560 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48))))), 4)"
    "fetch 0x9564 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x9566 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 38096)), 6)"
    "fetch 0x956c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x9571 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40))))), 4)"
    "fetch 0x9575 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 4)), 5)"
    "fetch 0x957a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 64))))), 4)"
    "fetch 0x957e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 44))))), 4)"
    "fetch 0x9582 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x9586 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r8))))), 3)"
    "fetch 0x9589 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour r8))), 5)"
    "fetch 0x958e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rdx)))))), 4)"
    "fetch 0x9592 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x9597 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_pwrite'')), 5)"
    "fetch 0x959c \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4)), 3)"
    "fetch 0x959f \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 38384)), 2)"
    "fetch 0x95a1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x95a6 \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r8)) (A_WordConstant 16)))) (Immediate SixtyFour (ImmVal 0)), 5)"
    "fetch 0x95ab \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 38096)), 6)"
    "fetch 0x95b1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 36))))), 4)"
    "fetch 0x95b5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r8)) (A_WordConstant 32))))), 4)"
    "fetch 0x95b9 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 4)), 5)"
    "fetch 0x95be \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 3)"
    "fetch 0x95c1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40))))), 4)"
    "fetch 0x95c5 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 44)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0x95c9 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x95cd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r8))))), 3)"
    "fetch 0x95d0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rdx)))))), 4)"
    "fetch 0x95d4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x95d9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_pwrite'')), 5)"
    "fetch 0x95de \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4)), 3)"
    "fetch 0x95e1 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 38096)), 6)"
    "fetch 0x95e7 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 9)"
    "fetch 0x95f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x95f5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56))))), 5)"
    "fetch 0x95fa \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x9603 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 38502)), 2)"
    "fetch 0x9605 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 72)), 4)"
    "fetch 0x9609 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x960a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x960b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x960d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x960f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x9611 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x9613 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x9614 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x9618 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x961a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''time'')), 5)"
    "fetch 0x961f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x9624 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x9626 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 64))))), 4)"
    "fetch 0x962a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''vmdk_write_cid.isra.7'')), 5)"
    "fetch 0x962f \<equiv> (Binary (IS_8088 Add) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 134442)))) (Immediate SixtyFour (ImmVal 1)), 7)"
    "fetch 0x9636 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x9638 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 38132)), 6)"
    "fetch 0x963e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x9640 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 38389)), 2)"
    "fetch 0x9642 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 134327))))), 7)"
    "fetch 0x9649 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x964c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 94589)))), 7)"
    "fetch 0x9653 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x9655 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x965a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x965f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x9664 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 38389)), 2)"
    "fetch 0x9666 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and fprintf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__fprintf_chk'') = fprintf_chk_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and bdrv_pwrite\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_pwrite'') = bdrv_pwrite_addr\<close>
    and get_cluster_offset\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''get_cluster_offset'') = get_cluster_offset_addr\<close>
    and time\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''time'') = time_addr\<close>
    and vmdk_write_cid_isra_7\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''vmdk_write_cid.isra.7'') = vmdk_write_cid_isra_7_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>get_cluster_offset_0x9525_retval \<equiv> get_cluster_offset_0x9525_retval\<^sub>v\<close>
definition \<open>bdrv_pwrite_0x9552_retval \<equiv> bdrv_pwrite_0x9552_retval\<^sub>v\<close>
definition \<open>bdrv_pwrite_0x9597_retval \<equiv> bdrv_pwrite_0x9597_retval\<^sub>v\<close>
definition \<open>bdrv_pwrite_0x95d9_retval \<equiv> bdrv_pwrite_0x95d9_retval\<^sub>v\<close>
definition \<open>time_0x961a_retval \<equiv> time_0x961a_retval\<^sub>v\<close>
definition \<open>vmdk_write_cid_isra_7_0x962a_retval \<equiv> vmdk_write_cid_isra_7_0x962a_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x965a_retval \<equiv> fprintf_chk_0x965a_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x9666_retval \<equiv> stack_chk_fail_0x9666_retval\<^sub>v\<close>

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

locale "vmdk_write" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x9480_0 :: state_pred where
  \<open>P_0x9480_0 \<sigma> \<equiv> RIP \<sigma> = 0x9480 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x9480_0_def[Ps]

definition P_0x9480_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9480_0_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x9480_0_regions :: state_pred where
  \<open>P_0x9480_0_regions \<sigma> \<equiv> \<exists>regions. P_0x9480_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94b2_0 :: state_pred where
  \<open>Q_0x94b2_0 \<sigma> \<equiv> RIP \<sigma> = 0x94b2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94b2_0_def[Qs]

schematic_goal vmdk_write_0_16_0x9480_0x94af_0[blocks]:
  assumes \<open>(P_0x9480_0 && P_0x9480_0_regions) \<sigma>\<close>
  shows \<open>exec_block 16 0x94af 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94b2_0 ?\<sigma> \<and> block_usage P_0x9480_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9480_0_def P_0x9480_0_regions_def post: Q_0x94b2_0_def regionset: P_0x9480_0_regions_set_def)

definition P_0x94b2_true_1 :: state_pred where
  \<open>P_0x94b2_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x94b2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94b2_true_1_def[Ps]

definition P_0x94b2_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94b2_true_1_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x94b2_true_1_regions :: state_pred where
  \<open>P_0x94b2_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x94b2_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x965a_1 :: state_pred where
  \<open>Q_0x965a_1 \<sigma> \<equiv> RIP \<sigma> = 0x965a \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = 0x207d0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x965a_1_def[Qs]

schematic_goal vmdk_write_0_6_0x94b2_0x9655_1[blocks]:
  assumes \<open>(P_0x94b2_true_1 && P_0x94b2_true_1_regions && jl) \<sigma>\<close>
  shows \<open>exec_block 6 0x9655 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x965a_1 ?\<sigma> \<and> block_usage P_0x94b2_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94b2_true_1_def P_0x94b2_true_1_regions_def post: Q_0x965a_1_def regionset: P_0x94b2_true_1_regions_set_def)

definition P_0x965a_2 :: state_pred where
  \<open>P_0x965a_2 \<sigma> \<equiv> RIP \<sigma> = 0x965a \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = 0x207d0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x965a_2_def[Ps]

definition P_0x965a_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x965a_2_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x965a_2_regions :: state_pred where
  \<open>P_0x965a_2_regions \<sigma> \<equiv> \<exists>regions. P_0x965a_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x965a_2 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x965a_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = 0x207d0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x965f\<close>
declare Q_fprintf_chk_addr_0x965a_2_def[Qs]

schematic_goal vmdk_write_0_1_0x965a_0x965a_2[blocks]:
  assumes \<open>(P_0x965a_2 && P_0x965a_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x965a 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x965a_2 ?\<sigma> \<and> block_usage P_0x965a_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x965a_2_def P_0x965a_2_regions_def post: Q_fprintf_chk_addr_0x965a_2_def regionset: P_0x965a_2_regions_set_def)

definition P_0x965f_3 :: state_pred where
  \<open>P_0x965f_3 \<sigma> \<equiv> RIP \<sigma> = 0x965f \<and> RAX \<sigma> = fprintf_chk_0x965a_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = 0x207d0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x965f\<close>
declare P_0x965f_3_def[Ps]

definition P_0x965f_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x965f_3_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x965f_3_regions :: state_pred where
  \<open>P_0x965f_3_regions \<sigma> \<equiv> \<exists>regions. P_0x965f_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95f5_3 :: state_pred where
  \<open>Q_0x95f5_3 \<sigma> \<equiv> RIP \<sigma> = 0x95f5 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x95f5_3_def[Qs]

schematic_goal vmdk_write_0_2_0x965f_0x9664_3[blocks]:
  assumes \<open>(P_0x965f_3 && P_0x965f_3_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x9664 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95f5_3 ?\<sigma> \<and> block_usage P_0x965f_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x965f_3_def P_0x965f_3_regions_def post: Q_0x95f5_3_def regionset: P_0x965f_3_regions_set_def)

definition P_0x94b2_false_4 :: state_pred where
  \<open>P_0x94b2_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x94b2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94b2_false_4_def[Ps]

definition P_0x94b2_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94b2_false_4_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x94b2_false_4_regions :: state_pred where
  \<open>P_0x94b2_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x94b2_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94c7_4 :: state_pred where
  \<open>Q_0x94c7_4 \<sigma> \<equiv> RIP \<sigma> = 0x94c7 \<and> RAX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94c7_4_def[Qs]

schematic_goal vmdk_write_0_5_0x94b2_0x94c5_4[blocks]:
  assumes \<open>(P_0x94b2_false_4 && P_0x94b2_false_4_regions && ! jl) \<sigma>\<close>
  shows \<open>exec_block 5 0x94c5 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94c7_4 ?\<sigma> \<and> block_usage P_0x94b2_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94b2_false_4_def P_0x94b2_false_4_regions_def post: Q_0x94c7_4_def regionset: P_0x94b2_false_4_regions_set_def)

definition P_0x94c7_true_5 :: state_pred where
  \<open>P_0x94c7_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x94c7 \<and> RAX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94c7_true_5_def[Ps]

definition P_0x94c7_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94c7_true_5_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x94c7_true_5_regions :: state_pred where
  \<open>P_0x94c7_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x94c7_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94f4_5 :: state_pred where
  \<open>Q_0x94f4_5 \<sigma> \<equiv> RIP \<sigma> = 0x94f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94f4_5_def[Qs]

schematic_goal vmdk_write_0_1_0x94c7_0x94c7_5[blocks]:
  assumes \<open>(P_0x94c7_true_5 && P_0x94c7_true_5_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x94c7 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94f4_5 ?\<sigma> \<and> block_usage P_0x94c7_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94c7_true_5_def P_0x94c7_true_5_regions_def post: Q_0x94f4_5_def regionset: P_0x94c7_true_5_regions_set_def)

definition P_0x94f4_6 :: state_pred where
  \<open>P_0x94f4_6 \<sigma> \<equiv> RIP \<sigma> = 0x94f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94f4_6_def[Ps]

definition P_0x94f4_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94f4_6_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 4)
  }\<close>

definition P_0x94f4_6_regions :: state_pred where
  \<open>P_0x94f4_6_regions \<sigma> \<equiv> \<exists>regions. P_0x94f4_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x9525_6 :: state_pred where
  \<open>Q_0x9525_6 \<sigma> \<equiv> RIP \<sigma> = 0x9525 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((ucast ((R12 \<sigma>::64 word))::64 word) << 9) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))\<close>
declare Q_0x9525_6_def[Qs]

schematic_goal vmdk_write_0_12_0x94f4_0x9521_6[blocks]:
  assumes \<open>(P_0x94f4_6 && P_0x94f4_6_regions) \<sigma>\<close>
  shows \<open>exec_block 12 0x9521 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9525_6 ?\<sigma> \<and> block_usage P_0x94f4_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94f4_6_def P_0x94f4_6_regions_def post: Q_0x9525_6_def regionset: P_0x94f4_6_regions_set_def)

definition P_0x9525_7 :: state_pred where
  \<open>P_0x9525_7 \<sigma> \<equiv> RIP \<sigma> = 0x9525 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((ucast ((R12 \<sigma>::64 word))::64 word) << 9) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))\<close>
declare P_0x9525_7_def[Ps]

definition P_0x9525_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9525_7_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x9525_7_regions :: state_pred where
  \<open>P_0x9525_7_regions \<sigma> \<equiv> \<exists>regions. P_0x9525_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_cluster_offset_addr_0x9525_7 :: state_pred where
  \<open>Q_get_cluster_offset_addr_0x9525_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = get_cluster_offset_addr \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((ucast ((R12 \<sigma>::64 word))::64 word) << 9) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x952a\<close>
declare Q_get_cluster_offset_addr_0x9525_7_def[Qs]

schematic_goal vmdk_write_0_1_0x9525_0x9525_7[blocks]:
  assumes \<open>(P_0x9525_7 && P_0x9525_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9525 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_cluster_offset_addr_0x9525_7 ?\<sigma> \<and> block_usage P_0x9525_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9525_7_def P_0x9525_7_regions_def post: Q_get_cluster_offset_addr_0x9525_7_def regionset: P_0x9525_7_regions_set_def)

definition P_0x952a_8 :: state_pred where
  \<open>P_0x952a_8 \<sigma> \<equiv> RIP \<sigma> = 0x952a \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((ucast ((R12 \<sigma>::64 word))::64 word) << 9) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x952a\<close>
declare P_0x952a_8_def[Ps]

definition P_0x952a_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x952a_8_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x952a_8_regions :: state_pred where
  \<open>P_0x952a_8_regions \<sigma> \<equiv> \<exists>regions. P_0x952a_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x9532_8 :: state_pred where
  \<open>Q_0x9532_8 \<sigma> \<equiv> RIP \<sigma> = 0x9532 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((ucast ((R12 \<sigma>::64 word))::64 word) << 9) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x952a\<close>
declare Q_0x9532_8_def[Qs]

schematic_goal vmdk_write_0_2_0x952a_0x952f_8[blocks]:
  assumes \<open>(P_0x952a_8 && P_0x952a_8_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x952f 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9532_8 ?\<sigma> \<and> block_usage P_0x952a_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x952a_8_def P_0x952a_8_regions_def post: Q_0x9532_8_def regionset: P_0x952a_8_regions_set_def)

definition P_0x9532_true_9 :: state_pred where
  \<open>P_0x9532_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x9532 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((ucast ((R12 \<sigma>::64 word))::64 word) << 9) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x952a\<close>
declare P_0x9532_true_9_def[Ps]

definition P_0x9532_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9532_true_9_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x9532_true_9_regions :: state_pred where
  \<open>P_0x9532_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x9532_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95f0_9 :: state_pred where
  \<open>Q_0x95f0_9 \<sigma> \<equiv> RIP \<sigma> = 0x95f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x95f0_9_def[Qs]

schematic_goal vmdk_write_0_1_0x9532_0x9532_9[blocks]:
  assumes \<open>(P_0x9532_true_9 && P_0x9532_true_9_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9532 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95f0_9 ?\<sigma> \<and> block_usage P_0x9532_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9532_true_9_def P_0x9532_true_9_regions_def post: Q_0x95f0_9_def regionset: P_0x9532_true_9_regions_set_def)

definition P_0x9532_false_10 :: state_pred where
  \<open>P_0x9532_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x9532 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((ucast ((R12 \<sigma>::64 word))::64 word) << 9) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x952a\<close>
declare P_0x9532_false_10_def[Ps]

definition P_0x9532_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9532_false_10_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x9532_false_10_regions :: state_pred where
  \<open>P_0x9532_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x9532_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x9552_10 :: state_pred where
  \<open>Q_0x9552_10 \<sigma> \<equiv> RIP \<sigma> = 0x9552 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = R13 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RAX \<sigma>) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x952a \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x9552_10_def[Qs]

schematic_goal vmdk_write_0_9_0x9532_0x954f_10[blocks]:
  assumes \<open>(P_0x9532_false_10 && P_0x9532_false_10_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x954f 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9552_10 ?\<sigma> \<and> block_usage P_0x9532_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9532_false_10_def P_0x9532_false_10_regions_def post: Q_0x9552_10_def regionset: P_0x9532_false_10_regions_set_def)

definition P_0x9552_11 :: state_pred where
  \<open>P_0x9552_11 \<sigma> \<equiv> RIP \<sigma> = 0x9552 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = R13 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = (((sextend (ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9))) 32 64::64 word)::64 word) + RAX \<sigma>) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x952a \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x9552_11_def[Ps]

definition P_0x9552_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9552_11_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x9552_11_regions :: state_pred where
  \<open>P_0x9552_11_regions \<sigma> \<equiv> \<exists>regions. P_0x9552_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_pwrite_addr_0x9552_11 :: state_pred where
  \<open>Q_bdrv_pwrite_addr_0x9552_11 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = bdrv_pwrite_addr \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = R13 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_bdrv_pwrite_addr_0x9552_11_def[Qs]

schematic_goal vmdk_write_0_1_0x9552_0x9552_11[blocks]:
  assumes \<open>(P_0x9552_11 && P_0x9552_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9552 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_pwrite_addr_0x9552_11 ?\<sigma> \<and> block_usage P_0x9552_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9552_11_def P_0x9552_11_regions_def post: Q_bdrv_pwrite_addr_0x9552_11_def regionset: P_0x9552_11_regions_set_def)

definition P_0x9557_12 :: state_pred where
  \<open>P_0x9557_12 \<sigma> \<equiv> RIP \<sigma> = 0x9557 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = R13 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x9557_12_def[Ps]

definition P_0x9557_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9557_12_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x9557_12_regions :: state_pred where
  \<open>P_0x9557_12_regions \<sigma> \<equiv> \<exists>regions. P_0x9557_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x955a_12 :: state_pred where
  \<open>Q_0x955a_12 \<sigma> \<equiv> RIP \<sigma> = 0x955a \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = R13 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x955a_12_def[Qs]

schematic_goal vmdk_write_0_1_0x9557_0x9557_12[blocks]:
  assumes \<open>(P_0x9557_12 && P_0x9557_12_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9557 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x955a_12 ?\<sigma> \<and> block_usage P_0x9557_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9557_12_def P_0x9557_12_regions_def post: Q_0x955a_12_def regionset: P_0x9557_12_regions_set_def)

definition P_0x955a_true_13 :: state_pred where
  \<open>P_0x955a_true_13 \<sigma> \<equiv> RIP \<sigma> = 0x955a \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = R13 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x955a_true_13_def[Ps]

definition P_0x955a_true_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x955a_true_13_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x955a_true_13_regions :: state_pred where
  \<open>P_0x955a_true_13_regions \<sigma> \<equiv> \<exists>regions. P_0x955a_true_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95f0_13 :: state_pred where
  \<open>Q_0x95f0_13 \<sigma> \<equiv> RIP \<sigma> = 0x95f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x95f0_13_def[Qs]

schematic_goal vmdk_write_0_1_0x955a_0x955a_13[blocks]:
  assumes \<open>(P_0x955a_true_13 && P_0x955a_true_13_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x955a 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95f0_13 ?\<sigma> \<and> block_usage P_0x955a_true_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x955a_true_13_def P_0x955a_true_13_regions_def post: Q_0x95f0_13_def regionset: P_0x955a_true_13_regions_set_def)

definition P_0x955a_false_14 :: state_pred where
  \<open>P_0x955a_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x955a \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = R13 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x955a_false_14_def[Ps]

definition P_0x955a_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x955a_false_14_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (17, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x955a_false_14_regions :: state_pred where
  \<open>P_0x955a_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x955a_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x9566_14 :: state_pred where
  \<open>Q_0x9566_14 \<sigma> \<equiv> RIP \<sigma> = 0x9566 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x9566_14_def[Qs]

schematic_goal vmdk_write_0_3_0x955a_0x9564_14[blocks]:
  assumes \<open>(P_0x955a_false_14 && P_0x955a_false_14_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x9564 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9566_14 ?\<sigma> \<and> block_usage P_0x955a_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x955a_false_14_def P_0x955a_false_14_regions_def post: Q_0x9566_14_def regionset: P_0x955a_false_14_regions_set_def)

definition P_0x9566_true_15 :: state_pred where
  \<open>P_0x9566_true_15 \<sigma> \<equiv> RIP \<sigma> = 0x9566 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x9566_true_15_def[Ps]

definition P_0x9566_true_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9566_true_15_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (18, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x9566_true_15_regions :: state_pred where
  \<open>P_0x9566_true_15_regions \<sigma> \<equiv> \<exists>regions. P_0x9566_true_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94e6_15 :: state_pred where
  \<open>Q_0x94e6_15 \<sigma> \<equiv> RIP \<sigma> = 0x94e6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x94e6_15_def[Qs]

schematic_goal vmdk_write_0_8_0x9566_0x94e4_15[blocks]:
  assumes \<open>(P_0x9566_true_15 && P_0x9566_true_15_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x94e4 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94e6_15 ?\<sigma> \<and> block_usage P_0x9566_true_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9566_true_15_def P_0x9566_true_15_regions_def post: Q_0x94e6_15_def regionset: P_0x9566_true_15_regions_set_def)

definition P_0x94e6_true_16 :: state_pred where
  \<open>P_0x94e6_true_16 \<sigma> \<equiv> RIP \<sigma> = 0x94e6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x94e6_true_16_def[Ps]

definition P_0x94e6_true_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94e6_true_16_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (17, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x94e6_true_16_regions :: state_pred where
  \<open>P_0x94e6_true_16_regions \<sigma> \<equiv> \<exists>regions. P_0x94e6_true_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x961a_16 :: state_pred where
  \<open>Q_0x961a_16 \<sigma> \<equiv> RIP \<sigma> = 0x961a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x961a_16_def[Qs]

schematic_goal vmdk_write_0_2_0x94e6_0x9618_16[blocks]:
  assumes \<open>(P_0x94e6_true_16 && P_0x94e6_true_16_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x9618 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x961a_16 ?\<sigma> \<and> block_usage P_0x94e6_true_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94e6_true_16_def P_0x94e6_true_16_regions_def post: Q_0x961a_16_def regionset: P_0x94e6_true_16_regions_set_def)

definition P_0x961a_17 :: state_pred where
  \<open>P_0x961a_17 \<sigma> \<equiv> RIP \<sigma> = 0x961a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x961a_17_def[Ps]

definition P_0x961a_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x961a_17_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (17, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x961a_17_regions :: state_pred where
  \<open>P_0x961a_17_regions \<sigma> \<equiv> \<exists>regions. P_0x961a_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_time_addr_0x961a_17 :: state_pred where
  \<open>Q_time_addr_0x961a_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = time_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = 0x0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_time_addr_0x961a_17_def[Qs]

schematic_goal vmdk_write_0_1_0x961a_0x961a_17[blocks]:
  assumes \<open>(P_0x961a_17 && P_0x961a_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x961a 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_time_addr_0x961a_17 ?\<sigma> \<and> block_usage P_0x961a_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x961a_17_def P_0x961a_17_regions_def post: Q_time_addr_0x961a_17_def regionset: P_0x961a_17_regions_set_def)

definition P_0x961f_18 :: state_pred where
  \<open>P_0x961f_18 \<sigma> \<equiv> RIP \<sigma> = 0x961f \<and> RAX \<sigma> = time_0x961a_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x961f_18_def[Ps]

definition P_0x961f_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x961f_18_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (17, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x961f_18_regions :: state_pred where
  \<open>P_0x961f_18_regions \<sigma> \<equiv> \<exists>regions. P_0x961f_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x962a_18 :: state_pred where
  \<open>Q_0x962a_18 \<sigma> \<equiv> RIP \<sigma> = 0x962a \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x962a_18_def[Qs]

schematic_goal vmdk_write_0_3_0x961f_0x9626_18[blocks]:
  assumes \<open>(P_0x961f_18 && P_0x961f_18_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x9626 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x962a_18 ?\<sigma> \<and> block_usage P_0x961f_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x961f_18_def P_0x961f_18_regions_def post: Q_0x962a_18_def regionset: P_0x961f_18_regions_set_def)

definition P_0x962a_19 :: state_pred where
  \<open>P_0x962a_19 \<sigma> \<equiv> RIP \<sigma> = 0x962a \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x962a_19_def[Ps]

definition P_0x962a_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x962a_19_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (17, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x962a_19_regions :: state_pred where
  \<open>P_0x962a_19_regions \<sigma> \<equiv> \<exists>regions. P_0x962a_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_vmdk_write_cid_isra_7_addr_0x962a_19 :: state_pred where
  \<open>Q_vmdk_write_cid_isra_7_addr_0x962a_19 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = vmdk_write_cid_isra_7_addr \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x962f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_vmdk_write_cid_isra_7_addr_0x962a_19_def[Qs]

schematic_goal vmdk_write_0_1_0x962a_0x962a_19[blocks]:
  assumes \<open>(P_0x962a_19 && P_0x962a_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x962a 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_vmdk_write_cid_isra_7_addr_0x962a_19 ?\<sigma> \<and> block_usage P_0x962a_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x962a_19_def P_0x962a_19_regions_def post: Q_vmdk_write_cid_isra_7_addr_0x962a_19_def regionset: P_0x962a_19_regions_set_def)

definition P_0x962f_20 :: state_pred where
  \<open>P_0x962f_20 \<sigma> \<equiv> RIP \<sigma> = 0x962f \<and> RAX \<sigma> = vmdk_write_cid_isra_7_0x962a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x962f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x962f_20_def[Ps]

definition P_0x962f_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x962f_20_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (17, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x962f_20_regions :: state_pred where
  \<open>P_0x962f_20_regions \<sigma> \<equiv> \<exists>regions. P_0x962f_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x9638_20 :: state_pred where
  \<open>Q_0x9638_20 \<sigma> \<equiv> RIP \<sigma> = 0x9638 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x9638_20_def[Qs]

schematic_goal vmdk_write_0_2_0x962f_0x9636_20[blocks]:
  assumes \<open>(P_0x962f_20 && P_0x962f_20_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x9636 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9638_20 ?\<sigma> \<and> block_usage P_0x962f_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x962f_20_def P_0x962f_20_regions_def post: Q_0x9638_20_def regionset: P_0x962f_20_regions_set_def)

definition P_0x9638_true_21 :: state_pred where
  \<open>P_0x9638_true_21 \<sigma> \<equiv> RIP \<sigma> = 0x9638 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x9638_true_21_def[Ps]

definition P_0x9638_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9638_true_21_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x9638_true_21_regions :: state_pred where
  \<open>P_0x9638_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0x9638_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94f4_21 :: state_pred where
  \<open>Q_0x94f4_21 \<sigma> \<equiv> RIP \<sigma> = 0x94f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94f4_21_def[Qs]

schematic_goal vmdk_write_0_1_0x9638_0x9638_21[blocks]:
  assumes \<open>(P_0x9638_true_21 && P_0x9638_true_21_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9638 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94f4_21 ?\<sigma> \<and> block_usage P_0x9638_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9638_true_21_def P_0x9638_true_21_regions_def post: Q_0x94f4_21_def regionset: P_0x9638_true_21_regions_set_def)

definition P_0x9638_false_22 :: state_pred where
  \<open>P_0x9638_false_22 \<sigma> \<equiv> RIP \<sigma> = 0x9638 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x9638_false_22_def[Ps]

definition P_0x9638_false_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9638_false_22_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x9638_false_22_regions :: state_pred where
  \<open>P_0x9638_false_22_regions \<sigma> \<equiv> \<exists>regions. P_0x9638_false_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x963e_22 :: state_pred where
  \<open>Q_0x963e_22 \<sigma> \<equiv> RIP \<sigma> = 0x963e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x963e_22_def[Qs]

schematic_goal vmdk_write_0_1_0x9638_0x9638_22[blocks]:
  assumes \<open>(P_0x9638_false_22 && P_0x9638_false_22_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9638 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x963e_22 ?\<sigma> \<and> block_usage P_0x9638_false_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9638_false_22_def P_0x9638_false_22_regions_def post: Q_0x963e_22_def regionset: P_0x9638_false_22_regions_set_def)

definition P_0x94e6_false_23 :: state_pred where
  \<open>P_0x94e6_false_23 \<sigma> \<equiv> RIP \<sigma> = 0x94e6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x94e6_false_23_def[Ps]

definition P_0x94e6_false_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94e6_false_23_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (17, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x94e6_false_23_regions :: state_pred where
  \<open>P_0x94e6_false_23_regions \<sigma> \<equiv> \<exists>regions. P_0x94e6_false_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94ee_23 :: state_pred where
  \<open>Q_0x94ee_23 \<sigma> \<equiv> RIP \<sigma> = 0x94ee \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94ee_23_def[Qs]

schematic_goal vmdk_write_0_2_0x94e6_0x94ec_23[blocks]:
  assumes \<open>(P_0x94e6_false_23 && P_0x94e6_false_23_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x94ec 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94ee_23 ?\<sigma> \<and> block_usage P_0x94e6_false_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94e6_false_23_def P_0x94e6_false_23_regions_def post: Q_0x94ee_23_def regionset: P_0x94e6_false_23_regions_set_def)

definition P_0x94ee_true_24 :: state_pred where
  \<open>P_0x94ee_true_24 \<sigma> \<equiv> RIP \<sigma> = 0x94ee \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94ee_true_24_def[Ps]

definition P_0x94ee_true_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94ee_true_24_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x94ee_true_24_regions :: state_pred where
  \<open>P_0x94ee_true_24_regions \<sigma> \<equiv> \<exists>regions. P_0x94ee_true_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x963e_24 :: state_pred where
  \<open>Q_0x963e_24 \<sigma> \<equiv> RIP \<sigma> = 0x963e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x963e_24_def[Qs]

schematic_goal vmdk_write_0_1_0x94ee_0x94ee_24[blocks]:
  assumes \<open>(P_0x94ee_true_24 && P_0x94ee_true_24_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x94ee 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x963e_24 ?\<sigma> \<and> block_usage P_0x94ee_true_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94ee_true_24_def P_0x94ee_true_24_regions_def post: Q_0x963e_24_def regionset: P_0x94ee_true_24_regions_set_def)

definition P_0x94ee_false_25 :: state_pred where
  \<open>P_0x94ee_false_25 \<sigma> \<equiv> RIP \<sigma> = 0x94ee \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94ee_false_25_def[Ps]

definition P_0x94ee_false_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94ee_false_25_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x94ee_false_25_regions :: state_pred where
  \<open>P_0x94ee_false_25_regions \<sigma> \<equiv> \<exists>regions. P_0x94ee_false_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94f4_25 :: state_pred where
  \<open>Q_0x94f4_25 \<sigma> \<equiv> RIP \<sigma> = 0x94f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94f4_25_def[Qs]

schematic_goal vmdk_write_0_1_0x94ee_0x94ee_25[blocks]:
  assumes \<open>(P_0x94ee_false_25 && P_0x94ee_false_25_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x94ee 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94f4_25 ?\<sigma> \<and> block_usage P_0x94ee_false_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94ee_false_25_def P_0x94ee_false_25_regions_def post: Q_0x94f4_25_def regionset: P_0x94ee_false_25_regions_set_def)

definition P_0x9566_false_26 :: state_pred where
  \<open>P_0x9566_false_26 \<sigma> \<equiv> RIP \<sigma> = 0x9566 \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))::32 word))::32 word) << 9)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x9566_false_26_def[Ps]

definition P_0x9566_false_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9566_false_26_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x9566_false_26_regions :: state_pred where
  \<open>P_0x9566_false_26_regions \<sigma> \<equiv> \<exists>regions. P_0x9566_false_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17)}))
\<close>

definition Q_0x9597_26 :: state_pred where
  \<open>Q_0x9597_26 \<sigma> \<equiv> RIP \<sigma> = 0x9597 \<and> RAX \<sigma> = ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9) \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x9597_26_def[Qs]

schematic_goal vmdk_write_0_11_0x9566_0x9592_26[blocks]:
  assumes \<open>(P_0x9566_false_26 && P_0x9566_false_26_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 11 0x9592 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9597_26 ?\<sigma> \<and> block_usage P_0x9566_false_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9566_false_26_def P_0x9566_false_26_regions_def post: Q_0x9597_26_def regionset: P_0x9566_false_26_regions_set_def)

definition P_0x9597_27 :: state_pred where
  \<open>P_0x9597_27 \<sigma> \<equiv> RIP \<sigma> = 0x9597 \<and> RAX \<sigma> = ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9) \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x9557 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x9597_27_def[Ps]

definition P_0x9597_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9597_27_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x9597_27_regions :: state_pred where
  \<open>P_0x9597_27_regions \<sigma> \<equiv> \<exists>regions. P_0x9597_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_pwrite_addr_0x9597_27 :: state_pred where
  \<open>Q_bdrv_pwrite_addr_0x9597_27 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = bdrv_pwrite_addr \<and> RAX \<sigma> = ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9) \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_bdrv_pwrite_addr_0x9597_27_def[Qs]

schematic_goal vmdk_write_0_1_0x9597_0x9597_27[blocks]:
  assumes \<open>(P_0x9597_27 && P_0x9597_27_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9597 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_pwrite_addr_0x9597_27 ?\<sigma> \<and> block_usage P_0x9597_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9597_27_def P_0x9597_27_regions_def post: Q_bdrv_pwrite_addr_0x9597_27_def regionset: P_0x9597_27_regions_set_def)

definition P_0x959c_28 :: state_pred where
  \<open>P_0x959c_28 \<sigma> \<equiv> RIP \<sigma> = 0x959c \<and> RAX \<sigma> = bdrv_pwrite_0x9597_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x959c_28_def[Ps]

definition P_0x959c_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x959c_28_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x959c_28_regions :: state_pred where
  \<open>P_0x959c_28_regions \<sigma> \<equiv> \<exists>regions. P_0x959c_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x959f_28 :: state_pred where
  \<open>Q_0x959f_28 \<sigma> \<equiv> RIP \<sigma> = 0x959f \<and> RAX \<sigma> = bdrv_pwrite_0x9597_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x959f_28_def[Qs]

schematic_goal vmdk_write_0_1_0x959c_0x959c_28[blocks]:
  assumes \<open>(P_0x959c_28 && P_0x959c_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x959c 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x959f_28 ?\<sigma> \<and> block_usage P_0x959c_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x959c_28_def P_0x959c_28_regions_def post: Q_0x959f_28_def regionset: P_0x959c_28_regions_set_def)

definition P_0x959f_true_29 :: state_pred where
  \<open>P_0x959f_true_29 \<sigma> \<equiv> RIP \<sigma> = 0x959f \<and> RAX \<sigma> = bdrv_pwrite_0x9597_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x959f_true_29_def[Ps]

definition P_0x959f_true_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x959f_true_29_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x959f_true_29_regions :: state_pred where
  \<open>P_0x959f_true_29_regions \<sigma> \<equiv> \<exists>regions. P_0x959f_true_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95f0_29 :: state_pred where
  \<open>Q_0x95f0_29 \<sigma> \<equiv> RIP \<sigma> = 0x95f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x95f0_29_def[Qs]

schematic_goal vmdk_write_0_1_0x959f_0x959f_29[blocks]:
  assumes \<open>(P_0x959f_true_29 && P_0x959f_true_29_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x959f 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95f0_29 ?\<sigma> \<and> block_usage P_0x959f_true_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x959f_true_29_def P_0x959f_true_29_regions_def post: Q_0x95f0_29_def regionset: P_0x959f_true_29_regions_set_def)

definition P_0x959f_false_30 :: state_pred where
  \<open>P_0x959f_false_30 \<sigma> \<equiv> RIP \<sigma> = 0x959f \<and> RAX \<sigma> = bdrv_pwrite_0x9597_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x959f_false_30_def[Ps]

definition P_0x959f_false_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x959f_false_30_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x959f_false_30_regions :: state_pred where
  \<open>P_0x959f_false_30_regions \<sigma> \<equiv> \<exists>regions. P_0x959f_false_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95ab_30 :: state_pred where
  \<open>Q_0x95ab_30 \<sigma> \<equiv> RIP \<sigma> = 0x95ab \<and> RAX \<sigma> = bdrv_pwrite_0x9597_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x95ab_30_def[Qs]

schematic_goal vmdk_write_0_3_0x959f_0x95a6_30[blocks]:
  assumes \<open>(P_0x959f_false_30 && P_0x959f_false_30_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x95a6 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95ab_30 ?\<sigma> \<and> block_usage P_0x959f_false_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x959f_false_30_def P_0x959f_false_30_regions_def post: Q_0x95ab_30_def regionset: P_0x959f_false_30_regions_set_def)

definition P_0x95ab_true_31 :: state_pred where
  \<open>P_0x95ab_true_31 \<sigma> \<equiv> RIP \<sigma> = 0x95ab \<and> RAX \<sigma> = bdrv_pwrite_0x9597_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x95ab_true_31_def[Ps]

definition P_0x95ab_true_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x95ab_true_31_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x95ab_true_31_regions :: state_pred where
  \<open>P_0x95ab_true_31_regions \<sigma> \<equiv> \<exists>regions. P_0x95ab_true_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94e6_31 :: state_pred where
  \<open>Q_0x94e6_31 \<sigma> \<equiv> RIP \<sigma> = 0x94e6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x94e6_31_def[Qs]

schematic_goal vmdk_write_0_8_0x95ab_0x94e4_31[blocks]:
  assumes \<open>(P_0x95ab_true_31 && P_0x95ab_true_31_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x94e4 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94e6_31 ?\<sigma> \<and> block_usage P_0x95ab_true_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x95ab_true_31_def P_0x95ab_true_31_regions_def post: Q_0x94e6_31_def regionset: P_0x95ab_true_31_regions_set_def)

definition P_0x94e6_true_32 :: state_pred where
  \<open>P_0x94e6_true_32 \<sigma> \<equiv> RIP \<sigma> = 0x94e6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x94e6_true_32_def[Ps]

definition P_0x94e6_true_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94e6_true_32_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x94e6_true_32_regions :: state_pred where
  \<open>P_0x94e6_true_32_regions \<sigma> \<equiv> \<exists>regions. P_0x94e6_true_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x961a_32 :: state_pred where
  \<open>Q_0x961a_32 \<sigma> \<equiv> RIP \<sigma> = 0x961a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x961a_32_def[Qs]

schematic_goal vmdk_write_0_2_0x94e6_0x9618_32[blocks]:
  assumes \<open>(P_0x94e6_true_32 && P_0x94e6_true_32_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x9618 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x961a_32 ?\<sigma> \<and> block_usage P_0x94e6_true_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94e6_true_32_def P_0x94e6_true_32_regions_def post: Q_0x961a_32_def regionset: P_0x94e6_true_32_regions_set_def)

definition P_0x961a_33 :: state_pred where
  \<open>P_0x961a_33 \<sigma> \<equiv> RIP \<sigma> = 0x961a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x961a_33_def[Ps]

definition P_0x961a_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x961a_33_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x961a_33_regions :: state_pred where
  \<open>P_0x961a_33_regions \<sigma> \<equiv> \<exists>regions. P_0x961a_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_time_addr_0x961a_33 :: state_pred where
  \<open>Q_time_addr_0x961a_33 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = time_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_time_addr_0x961a_33_def[Qs]

schematic_goal vmdk_write_0_1_0x961a_0x961a_33[blocks]:
  assumes \<open>(P_0x961a_33 && P_0x961a_33_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x961a 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_time_addr_0x961a_33 ?\<sigma> \<and> block_usage P_0x961a_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x961a_33_def P_0x961a_33_regions_def post: Q_time_addr_0x961a_33_def regionset: P_0x961a_33_regions_set_def)

definition P_0x961f_34 :: state_pred where
  \<open>P_0x961f_34 \<sigma> \<equiv> RIP \<sigma> = 0x961f \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x961f_34_def[Ps]

definition P_0x961f_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x961f_34_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x961f_34_regions :: state_pred where
  \<open>P_0x961f_34_regions \<sigma> \<equiv> \<exists>regions. P_0x961f_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x962a_34 :: state_pred where
  \<open>Q_0x962a_34 \<sigma> \<equiv> RIP \<sigma> = 0x962a \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>time_0x961a_retval::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x962a_34_def[Qs]

schematic_goal vmdk_write_0_3_0x961f_0x9626_34[blocks]:
  assumes \<open>(P_0x961f_34 && P_0x961f_34_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x9626 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x962a_34 ?\<sigma> \<and> block_usage P_0x961f_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x961f_34_def P_0x961f_34_regions_def post: Q_0x962a_34_def regionset: P_0x961f_34_regions_set_def)

definition P_0x962a_35 :: state_pred where
  \<open>P_0x962a_35 \<sigma> \<equiv> RIP \<sigma> = 0x962a \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>time_0x961a_retval::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x962a_35_def[Ps]

definition P_0x962a_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x962a_35_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x962a_35_regions :: state_pred where
  \<open>P_0x962a_35_regions \<sigma> \<equiv> \<exists>regions. P_0x962a_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_vmdk_write_cid_isra_7_addr_0x962a_35 :: state_pred where
  \<open>Q_vmdk_write_cid_isra_7_addr_0x962a_35 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = vmdk_write_cid_isra_7_addr \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>time_0x961a_retval::32 word)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x962f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_vmdk_write_cid_isra_7_addr_0x962a_35_def[Qs]

schematic_goal vmdk_write_0_1_0x962a_0x962a_35[blocks]:
  assumes \<open>(P_0x962a_35 && P_0x962a_35_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x962a 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_vmdk_write_cid_isra_7_addr_0x962a_35 ?\<sigma> \<and> block_usage P_0x962a_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x962a_35_def P_0x962a_35_regions_def post: Q_vmdk_write_cid_isra_7_addr_0x962a_35_def regionset: P_0x962a_35_regions_set_def)

definition P_0x962f_36 :: state_pred where
  \<open>P_0x962f_36 \<sigma> \<equiv> RIP \<sigma> = 0x962f \<and> RAX \<sigma> = vmdk_write_cid_isra_7_0x962a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>time_0x961a_retval::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x962f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x962f_36_def[Ps]

definition P_0x962f_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x962f_36_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x962f_36_regions :: state_pred where
  \<open>P_0x962f_36_regions \<sigma> \<equiv> \<exists>regions. P_0x962f_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x9638_36 :: state_pred where
  \<open>Q_0x9638_36 \<sigma> \<equiv> RIP \<sigma> = 0x9638 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x9638_36_def[Qs]

schematic_goal vmdk_write_0_2_0x962f_0x9636_36[blocks]:
  assumes \<open>(P_0x962f_36 && P_0x962f_36_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x9636 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9638_36 ?\<sigma> \<and> block_usage P_0x962f_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x962f_36_def P_0x962f_36_regions_def post: Q_0x9638_36_def regionset: P_0x962f_36_regions_set_def)

definition P_0x9638_true_37 :: state_pred where
  \<open>P_0x9638_true_37 \<sigma> \<equiv> RIP \<sigma> = 0x9638 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x9638_true_37_def[Ps]

definition P_0x9638_true_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9638_true_37_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x9638_true_37_regions :: state_pred where
  \<open>P_0x9638_true_37_regions \<sigma> \<equiv> \<exists>regions. P_0x9638_true_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94f4_37 :: state_pred where
  \<open>Q_0x94f4_37 \<sigma> \<equiv> RIP \<sigma> = 0x94f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94f4_37_def[Qs]

schematic_goal vmdk_write_0_1_0x9638_0x9638_37[blocks]:
  assumes \<open>(P_0x9638_true_37 && P_0x9638_true_37_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9638 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94f4_37 ?\<sigma> \<and> block_usage P_0x9638_true_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9638_true_37_def P_0x9638_true_37_regions_def post: Q_0x94f4_37_def regionset: P_0x9638_true_37_regions_set_def)

definition P_0x9638_false_38 :: state_pred where
  \<open>P_0x9638_false_38 \<sigma> \<equiv> RIP \<sigma> = 0x9638 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x9638_false_38_def[Ps]

definition P_0x9638_false_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9638_false_38_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x9638_false_38_regions :: state_pred where
  \<open>P_0x9638_false_38_regions \<sigma> \<equiv> \<exists>regions. P_0x9638_false_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x963e_38 :: state_pred where
  \<open>Q_0x963e_38 \<sigma> \<equiv> RIP \<sigma> = 0x963e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x963e_38_def[Qs]

schematic_goal vmdk_write_0_1_0x9638_0x9638_38[blocks]:
  assumes \<open>(P_0x9638_false_38 && P_0x9638_false_38_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9638 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x963e_38 ?\<sigma> \<and> block_usage P_0x9638_false_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9638_false_38_def P_0x9638_false_38_regions_def post: Q_0x963e_38_def regionset: P_0x9638_false_38_regions_set_def)

definition P_0x94e6_false_39 :: state_pred where
  \<open>P_0x94e6_false_39 \<sigma> \<equiv> RIP \<sigma> = 0x94e6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x94e6_false_39_def[Ps]

definition P_0x94e6_false_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94e6_false_39_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x94e6_false_39_regions :: state_pred where
  \<open>P_0x94e6_false_39_regions \<sigma> \<equiv> \<exists>regions. P_0x94e6_false_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94ee_39 :: state_pred where
  \<open>Q_0x94ee_39 \<sigma> \<equiv> RIP \<sigma> = 0x94ee \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94ee_39_def[Qs]

schematic_goal vmdk_write_0_2_0x94e6_0x94ec_39[blocks]:
  assumes \<open>(P_0x94e6_false_39 && P_0x94e6_false_39_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x94ec 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94ee_39 ?\<sigma> \<and> block_usage P_0x94e6_false_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94e6_false_39_def P_0x94e6_false_39_regions_def post: Q_0x94ee_39_def regionset: P_0x94e6_false_39_regions_set_def)

definition P_0x94ee_true_40 :: state_pred where
  \<open>P_0x94ee_true_40 \<sigma> \<equiv> RIP \<sigma> = 0x94ee \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94ee_true_40_def[Ps]

definition P_0x94ee_true_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94ee_true_40_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x94ee_true_40_regions :: state_pred where
  \<open>P_0x94ee_true_40_regions \<sigma> \<equiv> \<exists>regions. P_0x94ee_true_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x963e_40 :: state_pred where
  \<open>Q_0x963e_40 \<sigma> \<equiv> RIP \<sigma> = 0x963e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x963e_40_def[Qs]

schematic_goal vmdk_write_0_1_0x94ee_0x94ee_40[blocks]:
  assumes \<open>(P_0x94ee_true_40 && P_0x94ee_true_40_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x94ee 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x963e_40 ?\<sigma> \<and> block_usage P_0x94ee_true_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94ee_true_40_def P_0x94ee_true_40_regions_def post: Q_0x963e_40_def regionset: P_0x94ee_true_40_regions_set_def)

definition P_0x94ee_false_41 :: state_pred where
  \<open>P_0x94ee_false_41 \<sigma> \<equiv> RIP \<sigma> = 0x94ee \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94ee_false_41_def[Ps]

definition P_0x94ee_false_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94ee_false_41_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x94ee_false_41_regions :: state_pred where
  \<open>P_0x94ee_false_41_regions \<sigma> \<equiv> \<exists>regions. P_0x94ee_false_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94f4_41 :: state_pred where
  \<open>Q_0x94f4_41 \<sigma> \<equiv> RIP \<sigma> = 0x94f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94f4_41_def[Qs]

schematic_goal vmdk_write_0_1_0x94ee_0x94ee_41[blocks]:
  assumes \<open>(P_0x94ee_false_41 && P_0x94ee_false_41_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x94ee 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94f4_41 ?\<sigma> \<and> block_usage P_0x94ee_false_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94ee_false_41_def P_0x94ee_false_41_regions_def post: Q_0x94f4_41_def regionset: P_0x94ee_false_41_regions_set_def)

definition P_0x95ab_false_42 :: state_pred where
  \<open>P_0x95ab_false_42 \<sigma> \<equiv> RIP \<sigma> = 0x95ab \<and> RAX \<sigma> = bdrv_pwrite_0x9597_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x95ab_false_42_def[Ps]

definition P_0x95ab_false_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x95ab_false_42_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (23, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x95ab_false_42_regions :: state_pred where
  \<open>P_0x95ab_false_42_regions \<sigma> \<equiv> \<exists>regions. P_0x95ab_false_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95d9_42 :: state_pred where
  \<open>Q_0x95d9_42 \<sigma> \<equiv> RIP \<sigma> = 0x95d9 \<and> RAX \<sigma> = ((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9) \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x95d9_42_def[Qs]

schematic_goal vmdk_write_0_11_0x95ab_0x95d4_42[blocks]:
  assumes \<open>(P_0x95ab_false_42 && P_0x95ab_false_42_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 11 0x95d4 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95d9_42 ?\<sigma> \<and> block_usage P_0x95ab_false_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x95ab_false_42_def P_0x95ab_false_42_regions_def post: Q_0x95d9_42_def regionset: P_0x95ab_false_42_regions_set_def)

definition P_0x95d9_43 :: state_pred where
  \<open>P_0x95d9_43 \<sigma> \<equiv> RIP \<sigma> = 0x95d9 \<and> RAX \<sigma> = ((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9) \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x959c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x95d9_43_def[Ps]

definition P_0x95d9_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x95d9_43_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (23, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x95d9_43_regions :: state_pred where
  \<open>P_0x95d9_43_regions \<sigma> \<equiv> \<exists>regions. P_0x95d9_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_pwrite_addr_0x95d9_43 :: state_pred where
  \<open>Q_bdrv_pwrite_addr_0x95d9_43 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = bdrv_pwrite_addr \<and> RAX \<sigma> = ((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9) \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x95de \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_bdrv_pwrite_addr_0x95d9_43_def[Qs]

schematic_goal vmdk_write_0_1_0x95d9_0x95d9_43[blocks]:
  assumes \<open>(P_0x95d9_43 && P_0x95d9_43_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x95d9 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_pwrite_addr_0x95d9_43 ?\<sigma> \<and> block_usage P_0x95d9_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x95d9_43_def P_0x95d9_43_regions_def post: Q_bdrv_pwrite_addr_0x95d9_43_def regionset: P_0x95d9_43_regions_set_def)

definition P_0x95de_44 :: state_pred where
  \<open>P_0x95de_44 \<sigma> \<equiv> RIP \<sigma> = 0x95de \<and> RAX \<sigma> = bdrv_pwrite_0x95d9_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x95de \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x95de_44_def[Ps]

definition P_0x95de_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x95de_44_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (23, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x95de_44_regions :: state_pred where
  \<open>P_0x95de_44_regions \<sigma> \<equiv> \<exists>regions. P_0x95de_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95e1_44 :: state_pred where
  \<open>Q_0x95e1_44 \<sigma> \<equiv> RIP \<sigma> = 0x95e1 \<and> RAX \<sigma> = bdrv_pwrite_0x95d9_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x95de \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x95e1_44_def[Qs]

schematic_goal vmdk_write_0_1_0x95de_0x95de_44[blocks]:
  assumes \<open>(P_0x95de_44 && P_0x95de_44_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x95de 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95e1_44 ?\<sigma> \<and> block_usage P_0x95de_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x95de_44_def P_0x95de_44_regions_def post: Q_0x95e1_44_def regionset: P_0x95de_44_regions_set_def)

definition P_0x95e1_true_45 :: state_pred where
  \<open>P_0x95e1_true_45 \<sigma> \<equiv> RIP \<sigma> = 0x95e1 \<and> RAX \<sigma> = bdrv_pwrite_0x95d9_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x95de \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x95e1_true_45_def[Ps]

definition P_0x95e1_true_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x95e1_true_45_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (8, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (24, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x95e1_true_45_regions :: state_pred where
  \<open>P_0x95e1_true_45_regions \<sigma> \<equiv> \<exists>regions. P_0x95e1_true_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94e6_45 :: state_pred where
  \<open>Q_0x94e6_45 \<sigma> \<equiv> RIP \<sigma> = 0x94e6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x95de \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x94e6_45_def[Qs]

schematic_goal vmdk_write_0_8_0x95e1_0x94e4_45[blocks]:
  assumes \<open>(P_0x95e1_true_45 && P_0x95e1_true_45_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x94e4 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94e6_45 ?\<sigma> \<and> block_usage P_0x95e1_true_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x95e1_true_45_def P_0x95e1_true_45_regions_def post: Q_0x94e6_45_def regionset: P_0x95e1_true_45_regions_set_def)

definition P_0x94e6_true_46 :: state_pred where
  \<open>P_0x94e6_true_46 \<sigma> \<equiv> RIP \<sigma> = 0x94e6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x95de \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x94e6_true_46_def[Ps]

definition P_0x94e6_true_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94e6_true_46_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (8, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (24, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x94e6_true_46_regions :: state_pred where
  \<open>P_0x94e6_true_46_regions \<sigma> \<equiv> \<exists>regions. P_0x94e6_true_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x961a_46 :: state_pred where
  \<open>Q_0x961a_46 \<sigma> \<equiv> RIP \<sigma> = 0x961a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x95de \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x961a_46_def[Qs]

schematic_goal vmdk_write_0_2_0x94e6_0x9618_46[blocks]:
  assumes \<open>(P_0x94e6_true_46 && P_0x94e6_true_46_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x9618 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x961a_46 ?\<sigma> \<and> block_usage P_0x94e6_true_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94e6_true_46_def P_0x94e6_true_46_regions_def post: Q_0x961a_46_def regionset: P_0x94e6_true_46_regions_set_def)

definition P_0x961a_47 :: state_pred where
  \<open>P_0x961a_47 \<sigma> \<equiv> RIP \<sigma> = 0x961a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x95de \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x961a_47_def[Ps]

definition P_0x961a_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x961a_47_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (8, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (24, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x961a_47_regions :: state_pred where
  \<open>P_0x961a_47_regions \<sigma> \<equiv> \<exists>regions. P_0x961a_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_time_addr_0x961a_47 :: state_pred where
  \<open>Q_time_addr_0x961a_47 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = time_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_time_addr_0x961a_47_def[Qs]

schematic_goal vmdk_write_0_1_0x961a_0x961a_47[blocks]:
  assumes \<open>(P_0x961a_47 && P_0x961a_47_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x961a 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_time_addr_0x961a_47 ?\<sigma> \<and> block_usage P_0x961a_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x961a_47_def P_0x961a_47_regions_def post: Q_time_addr_0x961a_47_def regionset: P_0x961a_47_regions_set_def)

definition P_0x961f_48 :: state_pred where
  \<open>P_0x961f_48 \<sigma> \<equiv> RIP \<sigma> = 0x961f \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x961f_48_def[Ps]

definition P_0x961f_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x961f_48_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (8, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (24, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x961f_48_regions :: state_pred where
  \<open>P_0x961f_48_regions \<sigma> \<equiv> \<exists>regions. P_0x961f_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x962a_48 :: state_pred where
  \<open>Q_0x962a_48 \<sigma> \<equiv> RIP \<sigma> = 0x962a \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>time_0x961a_retval::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x962a_48_def[Qs]

schematic_goal vmdk_write_0_3_0x961f_0x9626_48[blocks]:
  assumes \<open>(P_0x961f_48 && P_0x961f_48_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x9626 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x962a_48 ?\<sigma> \<and> block_usage P_0x961f_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x961f_48_def P_0x961f_48_regions_def post: Q_0x962a_48_def regionset: P_0x961f_48_regions_set_def)

definition P_0x962a_49 :: state_pred where
  \<open>P_0x962a_49 \<sigma> \<equiv> RIP \<sigma> = 0x962a \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>time_0x961a_retval::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x961f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x962a_49_def[Ps]

definition P_0x962a_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x962a_49_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (8, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (24, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x962a_49_regions :: state_pred where
  \<open>P_0x962a_49_regions \<sigma> \<equiv> \<exists>regions. P_0x962a_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_vmdk_write_cid_isra_7_addr_0x962a_49 :: state_pred where
  \<open>Q_vmdk_write_cid_isra_7_addr_0x962a_49 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = vmdk_write_cid_isra_7_addr \<and> RAX \<sigma> = time_0x961a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>time_0x961a_retval::32 word)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x962f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_vmdk_write_cid_isra_7_addr_0x962a_49_def[Qs]

schematic_goal vmdk_write_0_1_0x962a_0x962a_49[blocks]:
  assumes \<open>(P_0x962a_49 && P_0x962a_49_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x962a 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_vmdk_write_cid_isra_7_addr_0x962a_49 ?\<sigma> \<and> block_usage P_0x962a_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x962a_49_def P_0x962a_49_regions_def post: Q_vmdk_write_cid_isra_7_addr_0x962a_49_def regionset: P_0x962a_49_regions_set_def)

definition P_0x962f_50 :: state_pred where
  \<open>P_0x962f_50 \<sigma> \<equiv> RIP \<sigma> = 0x962f \<and> RAX \<sigma> = vmdk_write_cid_isra_7_0x962a_retval \<and> RCX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>time_0x961a_retval::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x962f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x962f_50_def[Ps]

definition P_0x962f_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x962f_50_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (8, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (24, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x962f_50_regions :: state_pred where
  \<open>P_0x962f_50_regions \<sigma> \<equiv> \<exists>regions. P_0x962f_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x9638_50 :: state_pred where
  \<open>Q_0x9638_50 \<sigma> \<equiv> RIP \<sigma> = 0x9638 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x9638_50_def[Qs]

schematic_goal vmdk_write_0_2_0x962f_0x9636_50[blocks]:
  assumes \<open>(P_0x962f_50 && P_0x962f_50_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x9636 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9638_50 ?\<sigma> \<and> block_usage P_0x962f_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x962f_50_def P_0x962f_50_regions_def post: Q_0x9638_50_def regionset: P_0x962f_50_regions_set_def)

definition P_0x9638_true_51 :: state_pred where
  \<open>P_0x9638_true_51 \<sigma> \<equiv> RIP \<sigma> = 0x9638 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x9638_true_51_def[Ps]

definition P_0x9638_true_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9638_true_51_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x9638_true_51_regions :: state_pred where
  \<open>P_0x9638_true_51_regions \<sigma> \<equiv> \<exists>regions. P_0x9638_true_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94f4_51 :: state_pred where
  \<open>Q_0x94f4_51 \<sigma> \<equiv> RIP \<sigma> = 0x94f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94f4_51_def[Qs]

schematic_goal vmdk_write_0_1_0x9638_0x9638_51[blocks]:
  assumes \<open>(P_0x9638_true_51 && P_0x9638_true_51_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9638 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94f4_51 ?\<sigma> \<and> block_usage P_0x9638_true_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9638_true_51_def P_0x9638_true_51_regions_def post: Q_0x94f4_51_def regionset: P_0x9638_true_51_regions_set_def)

definition P_0x9638_false_52 :: state_pred where
  \<open>P_0x9638_false_52 \<sigma> \<equiv> RIP \<sigma> = 0x9638 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x9638_false_52_def[Ps]

definition P_0x9638_false_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9638_false_52_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x9638_false_52_regions :: state_pred where
  \<open>P_0x9638_false_52_regions \<sigma> \<equiv> \<exists>regions. P_0x9638_false_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x963e_52 :: state_pred where
  \<open>Q_0x963e_52 \<sigma> \<equiv> RIP \<sigma> = 0x963e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x963e_52_def[Qs]

schematic_goal vmdk_write_0_1_0x9638_0x9638_52[blocks]:
  assumes \<open>(P_0x9638_false_52 && P_0x9638_false_52_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9638 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x963e_52 ?\<sigma> \<and> block_usage P_0x9638_false_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9638_false_52_def P_0x9638_false_52_regions_def post: Q_0x963e_52_def regionset: P_0x9638_false_52_regions_set_def)

definition P_0x94e6_false_53 :: state_pred where
  \<open>P_0x94e6_false_53 \<sigma> \<equiv> RIP \<sigma> = 0x94e6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a360,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a360,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x95de \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x94e6_false_53_def[Ps]

definition P_0x94e6_false_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94e6_false_53_regions_set \<sigma> \<equiv> {
    (0, 0x2a360, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (8, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (24, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x94e6_false_53_regions :: state_pred where
  \<open>P_0x94e6_false_53_regions \<sigma> \<equiv> \<exists>regions. P_0x94e6_false_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94ee_53 :: state_pred where
  \<open>Q_0x94ee_53 \<sigma> \<equiv> RIP \<sigma> = 0x94ee \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94ee_53_def[Qs]

schematic_goal vmdk_write_0_2_0x94e6_0x94ec_53[blocks]:
  assumes \<open>(P_0x94e6_false_53 && P_0x94e6_false_53_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x94ec 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94ee_53 ?\<sigma> \<and> block_usage P_0x94e6_false_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94e6_false_53_def P_0x94e6_false_53_regions_def post: Q_0x94ee_53_def regionset: P_0x94e6_false_53_regions_set_def)

definition P_0x94ee_true_54 :: state_pred where
  \<open>P_0x94ee_true_54 \<sigma> \<equiv> RIP \<sigma> = 0x94ee \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94ee_true_54_def[Ps]

definition P_0x94ee_true_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94ee_true_54_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x94ee_true_54_regions :: state_pred where
  \<open>P_0x94ee_true_54_regions \<sigma> \<equiv> \<exists>regions. P_0x94ee_true_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x963e_54 :: state_pred where
  \<open>Q_0x963e_54 \<sigma> \<equiv> RIP \<sigma> = 0x963e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x963e_54_def[Qs]

schematic_goal vmdk_write_0_1_0x94ee_0x94ee_54[blocks]:
  assumes \<open>(P_0x94ee_true_54 && P_0x94ee_true_54_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x94ee 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x963e_54 ?\<sigma> \<and> block_usage P_0x94ee_true_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94ee_true_54_def P_0x94ee_true_54_regions_def post: Q_0x963e_54_def regionset: P_0x94ee_true_54_regions_set_def)

definition P_0x94ee_false_55 :: state_pred where
  \<open>P_0x94ee_false_55 \<sigma> \<equiv> RIP \<sigma> = 0x94ee \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94ee_false_55_def[Ps]

definition P_0x94ee_false_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94ee_false_55_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x94ee_false_55_regions :: state_pred where
  \<open>P_0x94ee_false_55_regions \<sigma> \<equiv> \<exists>regions. P_0x94ee_false_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x94f4_55 :: state_pred where
  \<open>Q_0x94f4_55 \<sigma> \<equiv> RIP \<sigma> = 0x94f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x94f4_55_def[Qs]

schematic_goal vmdk_write_0_1_0x94ee_0x94ee_55[blocks]:
  assumes \<open>(P_0x94ee_false_55 && P_0x94ee_false_55_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x94ee 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x94f4_55 ?\<sigma> \<and> block_usage P_0x94ee_false_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94ee_false_55_def P_0x94ee_false_55_regions_def post: Q_0x94f4_55_def regionset: P_0x94ee_false_55_regions_set_def)

definition P_0x95e1_false_56 :: state_pred where
  \<open>P_0x95e1_false_56 \<sigma> \<equiv> RIP \<sigma> = 0x95e1 \<and> RAX \<sigma> = bdrv_pwrite_0x95d9_retval \<and> RBX \<sigma> = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))) \<and> RCX \<sigma> = 0x4 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = ((((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word))::64 word) << 9)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::64 word)::64 word) * 0x4)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R15 \<sigma> = ucast (((ucast (((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word) >s (\<langle>31,0\<rangle>RBP \<sigma>::32 word) then (\<langle>31,0\<rangle>RBP \<sigma>::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>R12 \<sigma>::32 word)))::32 word))::32 word))::32 word) << 9)) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x4c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x95de \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x95e1_false_56_def[Ps]

definition P_0x95e1_false_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x95e1_false_56_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc0), 4),
    (7, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x48), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x4c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (23, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x95e1_false_56_regions :: state_pred where
  \<open>P_0x95e1_false_56_regions \<sigma> \<equiv> \<exists>regions. P_0x95e1_false_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95e7_56 :: state_pred where
  \<open>Q_0x95e7_56 \<sigma> \<equiv> RIP \<sigma> = 0x95e7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x95e7_56_def[Qs]

schematic_goal vmdk_write_0_1_0x95e1_0x95e1_56[blocks]:
  assumes \<open>(P_0x95e1_false_56 && P_0x95e1_false_56_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x95e1 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95e7_56 ?\<sigma> \<and> block_usage P_0x95e1_false_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x95e1_false_56_def P_0x95e1_false_56_regions_def post: Q_0x95e7_56_def regionset: P_0x95e1_false_56_regions_set_def)

definition P_0x963e_57 :: state_pred where
  \<open>P_0x963e_57 \<sigma> \<equiv> RIP \<sigma> = 0x963e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x963e_57_def[Ps]

definition P_0x963e_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x963e_57_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x963e_57_regions :: state_pred where
  \<open>P_0x963e_57_regions \<sigma> \<equiv> \<exists>regions. P_0x963e_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95f5_57 :: state_pred where
  \<open>Q_0x95f5_57 \<sigma> \<equiv> RIP \<sigma> = 0x95f5 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x95f5_57_def[Qs]

schematic_goal vmdk_write_0_2_0x963e_0x9640_57[blocks]:
  assumes \<open>(P_0x963e_57 && P_0x963e_57_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x9640 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95f5_57 ?\<sigma> \<and> block_usage P_0x963e_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x963e_57_def P_0x963e_57_regions_def post: Q_0x95f5_57_def regionset: P_0x963e_57_regions_set_def)

definition P_0x95f0_58 :: state_pred where
  \<open>P_0x95f0_58 \<sigma> \<equiv> RIP \<sigma> = 0x95f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x95f0_58_def[Ps]

definition P_0x95f0_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x95f0_58_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x95f0_58_regions :: state_pred where
  \<open>P_0x95f0_58_regions \<sigma> \<equiv> \<exists>regions. P_0x95f0_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95f5_58 :: state_pred where
  \<open>Q_0x95f5_58 \<sigma> \<equiv> RIP \<sigma> = 0x95f5 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x95f5_58_def[Qs]

schematic_goal vmdk_write_0_1_0x95f0_0x95f0_58[blocks]:
  assumes \<open>(P_0x95f0_58 && P_0x95f0_58_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x95f0 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95f5_58 ?\<sigma> \<and> block_usage P_0x95f0_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x95f0_58_def P_0x95f0_58_regions_def post: Q_0x95f5_58_def regionset: P_0x95f0_58_regions_set_def)

definition P_0x95e7_59 :: state_pred where
  \<open>P_0x95e7_59 \<sigma> \<equiv> RIP \<sigma> = 0x95e7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x95e7_59_def[Ps]

definition P_0x95e7_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x95e7_59_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x95e7_59_regions :: state_pred where
  \<open>P_0x95e7_59_regions \<sigma> \<equiv> \<exists>regions. P_0x95e7_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95f0_59 :: state_pred where
  \<open>Q_0x95f0_59 \<sigma> \<equiv> RIP \<sigma> = 0x95f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x95f0_59_def[Qs]

schematic_goal vmdk_write_0_1_0x95e7_0x95e7_59[blocks]:
  assumes \<open>(P_0x95e7_59 && P_0x95e7_59_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x95e7 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95f0_59 ?\<sigma> \<and> block_usage P_0x95e7_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x95e7_59_def P_0x95e7_59_regions_def post: Q_0x95f0_59_def regionset: P_0x95e7_59_regions_set_def)

definition P_0x95f0_60 :: state_pred where
  \<open>P_0x95f0_60 \<sigma> \<equiv> RIP \<sigma> = 0x95f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x95f0_60_def[Ps]

definition P_0x95f0_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x95f0_60_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x95f0_60_regions :: state_pred where
  \<open>P_0x95f0_60_regions \<sigma> \<equiv> \<exists>regions. P_0x95f0_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95f5_60 :: state_pred where
  \<open>Q_0x95f5_60 \<sigma> \<equiv> RIP \<sigma> = 0x95f5 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x95f5_60_def[Qs]

schematic_goal vmdk_write_0_1_0x95f0_0x95f0_60[blocks]:
  assumes \<open>(P_0x95f0_60 && P_0x95f0_60_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x95f0 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95f5_60 ?\<sigma> \<and> block_usage P_0x95f0_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x95f0_60_def P_0x95f0_60_regions_def post: Q_0x95f5_60_def regionset: P_0x95f0_60_regions_set_def)

definition P_0x94c7_false_61 :: state_pred where
  \<open>P_0x94c7_false_61 \<sigma> \<equiv> RIP \<sigma> = 0x94c7 \<and> RAX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x94c7_false_61_def[Ps]

definition P_0x94c7_false_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x94c7_false_61_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x94c7_false_61_regions :: state_pred where
  \<open>P_0x94c7_false_61_regions \<sigma> \<equiv> \<exists>regions. P_0x94c7_false_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x963e_61 :: state_pred where
  \<open>Q_0x963e_61 \<sigma> \<equiv> RIP \<sigma> = 0x963e \<and> RAX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x963e_61_def[Qs]

schematic_goal vmdk_write_0_2_0x94c7_0x94c9_61[blocks]:
  assumes \<open>(P_0x94c7_false_61 && P_0x94c7_false_61_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x94c9 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x963e_61 ?\<sigma> \<and> block_usage P_0x94c7_false_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x94c7_false_61_def P_0x94c7_false_61_regions_def post: Q_0x963e_61_def regionset: P_0x94c7_false_61_regions_set_def)

definition P_0x963e_62 :: state_pred where
  \<open>P_0x963e_62 \<sigma> \<equiv> RIP \<sigma> = 0x963e \<and> RAX \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x963e_62_def[Ps]

definition P_0x963e_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x963e_62_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x963e_62_regions :: state_pred where
  \<open>P_0x963e_62_regions \<sigma> \<equiv> \<exists>regions. P_0x963e_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x95f5_62 :: state_pred where
  \<open>Q_0x95f5_62 \<sigma> \<equiv> RIP \<sigma> = 0x95f5 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x95f5_62_def[Qs]

schematic_goal vmdk_write_0_2_0x963e_0x9640_62[blocks]:
  assumes \<open>(P_0x963e_62 && P_0x963e_62_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x9640 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x95f5_62 ?\<sigma> \<and> block_usage P_0x963e_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x963e_62_def P_0x963e_62_regions_def post: Q_0x95f5_62_def regionset: P_0x963e_62_regions_set_def)

definition P_0x95f5_63 :: state_pred where
  \<open>P_0x95f5_63 \<sigma> \<equiv> RIP \<sigma> = 0x95f5 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x95f5_63_def[Ps]

definition P_0x95f5_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x95f5_63_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x95f5_63_regions :: state_pred where
  \<open>P_0x95f5_63_regions \<sigma> \<equiv> \<exists>regions. P_0x95f5_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x9603_63 :: state_pred where
  \<open>Q_0x9603_63 \<sigma> \<equiv> RIP \<sigma> = 0x9603 \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x9603_63_def[Qs]

schematic_goal vmdk_write_0_2_0x95f5_0x95fa_63[blocks]:
  assumes \<open>(P_0x95f5_63 && P_0x95f5_63_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x95fa 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9603_63 ?\<sigma> \<and> block_usage P_0x95f5_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x95f5_63_def P_0x95f5_63_regions_def post: Q_0x9603_63_def regionset: P_0x95f5_63_regions_set_def)

definition P_0x9603_true_64 :: state_pred where
  \<open>P_0x9603_true_64 \<sigma> \<equiv> RIP \<sigma> = 0x9603 \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x9603_true_64_def[Ps]

definition P_0x9603_true_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9603_true_64_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x9603_true_64_regions :: state_pred where
  \<open>P_0x9603_true_64_regions \<sigma> \<equiv> \<exists>regions. P_0x9603_true_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x9666_64 :: state_pred where
  \<open>Q_0x9666_64 \<sigma> \<equiv> RIP \<sigma> = 0x9666 \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x9666_64_def[Qs]

schematic_goal vmdk_write_0_1_0x9603_0x9603_64[blocks]:
  assumes \<open>(P_0x9603_true_64 && P_0x9603_true_64_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9603 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x9666_64 ?\<sigma> \<and> block_usage P_0x9603_true_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9603_true_64_def P_0x9603_true_64_regions_def post: Q_0x9666_64_def regionset: P_0x9603_true_64_regions_set_def)

definition P_0x9666_65 :: state_pred where
  \<open>P_0x9666_65 \<sigma> \<equiv> RIP \<sigma> = 0x9666 \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x9666_65_def[Ps]

definition P_0x9666_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9666_65_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x9666_65_regions :: state_pred where
  \<open>P_0x9666_65_regions \<sigma> \<equiv> \<exists>regions. P_0x9666_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x9666_65 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x9666_65 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RCX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_stack_chk_fail_addr_0x9666_65_def[Qs]

schematic_goal vmdk_write_0_1_0x9666_0x9666_65[blocks]:
  assumes \<open>(P_0x9666_65 && P_0x9666_65_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x9666 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x9666_65 ?\<sigma> \<and> block_usage P_0x9666_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9666_65_def P_0x9666_65_regions_def post: Q_stack_chk_fail_addr_0x9666_65_def regionset: P_0x9666_65_regions_set_def)

definition P_0x9603_false_66 :: state_pred where
  \<open>P_0x9603_false_66 \<sigma> \<equiv> RIP \<sigma> = 0x9603 \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x9603_false_66_def[Ps]

definition P_0x9603_false_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x9603_false_66_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x68), 8)
  }\<close>

definition P_0x9603_false_66_regions :: state_pred where
  \<open>P_0x9603_false_66_regions \<sigma> \<equiv> \<exists>regions. P_0x9603_false_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_66 :: state_pred where
  \<open>Q_ret_address_66 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RCX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_66_def[Qs]

schematic_goal vmdk_write_0_9_0x9603_0x9613_66[blocks]:
  assumes \<open>(P_0x9603_false_66 && P_0x9603_false_66_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x9613 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_66 ?\<sigma> \<and> block_usage P_0x9603_false_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x9603_false_66_def P_0x9603_false_66_regions_def post: Q_ret_address_66_def regionset: P_0x9603_false_66_regions_set_def)

definition vmdk_write_acode :: ACode where
  \<open>vmdk_write_acode =
    Block 16 0x94af 0;
    IF jl THEN
      Block 6 0x9655 (Suc 0);
      Block (Suc 0) 0x965a 2;
      CALL fprintf_chk_acode;
      Block 2 0x9664 3
    ELSE
      Block 5 0x94c5 4;
      IF jg THEN
        Block (Suc 0) 0x94c7 5;
        WHILE P_0x94f4_6 DO
          Block 12 0x9521 6;
          Block (Suc 0) 0x9525 7;
          CALL get_cluster_offset_acode;
          Block 2 0x952f 8;
          IF ZF THEN
            Block (Suc 0) 0x9532 9
          ELSE
            Block 9 0x954f 10;
            Block (Suc 0) 0x9552 11;
            CALL bdrv_pwrite_acode;
            Block (Suc 0) 0x9557 12;
            IF !ZF THEN
              Block (Suc 0) 0x955a 13
            ELSE
              Block 3 0x9564 14;
              IF ZF THEN
                Block 8 0x94e4 15;
                IF ZF THEN
                  Block 2 0x9618 16;
                  Block (Suc 0) 0x961a 17;
                  CALL time_acode;
                  Block 3 0x9626 18;
                  Block (Suc 0) 0x962a 19;
                  CALL vmdk_write_cid_isra_7_acode;
                  Block 2 0x9636 20;
                  IF jg THEN
                    Block (Suc 0) 0x9638 21
                  ELSE
                    Block (Suc 0) 0x9638 22
                  FI
                ELSE
                  Block 2 0x94ec 23;
                  IF jle THEN
                    Block (Suc 0) 0x94ee 24
                  ELSE
                    Block (Suc 0) 0x94ee 25
                  FI
                FI
              ELSE
                Block 11 0x9592 26;
                Block (Suc 0) 0x9597 27;
                CALL bdrv_pwrite_acode;
                Block (Suc 0) 0x959c 28;
                IF !ZF THEN
                  Block (Suc 0) 0x959f 29
                ELSE
                  Block 3 0x95a6 30;
                  IF ZF THEN
                    Block 8 0x94e4 31;
                    IF ZF THEN
                      Block 2 0x9618 32;
                      Block (Suc 0) 0x961a 33;
                      CALL time_acode;
                      Block 3 0x9626 34;
                      Block (Suc 0) 0x962a 35;
                      CALL vmdk_write_cid_isra_7_acode;
                      Block 2 0x9636 36;
                      IF jg THEN
                        Block (Suc 0) 0x9638 37
                      ELSE
                        Block (Suc 0) 0x9638 38
                      FI
                    ELSE
                      Block 2 0x94ec 39;
                      IF jle THEN
                        Block (Suc 0) 0x94ee 40
                      ELSE
                        Block (Suc 0) 0x94ee 41
                      FI
                    FI
                  ELSE
                    Block 11 0x95d4 42;
                    Block (Suc 0) 0x95d9 43;
                    CALL bdrv_pwrite_acode;
                    Block (Suc 0) 0x95de 44;
                    IF ZF THEN
                      Block 8 0x94e4 45;
                      IF ZF THEN
                        Block 2 0x9618 46;
                        Block (Suc 0) 0x961a 47;
                        CALL time_acode;
                        Block 3 0x9626 48;
                        Block (Suc 0) 0x962a 49;
                        CALL vmdk_write_cid_isra_7_acode;
                        Block 2 0x9636 50;
                        IF jg THEN
                          Block (Suc 0) 0x9638 51
                        ELSE
                          Block (Suc 0) 0x9638 52
                        FI
                      ELSE
                        Block 2 0x94ec 53;
                        IF jle THEN
                          Block (Suc 0) 0x94ee 54
                        ELSE
                          Block (Suc 0) 0x94ee 55
                        FI
                      FI
                    ELSE
                      Block (Suc 0) 0x95e1 56
                    FI
                  FI
                FI
              FI
            FI
          FI
        OD;
        CASES [
          (P_0x963e_57,
            Block 2 0x9640 57
          ),
          (P_0x95f0_58,
            Block (Suc 0) 0x95f0 58
          ),
          (P_0x95e7_59,
            Block (Suc 0) 0x95e7 59;
            Block (Suc 0) 0x95f0 60
          )
        ]
      ELSE
        Block 2 0x94c9 61;
        Block 2 0x9640 62
      FI
    FI;
    Block 2 0x95fa 63;
    IF !ZF THEN
      Block (Suc 0) 0x9603 64;
      Block (Suc 0) 0x9666 65;
      CALL stack_chk_fail_acode
    ELSE
      Block 9 0x9613 66
    FI
  \<close>

schematic_goal "vmdk_write":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94b2 \<longrightarrow> P_0x94b2_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x965a \<longrightarrow> P_0x965a_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x965f \<longrightarrow> P_0x965f_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94b2 \<longrightarrow> P_0x94b2_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94c7 \<longrightarrow> P_0x94c7_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94f4 \<longrightarrow> P_0x94f4_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9525 \<longrightarrow> P_0x9525_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x952a \<longrightarrow> P_0x952a_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9532 \<longrightarrow> P_0x9532_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9532 \<longrightarrow> P_0x9532_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9552 \<longrightarrow> P_0x9552_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9557 \<longrightarrow> P_0x9557_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x955a \<longrightarrow> P_0x955a_true_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x955a \<longrightarrow> P_0x955a_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9566 \<longrightarrow> P_0x9566_true_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94e6 \<longrightarrow> P_0x94e6_true_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x961a \<longrightarrow> P_0x961a_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x961f \<longrightarrow> P_0x961f_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x962a \<longrightarrow> P_0x962a_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x962f \<longrightarrow> P_0x962f_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9638 \<longrightarrow> P_0x9638_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9638 \<longrightarrow> P_0x9638_false_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94e6 \<longrightarrow> P_0x94e6_false_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94ee \<longrightarrow> P_0x94ee_true_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94ee \<longrightarrow> P_0x94ee_false_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9566 \<longrightarrow> P_0x9566_false_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9597 \<longrightarrow> P_0x9597_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x959c \<longrightarrow> P_0x959c_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x959f \<longrightarrow> P_0x959f_true_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x959f \<longrightarrow> P_0x959f_false_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x95ab \<longrightarrow> P_0x95ab_true_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94e6 \<longrightarrow> P_0x94e6_true_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x961a \<longrightarrow> P_0x961a_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x961f \<longrightarrow> P_0x961f_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x962a \<longrightarrow> P_0x962a_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x962f \<longrightarrow> P_0x962f_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9638 \<longrightarrow> P_0x9638_true_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9638 \<longrightarrow> P_0x9638_false_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94e6 \<longrightarrow> P_0x94e6_false_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94ee \<longrightarrow> P_0x94ee_true_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94ee \<longrightarrow> P_0x94ee_false_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x95ab \<longrightarrow> P_0x95ab_false_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x95d9 \<longrightarrow> P_0x95d9_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x95de \<longrightarrow> P_0x95de_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x95e1 \<longrightarrow> P_0x95e1_true_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94e6 \<longrightarrow> P_0x94e6_true_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x961a \<longrightarrow> P_0x961a_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x961f \<longrightarrow> P_0x961f_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x962a \<longrightarrow> P_0x962a_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x962f \<longrightarrow> P_0x962f_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9638 \<longrightarrow> P_0x9638_true_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9638 \<longrightarrow> P_0x9638_false_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94e6 \<longrightarrow> P_0x94e6_false_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94ee \<longrightarrow> P_0x94ee_true_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94ee \<longrightarrow> P_0x94ee_false_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x95e1 \<longrightarrow> P_0x95e1_false_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x963e \<longrightarrow> P_0x963e_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x95f0 \<longrightarrow> P_0x95f0_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x95e7 \<longrightarrow> P_0x95e7_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x95f0 \<longrightarrow> P_0x95f0_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x94c7 \<longrightarrow> P_0x94c7_false_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x963e \<longrightarrow> P_0x963e_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x95f5 \<longrightarrow> P_0x95f5_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9603 \<longrightarrow> P_0x9603_true_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9666 \<longrightarrow> P_0x9666_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x9603 \<longrightarrow> P_0x9603_false_66_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x965a_2}} \<box>fprintf_chk_acode {{P_0x965f_3;M_0x965a}}\<close>
    and [blocks]: \<open>{{Q_get_cluster_offset_addr_0x9525_7}} \<box>get_cluster_offset_acode {{P_0x952a_8;M_0x9525}}\<close>
    and [blocks]: \<open>{{Q_bdrv_pwrite_addr_0x9552_11}} \<box>bdrv_pwrite_acode {{P_0x9557_12;M_0x9552}}\<close>
    and [blocks]: \<open>{{Q_time_addr_0x961a_17}} \<box>time_acode {{P_0x961f_18;M_0x961a}}\<close>
    and [blocks]: \<open>{{Q_vmdk_write_cid_isra_7_addr_0x962a_19}} \<box>vmdk_write_cid_isra_7_acode {{P_0x962f_20;M_0x962a}}\<close>
    and [blocks]: \<open>{{Q_bdrv_pwrite_addr_0x9597_27}} \<box>bdrv_pwrite_acode {{P_0x959c_28;M_0x9597}}\<close>
    and [blocks]: \<open>{{Q_time_addr_0x961a_33}} \<box>time_acode {{P_0x961f_34;M_0x961a}}\<close>
    and [blocks]: \<open>{{Q_vmdk_write_cid_isra_7_addr_0x962a_35}} \<box>vmdk_write_cid_isra_7_acode {{P_0x962f_36;M_0x962a}}\<close>
    and [blocks]: \<open>{{Q_bdrv_pwrite_addr_0x95d9_43}} \<box>bdrv_pwrite_acode {{P_0x95de_44;M_0x95d9}}\<close>
    and [blocks]: \<open>{{Q_time_addr_0x961a_47}} \<box>time_acode {{P_0x961f_48;M_0x961a}}\<close>
    and [blocks]: \<open>{{Q_vmdk_write_cid_isra_7_addr_0x962a_49}} \<box>vmdk_write_cid_isra_7_acode {{P_0x962f_50;M_0x962a}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x9666_65}} \<box>stack_chk_fail_acode {{Q_fail;M_0x9666}}\<close>
  shows \<open>{{?P}} vmdk_write_acode {{?Q;?M}}\<close>
  apply (vcg acode: vmdk_write_acode_def assms: assms)

  apply (rule htriples)+
  apply (rule HTriple_weaken[where P="P_0x94f4_6 || P_0x963e_57 || P_0x95f0_58 || P_0x95e7_59"])
  apply (simp add: pred_logic Ps Qs assms)
  apply (rule HTriple_while)
  apply (vcg_step assms: assms)+
  apply (auto simp add: Ps Qs pred_logic assms)[1]
  apply (vcg_step' assms: assms | vcg_step assms: assms)
  apply (vcg_step assms: assms)+
  done
end
